#!/bin/bash

CURRDIR=`pwd`

#it's best that you move this whole folder to /opt/workonomic and run install from there
#this install just links the wrnkm command to /usr/bin so it will be globally accesible

ln -s ${CURRDIR}/wrknm /usr/bin/wrknm



