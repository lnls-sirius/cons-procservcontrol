#!/usr/bin/python3
import json
from pydm import Display
from pydm.widgets.related_display_button import PyDMRelatedDisplayButton

from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton, QLabel, QSpacerItem, QSizePolicy
from PyQt5.QtGui import QFont

def load_iocs():
    with open('../../iocs.json', 'r') as f:
        iocs = json.load(f)
    return iocs


class Main(Display):
    def __init__(self,parent=None):
        super().__init__(parent=parent, ui_filename='main.ui')

        self.iocs = load_iocs()

        self.rf_layout = QVBoxLayout()
        self.epp_layout = QVBoxLayout()

        self.init_layout()

        self.rf_tab.setLayout(self.rf_layout)
        self.epp_tab.setLayout(self.epp_layout)

    def init_layout(self):
        for ioc in self.iocs:
            button = PyDMRelatedDisplayButton(ioc['desc'])
            button.filenames = ['procServControl.ui']
            button.macros = '{"P":"' + ioc['pv'] + '"}'
            button.showIcon = False
            button.openInNewWindow = True

            if ioc['area']  == 'EPP':
                self.epp_layout.addWidget(button)
            elif ioc['area']  == 'RF':
                self.rf_layout.addWidget(button)

        self.rf_layout.addStretch(0)
        self.epp_layout.addStretch(0)
