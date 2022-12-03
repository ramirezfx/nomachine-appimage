#!/bin/bash
rm -Rf nomachine
rm nomachine.deb
rm appimagetool-x86_64.AppImage
mkdir nomachine
DLLINK=$(wget --save-headers --output-document - https://downloads.nomachine.com/de/download/?id=5 | grep download.nomachine.com | cut -d '"' -f6 | head -1) && wget -O nomachine.deb $DLLINK && dpkg -x nomachine.deb nomachine
#wget https://download.nomachine.com/download/7.6/Linux/nomachine_7.6.2_4_amd64.deb
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod 700 appimagetool-x86_64.AppImage

cd ./nomachine/usr/share/NX/packages/server/
tar xzf nxclient.tar.gz
rm nxclient.tar.gz
tar xzf nxnode.tar.gz
rm nxnode.tar.gz
tar xzf nxplayer.tar.gz
rm nxplayer.tar.gz
tar xzf nxserver.tar.gz
rm nxserver.tar.gz
tar xzf nxrunner.tar.gz
rm nxrunner.tar.gz
cp -Rf NX ../../../../
cd ../../../../../../
cp NoMachine-player-base.desktop nomachine
cp NoMachine-icon.png nomachine
chmod 700 AppRun
cp AppRun nomachine
./appimagetool-x86_64.AppImage nomachine
rm -Rf nomachine
rm nomachine.deb
rm appimagetool-x86_64.AppImage