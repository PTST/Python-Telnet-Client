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
        MainWindow.resize(414, 457)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.verticalLayoutWidget_4 = QtGui.QWidget(self.centralwidget)
        self.verticalLayoutWidget_4.setGeometry(QtCore.QRect(10, 10, 391, 391))
        self.verticalLayoutWidget_4.setObjectName(_fromUtf8("verticalLayoutWidget_4"))
        self.verticalLayout_4 = QtGui.QVBoxLayout(self.verticalLayoutWidget_4)
        self.verticalLayout_4.setObjectName(_fromUtf8("verticalLayout_4"))
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName(_fromUtf8("horizontalLayout_2"))
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.cntbttn = QtGui.QPushButton(self.verticalLayoutWidget_4)
        self.cntbttn.setMaximumSize(QtCore.QSize(140, 16777215))
        self.cntbttn.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.cntbttn.setObjectName(_fromUtf8("cntbttn"))
        self.verticalLayout.addWidget(self.cntbttn)
        self.acsbttn = QtGui.QPushButton(self.verticalLayoutWidget_4)
        self.acsbttn.setMaximumSize(QtCore.QSize(141, 16777215))
        self.acsbttn.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.acsbttn.setAutoDefault(False)
        self.acsbttn.setObjectName(_fromUtf8("acsbttn"))
        self.verticalLayout.addWidget(self.acsbttn)
        self.buttonBox = QtGui.QDialogButtonBox(self.verticalLayoutWidget_4)
        self.buttonBox.setMaximumSize(QtCore.QSize(141, 16777215))
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Close|QtGui.QDialogButtonBox.Help)
        self.buttonBox.setCenterButtons(True)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.verticalLayout.addWidget(self.buttonBox)
        self.horizontalLayout_2.addLayout(self.verticalLayout)
        self.formLayout = QtGui.QFormLayout()
        self.formLayout.setFieldGrowthPolicy(QtGui.QFormLayout.FieldsStayAtSizeHint)
        self.formLayout.setFormAlignment(QtCore.Qt.AlignCenter)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.routerIPLabel = QtGui.QLabel(self.verticalLayoutWidget_4)
        self.routerIPLabel.setObjectName(_fromUtf8("routerIPLabel"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.routerIPLabel)
        self.RouterIP = QtGui.QLineEdit(self.verticalLayoutWidget_4)
        self.RouterIP.setObjectName(_fromUtf8("RouterIP"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.RouterIP)
        self.rootPasswordLabel = QtGui.QLabel(self.verticalLayoutWidget_4)
        self.rootPasswordLabel.setObjectName(_fromUtf8("rootPasswordLabel"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.LabelRole, self.rootPasswordLabel)
        self.rootPassword = QtGui.QLineEdit(self.verticalLayoutWidget_4)
        self.rootPassword.setObjectName(_fromUtf8("rootPassword"))
        self.formLayout.setWidget(1, QtGui.QFormLayout.FieldRole, self.rootPassword)
        self.horizontalLayout_2.addLayout(self.formLayout)
        self.horizontalLayout_2.setStretch(0, 1)
        self.horizontalLayout_2.setStretch(1, 2)
        self.verticalLayout_4.addLayout(self.horizontalLayout_2)
        self.verticalLayout_3 = QtGui.QVBoxLayout()
        self.verticalLayout_3.setObjectName(_fromUtf8("verticalLayout_3"))
        self.textEdit = QtGui.QTextEdit(self.verticalLayoutWidget_4)
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout_3.addWidget(self.textEdit)
        self.verticalLayout_4.addLayout(self.verticalLayout_3)
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

