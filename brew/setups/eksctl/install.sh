#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
git config --global http.postBuffer 157286400
git config --global http.lowSpeedLimit 1000
git config --global http.lowSpeedTime 120
brew $FILE $CURRDIR00
exit 0
