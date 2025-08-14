#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
NAME=$(echo $FILE | cut -d '_' -f 1)
TYPE=$(uname -a | cut -d ' ' -f 1 | cut -d '_' -f 1); echo [$TYPE]
if [ "$TYPE" == "CYGWIN" ]; then
  find . -name ${NAME}.sh -type f -exec {} \;
fi
if [ "$TYPE" == "Darwin" ]; then
  find . -name ${NAME}.sh -type f -exec {} \;
fi
if [ "$TYPE" == "Linux" ]; then
  find . -name ${NAME}.sh -type f -exec sudo {} \;
fi
exit 0
