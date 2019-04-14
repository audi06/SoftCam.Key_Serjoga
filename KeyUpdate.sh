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
TMP=`mktemp -d`
cd ${TMP}
[ -d /etc/tuxbox/config/ ] || mkdir -p /etc/tuxbox/config/;
[ -d /usr/keys ] || mkdir -p /usr/keys;
# Github
agent="--header='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/600.1.17 (KHTML, like Gecko) Version/8.0 Safari/600.1.17'"
crt="--no-check-certificate"

wget -q $crt $agent $URL/SoftCam.Key
# check softcamkey
if [ -f ${TMP}/SoftCam.Key ] ; then
  #
  chmod 0755 ${TMP}/SoftCam.Key -R;
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
    check="/etc/tuxbox/config/SoftCam.Key";
  #  exit 0;
  fi;
  # copy
  cp -rd ${TMP}/SoftCam.Key $check;
  wget $crt $agent --quiet -O - $URL/README.md | grep -B100 -ia 'enigma2-plugin-extensions-KeyUpdate' | sed -e 's/<[^>]*>//g' | grep -va ".deb" | grep -va ".ipk";
else
  echo "";
  echo "Failed to download SoftCam.Key file !!!"
  echo "SoftCam.Key dosyası indirilemedi !!!"
  echo "";
  rm -rf ${TMP} > /dev/null;
  exit 0;
fi
echo "SoftCam.Key file sent. $check;";
echo "";
echo "SoftCam.Key updated. Do not forget to restart the EMU. good looking ...";
echo "";
echo "::: Thank you: by Serjoga :::";
echo "Support: www.dreamosat-forum.com ";
echo $FIN
rm -rf ${TMP} > /dev/null;
exit 0
