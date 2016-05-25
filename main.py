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
port1 = "original"
uip = "8.8.8.8"

ccport = "service host add name=chrome1\r\nservice host rule add name=chrome1 protocol=any portrange=80\r\nservice host assign name=chrome1 host=" + uip + " log=disabled\r\nservice host add name=chrome2\r\nservice host rule add name=chrome2 protocol=any portrange=1024\r\nservice host assign name=chrome2 host=" + uip + " log=disabled\r\nservice host add name=chrome3\r\nservice host rule add name=chrome3 protocol=any portrange=1900\r\nservice host assign name=chrome3 host=" + uip + " log=disabled\r\nservice host add name=chrome4\r\nservice host rule add name=chrome4 protocol=any portrange=8008\r\nservice host assign name=chrome4 host=" + uip + " log=disabled\r\nservice host add name=chrome5\r\nservice host rule add name=chrome5 protocol=any portrange=8009\r\nservice host assign name=chrome5 host=" + uip + " log=disabled\r\nservice host add name=chrome6\r\nservice host rule add name=chrome6 protocol=any portrange=32768-61000\r\nservice host assign name=chrome6 host=" + uip + " log=disabled\r\nsaveall" 
atvport = "service host add name=atv1\r\nservice host rule add name=atv1 protocol=any portrange=80\r\nservice host assign name=atv1 host=" + uip +" log=disabled\r\nservice host add name=atv2\r\nservice host rule add name=atv2 protocol=any portrange=443\r\nservice host assign name=atv2 host=" + uip +" log=disabled\r\nservice host add name=atv3\r\nservice host rule add name=atv3 protocol=any portrange=53\r\nservice host assign name=atv3 host=" + uip +" log=disabled\r\nservice host add name=atv4\r\nservice host rule add name=atv4 protocol=any portrange=5353\r\nservice host assign name=atv4 host=" + uip +" log=disabled\r\nservice host add name=atv5\r\nservice host rule add name=atv5 protocol=any portrange=123\r\nservice host assign name=atv5 host=" + uip +" log=disabled\r\nservice host add name=atv6\r\nservice host rule add name=atv6 protocol=any portrange=3689\r\nservice host assign name=atv6 host=" + uip +" log=disabled\r\nsaveall"
sonosport = "service host add name=Sonos1\r\nservice host rule add name=Sonos1 protocol=any portrange=80\r\nservice host assign name=Sonos1 host=" + uip +" log=disabled\r\nservice host add name=Sonos2\r\nservice host rule add name=Sonos2 protocol=any portrange=445\r\nservice host assign name=Sonos2 host=" + uip +" log=disabled\r\nservice host add name=Sonos3\r\nservice host rule add name=Sonos3 protocol=any portrange=3400\r\nservice host assign name=Sonos3 host=" + uip +" log=disabled\r\nservice host add name=Sonos4\r\nservice host rule add name=Sonos4 protocol=any portrange=443\r\nservice host assign name=Sonos4 host=" + uip +" log=disabled\r\nservice host add name=Sonos5\r\nservice host rule add name=Sonos5 protocol=any portrange=4070\r\nservice host assign name=Sonos5 host=" + uip +" log=disabled\r\nservice host add name=Sonos6\r\nservice host rule add name=Sonos6 protocol=any portrange=136-139\r\nservice host assign name=Sonos6 host=" + uip +" log=disabled\r\nservice host add name=Sonos7\r\nservice host rule add name=Sonos7 protocol=any portrange=1900\r\nservice host assign name=Sonos7 host=" + uip +" log=disabled\r\nservice host add name=Sonos8\r\nservice host rule add name=Sonos8 protocol=any portrange=ID\r\nservice host assign name=Sonos8 host=" + uip +" log=disabled\r\nservice host add name=Sonos9\r\nservice host rule add name=Sonos9 protocol=any portrange=1901\r\nservice host assign name=Sonos9 host=" + uip +" log=disabled\r\nservice host add name=Sonos10\r\nservice host rule add name=Sonos10 protocol=any portrange=2869\r\nservice host assign name=Sonos10 host=" + uip +" log=disabled\r\nservice host add name=Sonos11\r\nservice host rule add name=Sonos11 protocol=any portrange=6969\r\nservice host assign name=Sonos11 host=" + uip +" log=disabled\r\nservice host add name=Sonos12\r\nservice host rule add name=Sonos12 protocol=any portrange=10243\r\nservice host assign name=Sonos12 host=" + uip +" log=disabled\r\nservice host add name=Sonos13\r\nservice host rule add name=Sonos13 protocol=any portrange=10280-10284\r\nservice host assign name=Sonos13 host=" + uip +" log=disabled\r\nsaveall"
x1port = "service host add name=Xone1\r\nservice host rule add name=Xone1 protocol=any portrange=88\r\nservice host assign name=Xone1 host=" + uip +" log=disabled\r\nservice host add name=Xone2\r\nservice host rule add name=Xone2 protocol=any portrange=3074\r\nservice host assign name=Xone2 host=" + uip +" log=disabled\r\nservice host add name=Xone3\r\nservice host rule add name=Xone3 protocol=any portrange=53\r\nservice host assign name=Xone3 host=" + uip +" log=disabled\r\nservice host add name=Xone4\r\nservice host rule add name=Xone4 protocol=any portrange=80\r\nservice host assign name=Xone4 host=" + uip +" log=disabled\r\nservice host add name=Xone5\r\nservice host rule add name=Xone5 protocol=any portrange=500\r\nservice host assign name=Xone5 host=" + uip +" log=disabled\r\nservice host add name=Xone6\r\nservice host rule add name=Xone6 protocol=any portrange=3544\r\nservice host assign name=Xone6 host=" + uip +" log=disabled\r\nservice host add name=Xone7\r\nservice host rule add name=Xone7 protocol=any portrange=4500\r\nservice host assign name=Xone7 host=" + uip +" log=disabled\r\nsaveall"
x360port = "service host add name=xbox1\r\nservice host rule add name=xbox1 protocol=any portrange=88\r\nservice host assign name=xbox1 host=" + uip +" log=disabled\r\nservice host add name=xbox2\r\nservice host rule add name=xbox2 protocol=any portrange=3074\r\nservice host assign name=xbox2 host=" + uip +" log=disabled\r\nservice host add name=xbox3\r\nservice host rule add name=xbox3 protocol=any portrange=53\r\nservice host assign name=xbox3 host=" + uip +" log=disabled\r\nservice host add name=xbox4\r\nservice host rule add name=xbox4 protocol=any portrange=80\r\nservice host assign name=xbox4 host=" + uip +" log=disabled\r\nsaveall"
psport = "service host add name=PS1\r\nservice host rule add name=PS1 protocol=any portrange=80\r\nservice host assign name=PS1 host=" + uip +" log=disabled\r\nservice host add name=PS2\r\nservice host rule add name=PS2 protocol=any portrange=443\r\nservice host assign name=PS2 host=" + uip +" log=disabled\r\nservice host add name=PS3\r\nservice host rule add name=PS3 protocol=any portrange=465\r\nservice host assign name=PS3 host=" + uip +" log=disabled\r\nservice host add name=PS4\r\nservice host rule add name=PS4 protocol=any portrange=983\r\nservice host assign name=PS4 host=" + uip +" log=disabled\r\nservice host add name=PS5\r\nservice host rule add name=PS5 protocol=any portrange=3478-3480\r\nservice host assign name=PS5 host=" + uip +" log=disabled\r\nservice host add name=PS6\r\nservice host rule add name=PS6 protocol=any portrange=3658\r\nservice host assign name=PS6 host=" + uip +" log=disabled\r\nservice host add name=PS7\r\nservice host rule add name=PS7 protocol=any portrange=5223\r\nservice host assign name=PS7 host=" + uip +" log=disabled\r\nservice host add name=PS8\r\nservice host rule add name=PS8 protocol=any portrange=ID\r\nservice host assign name=PS8 host=" + uip +" log=disabled\r\nservice host add name=PS9\r\nservice host rule add name=PS9 protocol=any portrange=9293\r\nservice host assign name=PS9 host=" + uip +" log=disabled\r\nservice host add name=PS10\r\nservice host rule add name=PS10 protocol=any portrange=10070-10080\r\nservice host assign name=PS10 host=" + uip +" log=disabled\r\nsaveall"
dkport = "service host add name=DK1\r\nservice host rule add name=DK1 protocol=any portrange=19000\r\nservice host assign name=DK1 host=" + uip +" log=disabled\r\nservice host add name=DK2\r\nservice host rule add name=DK2 protocol=any portrange=21\r\nservice host assign name=DK2 host=" + uip +" log=disabled\r\nservice host add name=DK3\r\nservice host rule add name=DK3 protocol=any portrange=50020\r\nservice host assign name=DK3 host=" + uip +" log=disabled\r\nservice host add name=DK4\r\nservice host rule add name=DK4 protocol=any portrange=13\r\nservice host assign name=DK4 host=" + uip +" log=disabled\r\nservice host add name=DK5\r\nservice host rule add name=DK5 protocol=any portrange=80\r\nservice host assign name=DK5 host=" + uip +" log=disabled\r\nservice host add name=DK6\r\nservice host rule add name=DK6 protocol=any portrange=5214\r\nservice host assign name=DK6 host=" + uip +" log=disabled\r\nservice host add name=DK7\r\nservice host rule add name=DK7 protocol=any portrange=24000\r\nservice host assign name=DK7 host=" + uip +" log=disabled\r\nsaveall"
cdport = "service host add name=CD1\r\nservice host rule add name=CD1 protocol=any portrange=80\r\nservice host assign name=CD1 host=" + uip +" log=disabled\r\nservice host add name=CD2\r\nservice host rule add name=CD2 protocol=any portrange=8080\r\nservice host assign name=CD2 host=" + uip +" log=disabled\r\nservice host add name=CD3\r\nservice host rule add name=CD3 protocol=any portrange=8888\r\nservice host assign name=CD3 host=" + uip +" log=disabled\r\nservice host add name=CD4\r\nservice host rule add name=CD4 protocol=any portrange=8889\r\nservice host assign name=CD4 host=" + uip +" log=disabled\r\nsaveall"






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
        self.portbttn.clicked.connect(self.pfwtest)
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

        global uip
        uip = str(self.unitIP.text())
        
        portvalg = str(self.comboBox.currentText())
        
        if portvalg == "Chromecast":
            global command
            command = ccport
        elif portvalg == "Apple TV":
            print "apple virker"
        elif portvalg == "Playstation 4":
            print "PS4 Virker"
        else:
            print "Ingen tjeneste valgt"
        
    def pfwtest(self):
        print command
        
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
        tn = telnetlib.Telnet()
        
        print port1
        
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
    
   