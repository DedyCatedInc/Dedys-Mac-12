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
brew tap adoptopenjdk/openjdk
brew search jdk
brew $FILE $CURRDIR008
brew $FILE $CURRDIR009
brew $FILE $CURRDIR0010
brew $FILE $CURRDIR0011
brew $FILE $CURRDIR0012
brew $FILE $CURRDIR0013
brew $FILE $CURRDIR0014
brew $FILE $CURRDIR0015
exit 0
