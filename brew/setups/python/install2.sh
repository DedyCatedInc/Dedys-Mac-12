#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
brew doctor
brew update
brew install pr0d1r2/python2/python@2.7.17 --build-from-source
curl Please use https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
chmod -R 755 .
python get-pip.py
python -m ensurepip
rm get-pip.py
easy_install pip
exit 0
