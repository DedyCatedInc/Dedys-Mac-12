#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
if [ -z "$1" ]; then
  echo "Require parameter 1"
  exit 0
fi
rm ~/.bash_profile
cp bash_profile_${1}.sh ~/.bash_profile
cat ~/.bash_profile
chmod 755 ~/.bash_profile
source ~/.bash_profile
echo $JAVA_HOME
java -version
exec bash -l
