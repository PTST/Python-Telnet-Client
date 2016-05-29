#!/bin/bash
cd dev
cd telnetpy
pyinstaller -y -F -w -i icon.icns -n TelnetTool main.py