#!/bin/bash
################################################################
# Title:.......KeyUpdate                                       #
# Author:......audi06_19    2018/2019                          #
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
# Files
[ -d /etc/tuxbox/config/ ] || mkdir -p /etc/tuxbox/config/;
[ -d /usr/keys ] || mkdir -p /usr/keys;
# Github
curl -s -Lkb -m 4 -m 6 $URL/README.md | grep -B100 -ia 'enigma2-plugin-extensions-KeyUpdate' | sed -e 's/<[^>]*>//g' | grep -va ".deb" | grep -va ".ipk";
curl -s -Lbk -m 4 -m 6 $URL/SoftCam.Key >/usr/keys/SoftCam.Key;
#
chmod 0755 /usr/keys/SoftCam.Key -R;
# check
if [ -f /etc/tuxbox/config/SoftCam.Key ] ; then
  check="/etc/tuxbox/config/SoftCam.Key";
elif [ -f /etc/tuxbox/config/oscam-emu/SoftCam.Key ] ; then
  check="/etc/tuxbox/config/oscam-emu/SoftCam.Key";
elif [ -f /etc/tuxbox/config/oscam/SoftCam.Key ] ; then
  check="/etc/tuxbox/config/oscam/SoftCam.Key";
else
  echo "The SoftCam.Key file was not found.\n";
  echo "It was sent to the following folder."
  echo ": /etc/tuxbox/config/"
  echo ": /usr/keys/"
  cp -f /usr/keys/SoftCam.Key /etc/tuxbox/config/SoftCam.Key
#  exit 0;
fi;
# copy
cp -f /usr/keys/SoftCam.Key $check;
echo "SoftCam.Key file sent. $check;";
echo "";
echo "SoftCam.Key updated. Do not forget to restart the EMU. good looking ...";
echo "";
echo "::: Thank you: by Serjoga :::";
echo "Support: www.dreamosat-forum.com ";
echo $FIN
exit 0
