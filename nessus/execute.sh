#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
if [ $1 == "down" ]; then
  docker-compose down
elif [ $1 == "up" ]; then
  docker-compose up -d
else
  echo "Invalid argument $1"
fi
~/commands/docker/ps/all.sh
exit 0
