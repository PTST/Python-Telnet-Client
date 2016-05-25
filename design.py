# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'design.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(424, 397)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.verticalLayout_2 = QtGui.QVBoxLayout(self.centralwidget)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.verticalLayout_4 = QtGui.QVBoxLayout()
        self.verticalLayout_4.setSizeConstraint(QtGui.QLayout.SetNoConstraint)
        self.verticalLayout_4.setObjectName(_fromUtf8("verticalLayout_4"))
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName(_fromUtf8("horizontalLayout_2"))
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.cntbttn = QtGui.QPushButton(self.centralwidget)
        self.cntbttn.setMaximumSize(QtCore.QSize(140, 16777215))
        self.cntbttn.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.cntbttn.setObjectName(_fromUtf8("cntbttn"))
        self.verticalLayout.addWidget(self.cntbttn)
        self.acsbttn = QtGui.QPushButton(self.centralwidget)
        self.acsbttn.setMaximumSize(QtCore.QSize(141, 16777215))
        self.acsbttn.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.acsbttn.setAutoDefault(False)
        self.acsbttn.setObjectName(_fromUtf8("acsbttn"))
        self.verticalLayout.addWidget(self.acsbttn)
        self.horizontalLayout_2.addLayout(self.verticalLayout)
        self.formLayout = QtGui.QFormLayout()
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.FieldsStayAtSizeHint)
        self.formLayout.setFormAlignment(QtCore.Qt.AlignCenter)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.routerIPLabel = QtGui.QLabel(self.centralwidget)
        self.routerIPLabel.setObjectName(_fromUtf8("routerIPLabel"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.routerIPLabel)
        self.RouterIP = QtGui.QLineEdit(self.centralwidget)
        self.RouterIP.setMaximumSize(QtCore.QSize(127, 16777215))
        self.RouterIP.setObjectName(_fromUtf8("RouterIP"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.RouterIP)
        self.rootPasswordLabel = QtGui.QLabel(self.centralwidget)
        self.rootPasswordLabel.setObjectName(_fromUtf8("rootPasswordLabel"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.rootPasswordLabel)
        self.rootPassword = QtGui.QLineEdit(self.centralwidget)
        self.rootPassword.setMaximumSize(QtCore.QSize(127, 16777215))
        self.rootPassword.setObjectName(_fromUtf8("rootPassword"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.rootPassword)
        self.horizontalLayout_2.addLayout(self.formLayout)
        self.horizontalLayout_2.setStretch(0, 1)
        self.horizontalLayout_2.setStretch(1, 2)
        self.verticalLayout_4.addLayout(self.horizontalLayout_2)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.comboBox = QtGui.QComboBox(self.centralwidget)
        self.comboBox.setMaximumSize(QtCore.QSize(292, 16777215))
        self.comboBox.setFrame(False)
        self.comboBox.setObjectName(_fromUtf8("comboBox"))
        self.horizontalLayout.addWidget(self.comboBox)
        self.unitIP = QtGui.QLineEdit(self.centralwidget)
        self.unitIP.setObjectName(_fromUtf8("unitIP"))
        self.horizontalLayout.addWidget(self.unitIP)
        self.portbttn = QtGui.QPushButton(self.centralwidget)
        self.portbttn.setMaximumSize(QtCore.QSize(101, 16777215))
        self.portbttn.setObjectName(_fromUtf8("portbttn"))
        self.horizontalLayout.addWidget(self.portbttn)
        self.horizontalLayout.setStretch(0, 2)
        self.horizontalLayout.setStretch(1, 1)
        self.horizontalLayout.setStretch(2, 1)
        self.verticalLayout_4.addLayout(self.horizontalLayout)
        self.verticalLayout_3 = QtGui.QVBoxLayout()
        self.verticalLayout_3.setObjectName(_fromUtf8("verticalLayout_3"))
        self.textEdit = QtGui.QTextEdit(self.centralwidget)
        self.textEdit.setMinimumSize(QtCore.QSize(396, 0))
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout_3.addWidget(self.textEdit)
        self.verticalLayout_4.addLayout(self.verticalLayout_3)
        self.verticalLayout_2.addLayout(self.verticalLayout_4)
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.cntbttn.setToolTip(_translate("MainWindow", "<html><head/><body><p>Connection Stats</p></body></html>", None))
        self.cntbttn.setText(_translate("MainWindow", "Connection Stats", None))
        self.acsbttn.setToolTip(_translate("MainWindow", "<html><head/><body><p>Wireless acs rescan og scanreport</p></body></html>", None))
        self.acsbttn.setText(_translate("MainWindow", "ACS", None))
        self.routerIPLabel.setText(_translate("MainWindow", "Router IP", None))
        self.rootPasswordLabel.setText(_translate("MainWindow", "Root Password", None))
        self.unitIP.setText(_translate("MainWindow", "Enheds IP", None))
        self.portbttn.setText(_translate("MainWindow", "Sæt Porte", None))

