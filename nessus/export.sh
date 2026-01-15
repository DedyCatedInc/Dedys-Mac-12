#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
docker commit nessus01-dedy-irawan-dedycated-com nessus01-dedy-irawan-dedycated-com:snapshot
docker save -o nessus01-dedy-irawan-dedycated-com_snapshot.tar nessus01-dedy-irawan-dedycated-com:snapshot
exit 0
