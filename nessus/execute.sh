#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
case "$1" in
  down)
    docker-compose down
    docker ps -a
    ;;
  up)
    docker-compose up -d
    docker ps -a
    ;;
  "")
    echo "Invalid argument (missing command). Use: up | down"
    ;;
  *)
    echo "Invalid argument $1"
    ;;
esac
exit 0
