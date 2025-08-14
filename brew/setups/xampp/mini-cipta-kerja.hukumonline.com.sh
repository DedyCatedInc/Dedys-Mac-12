#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
FILE2=$(echo $FILENAME0 | cut -d '.' -f 2)
FILE3=$(echo $FILENAME0 | cut -d '.' -f 3)
CERTS="$FILE.$FILE2.$FILE3"
./generate.sh $CERTS
rm /Applications/XAMPP/xamppfiles/etc/ssl.crt/$CERTS.crt
mv ./$CERTS.crt /Applications/XAMPP/xamppfiles/etc/ssl.crt/$CERTS.crt
rm /Applications/XAMPP/xamppfiles/etc/ssl.key/ssl.key/$CERTS.key
mv ./$CERTS.key /Applications/XAMPP/xamppfiles/etc/ssl.key/$CERTS.key
exit 0
