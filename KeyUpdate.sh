#!/bin/bash
################################################################
# Title:.......KeyUpdate                                       #
# Author:......audi06_19   2018                                #
# Support:.....www.dreamosat-forum.com                         #
# E-Mail:......admin@dreamosat-forum.com                       #
# Date:........26.11.2018                                      #
# Description:.KeyUpdate                                       #
################################################################
FIN="==================================================";
echo $FIN;
echo ".....:: LÜTFEN BEKLEYİNİZ .... PLEASE WAIT ::.....";
##################################################
URL="https://raw.githubusercontent.com/audi06/SoftCam.Key_Serjoga/master";
[ -d /etc/tuxbox/config/ ] || mkdir -p /etc/tuxbox/config/;
[ -d /usr/keys ] || mkdir -p /usr/keys;
curl -s -Lkb -m 4 -m 6 $URL/README.md | grep -B100 -ia 'enigma2-plugin-extensions-KeyUpdate' | sed -e 's/<[^>]*>//g' | grep -va ".deb" | grep -va ".ipk"
curl -s -Lbk -m 4 -m 6 $URL/SoftCam.Key >/usr/keys/SoftCam.Key
chmod 0755 /usr/keys/SoftCam.Key -R;
cp -rd /usr/keys/SoftCam.Key /etc/tuxbox/config/;
echo "::: Thank you: by Serjoga :::";
echo "";
echo "SoftCam.Key updated. Do not forget to restart the EMU. good looking ...";
echo $FIN
echo "";
exit 0
