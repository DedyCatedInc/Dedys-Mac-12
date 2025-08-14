#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
PRJ=$1
openssl genrsa -aes256 -out $PRJ.key 2048
openssl rsa -in $PRJ.key -out $PRJ.key
openssl req -new -x509 -nodes -sha1 -key $PRJ.key -out $PRJ.crt -days 36500
exit 0
