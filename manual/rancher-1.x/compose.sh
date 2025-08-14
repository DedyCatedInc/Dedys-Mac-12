#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
VERSION=v0.12.5
wget https://github.com/rancher/rancher-compose/releases/download/${VERSION}/rancher-compose-darwin-amd64-${VERSION}.tar.gz
tar -zxvf ./rancher-compose-darwin-amd64-${VERSION}.tar.gz
rm -rf /usr/local/bin/rancher-compose
cp ./rancher-compose-${VERSION}/rancher-compose /usr/local/bin/rancher-compose
rm -rf rancher-compose-*
which rancher-compose
rancher-compose --version
exit 0
