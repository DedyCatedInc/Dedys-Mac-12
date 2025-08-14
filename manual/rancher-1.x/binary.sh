#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
VERSION=v0.6.14
wget https://github.com/rancher/cli/releases/download/${VERSION}/rancher-darwin-amd64-${VERSION}.tar.gz
tar -zxvf ./rancher-darwin-amd64-${VERSION}.tar.gz
rm -rf /usr/local/bin/rancher
cp ./rancher-${VERSION}/rancher /usr/local/bin/rancher
rm -rf ./rancher-${VERSION}
rm ./*.tar.*
which rancher
rancher --version
exit 0
