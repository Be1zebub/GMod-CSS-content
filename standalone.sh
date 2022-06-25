#!/bin/bash
# if you want to download css content to an already installed gmod server.

read -p "Enter server dir: " srvdir

## create dir for css content
mkdir -p $srvdir/css_srcds

STEAM_USER=anonymous
STEAM_PASS=""
STEAM_AUTH=""

echo -e "downloading css content.\n"
## install css content
./steamcmd.sh +force_install_dir $srvdir/css_srcds +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +app_update 232330 validate +quit

echo -e "deleting useless files.\n"

## deleting useless files
mkdir -p $srvdir/css_content
mv $srvdir/css_srcds/cstrike/*.vpk $srvdir/css_content/
rm -rf $srvdir/css_srcds

## mount css content
sed -i '14 i \"cstrike\"	\"/css_content\"' $srvdir/garrysmod/cfg/mount.cfg

echo -e "done! css content are downloaded & mounted.\n"
