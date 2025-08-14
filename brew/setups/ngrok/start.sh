#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
mkdir ~/Library/Application\ Support/ngrok
if [ -f ~/Library/Application\ Support/ngrok/ngrok.yml ]; then
  rm ~/Library/Application\ Support/ngrok/ngrok.yml
fi
cp ngrok.yml ~/Library/Application\ Support/ngrok/ngrok.yml
ngrok start --all
exit 0
