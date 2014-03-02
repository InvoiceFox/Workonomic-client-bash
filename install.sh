#!/bin/bash

CURRDIR=`pwd`

echo "Installing Workonomic"
echo "---------------------"
echo "  This is still WIP  "
echo "---------------------"

## TODO:
## ask if this is the location where they want workonomic installed or should 
## we copy it to /opt/workonomic

## setup the API token

mkdir -p ~/.config/workonomic

echo "Please Enter your Workonomic API token (leave empty to not set it): "
read APITOKEN

if [[ $APITOKEN != "" ]]; then
    echo "$APITOKEN" | cat > ~/.config/workonomic/.apitoken

    echo "Api token set."
else
    echo "Api token not set or changed."
fi

#it's best that you move this whole folder to /opt/workonomic and run install from there
#this install just links the wrnkm command to /usr/bin so it will be globally accesible

echo "command 'wrknm' linked to /usr/bin/wrknm"

if [ -f /usr/bin/wrknm ]; then
    echo "wrknm already linked."
else
    ln -s ${CURRDIR}/wrknm /usr/bin/wrknm
fi

if [ -f /usr/bin/wrkn ]; then
    echo "wrkn already linked."
else
    ln -s ${CURRDIR}/wrkn /usr/bin/wrkn
fi

echo "done."



