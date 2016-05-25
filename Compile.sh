#!/bin/bash
cd dev
cd telnetpy
pyinstaller -y -F -w -i icon.icns -i icon.ico -n TelnetTool main.py