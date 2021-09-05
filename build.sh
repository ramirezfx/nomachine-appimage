#!/bin/bash
rm -Rf nomachine
rm nomachine_7.6.2_4_amd64.deb
rm appimagetool-x86_64.AppImage
wget https://download.nomachine.com/download/7.6/Linux/nomachine_7.6.2_4_amd64.deb
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod 700 appimagetool-x86_64.AppImage
mkdir nomachine
dpkg -x nomachine_7.6.2_4_amd64.deb nomachine
cd ./nomachine/usr/share/NX/packages/server/
tar xzf nxclient.tar.gz
rm nxclient.tar.gz
tar xzf nxnode.tar.gz
rm nxnode.tar.gz
tar xzf nxplayer.tar.gz
rm nxplayer.tar.gz
tar xzf nxserver.tar.gz
rm nxserver.tar.gz
cp -Rf NX ../../../../
cd ../../../../../../
cp NoMachine-player-base.desktop nomachine
cp NoMachine-icon.png nomachine
chmod 700 AppRun
cp AppRun nomachine
./appimagetool-x86_64.AppImage nomachine
