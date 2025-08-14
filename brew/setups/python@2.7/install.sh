#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
brew update
curl https://raw.githubusercontent.com/Homebrew/homebrew-core/86a44a0a552c673a05f11018459c9f5faae3becc/Formula/python@2.rb -o python@2.rb
brew install python@2.rb
rm python@2.rb
#curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
#python get-pip.py
#python -m ensurepip
#rm get-pip.py
#easy_install pip
exit 0
