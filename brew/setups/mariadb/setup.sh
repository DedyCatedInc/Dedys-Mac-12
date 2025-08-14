#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
#Run the database installer
mysql_install_db
#Start MariaDB
mysql.server start
#If you are installing MariaDB 10.4.6 or later:
mariadb-secure-installation.
#If you are installing an earlier version of MariaDB:
mysql_secure_installation.
#Connect to MariaDB
mariadb -u root -p
exit 0
