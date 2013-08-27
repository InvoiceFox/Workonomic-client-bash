#!/bin/bash

CURRDIR=`pwd`

echo "Installing Workonomic"
echo "---------------------"
echo "  This is still WIP  "
echo "---------------------"

## setup the API token

mkdir -p ~/.config/workonomic

cho "Please Enter your Workonomic API token: "
read APITOKEN

echo "$APITOKEN" | cat > ~/.config/workonomic/.apitoken

echo "Api token set."

#it's best that you move this whole folder to /opt/workonomic and run install from there
#this install just links the wrnkm command to /usr/bin so it will be globally accesible

echo "command 'wrknm' linked to /usr/bin/wrknm"

ln -s ${CURRDIR}/wrknm /usr/bin/wrknm

echo "done."



