#!/usr/bin/env python
# -*- coding: utf-8 -*-

from PyQt4 import QtGui
from PyQt4 import QtCore
import sys
import design
import telnetlib
import time

userip = "85.81.8.40"
rootpw = "daca1ea1fb"
user = "support"
port = "23023"
acs = "wireless acs rescan\r\n wireless acs scanreport"
cnt = "connection stats"








class EmittingStream(QtCore.QObject):

    textWritten = QtCore.pyqtSignal(str)

    def write(self, text):
        self.textWritten.emit(str(text))

class ExampleApp(QtGui.QMainWindow, design.Ui_MainWindow):
    def __init__(self, parent=None):
        super(ExampleApp, self).__init__(parent)
        self.setupUi(self)
        self.cntbttn.clicked.connect(self.cntset)
        self.cntbttn.clicked.connect(self.cpeconnect)
        self.acsbttn.clicked.connect(self.acsset)
        self.acsbttn.clicked.connect(self.cpeconnect)
        self.portbttn.clicked.connect(self.portset)
        sys.stdout = EmittingStream(textWritten=self.normalOutputWritten)
        
        pfwlist = [
            self.trUtf8('Portforward liste'),
            self.tr('Chromecast'),
            self.tr('Apple TV'),
            self.tr('Playstation 4'),
        ]          
        self.comboBox.clear()
        self.comboBox.addItems(pfwlist)        
              
    def portset(self):
        print "success"
        
        
        
        
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
        
    def cntset(self):
        global command
        command = cnt
        
    def acsset(self):
        global command
        command = acs    
        
        
    def cpeconnect(self):
        HOST = str(self.RouterIP.text())
        password = str(self.rootPassword.text())
        portvalg = str(self.comboBox.currentText())
        uip = str(self.unitIP.text())        
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
        tn.write(command + "\r\n")
        tn.write("exit\r\n")
        
        print tn.read_all()
        
        
        
        
def main():
    app = QtGui.QApplication(sys.argv)
    form = ExampleApp()
    form.show()
    app.exec_()
    
if __name__ == '__main__':
    main()
    
   