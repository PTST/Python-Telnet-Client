from PyQt4 import QtGui
from PyQt4 import QtCore
import sys
import design
import telnetlib
import time

user = "support"
port = "23023"
acs = "wireless acs rescan"
cnt = "connection stats"

class EmittingStream(QtCore.QObject):

    textWritten = QtCore.pyqtSignal(str)

    def write(self, text):
        self.textWritten.emit(str(text))

class ExampleApp(QtGui.QMainWindow, design.Ui_MainWindow):
    def __init__(self, parent=None):
        super(ExampleApp, self).__init__(parent)
        self.setupUi(self)
        self.cntbttn.clicked.connect(self.cntstats)
        sys.stdout = EmittingStream(textWritten=self.normalOutputWritten)
       
        
    def __del__(self):
        # Restore sys.stdout
        sys.stdout = sys.__stdout__
        
    def normalOutputWritten(self, text):
        """Append text to the QTextEdit."""
        # Maybe QTextEdit.append() works as well, but this is how I do it:
        cursor = self.textEdit.textCursor()
        cursor.movePosition(QtGui.QTextCursor.End)
        cursor.insertText(text)
        self.textEdit.setTextCursor(cursor)
        self.textEdit.ensureCursorVisible()    
        
        
    def cntstats(self):
        HOST = str(self.RouterIP.text())
        password = str(self.rootPassword.text())
        tn = telnetlib.Telnet()
        
        tn.set_debuglevel(0)
        tn.open(HOST, port, 10)
        tn.read_until("Username : ")
        time.sleep(1)
        tn.write(user + "\r\n")
        if password:
            tn.read_until("Password : ")
            time.sleep(1)
            tn.write(password + "\r\n")
        
        tn.read_until("MediaAccess")
        time.sleep(1)
        tn.write("connection stats\r\n")
        tn.write("exit\r\n")
        
        print tn.read_all()        
        
        
def main():
    app = QtGui.QApplication(sys.argv)
    form = ExampleApp()
    form.show()
    app.exec_()
    
if __name__ == '__main__':
    main()