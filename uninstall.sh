#!/bin/bash

echo "started uninstaller"

echo "removing config"
mv ~/.config/workonomic /tmp/DELETED--workonomic

echo "removing symbolic link /usr/bin/wrknm"
mv /usr/bin/wrknm /tmp/DELETED--wrknm

echo "done."




