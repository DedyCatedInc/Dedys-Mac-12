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
MONTHDATE=$(date +"%m-%d")
LASTMONTH=$(date +"%m" -d 'last month')
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
mkdir -p $BAK
rm -rf $BAK/$DB-$LASTMONTH*.gz
for DB in $DBS; do
  if [ "$DB" != "information_schema" ] && [ "$DB" != "mysql" ] && [ "$DB" != "performance_schema" ]; then
    echo "Backup $DB..."
    $MYSQLDUMP --single-transaction -u$MUSER -h$MHOST -p$MPASS $DB | $GZIP -9 > $BAK/$DB-$MONTHDATE.gz
    echo "Done..."
  fi
done
# disable ftp
#lftp -u $FTPU,$FTPP -e "mkdir /mysql/$MONTHDATE;cd /mysql/$MONTHDATE; mput /backup/mysql/*; quit" $FTPS
echo "Backup Executed..."
exit 0
