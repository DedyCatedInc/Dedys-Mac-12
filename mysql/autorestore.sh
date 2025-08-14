#!/bin/bash
### Reference
# http://www.cyberciti.biz/faq/ubuntu-linux-mysql-nas-ftp-backup-script/
### NOTE! Need to grant access first
# mysql -u root -ptimeline
# GRANT SELECT,LOCK TABLES ON *.* TO 'root'@'localhost';
### MySQL Server Login Info ###
MUSER="root"
MPASS="timeline"
MHOST="localhost"
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
BAK="/mysql/autobackup"
GZIP="$(which gzip)"
### FTP SERVER Login info ###
FTPU="FTP-SERVER-USER"
FTPP="FTP-SERVER-PASSWORD"
FTPS="FTP-SERVER-IP-ADDRESS"
### Date Stamp
NOW=$(date +"%m-%d")
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
mkdir -p $BAK
for DB in $DBS; do
  if [ "$DB" != "information_schema" ] && [ "$DB" != "mysql" ] && [ "$DB" != "performance_schema" ]; then
    echo "Restoring $DB..."
    mysql -u$MUSER -p$MPASS $DB < $BAK/$DB.sql
    echo "Done..."
  fi
done
# disable ftp
#lftp -u $FTPU,$FTPP -e "mkdir /mysql/$NOW;cd /mysql/$NOW; mput /backup/mysql/*; quit" $FTPS
echo "Restore Executed..."
exit 0
