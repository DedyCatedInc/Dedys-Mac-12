#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
cd $BASEDIR00
# https://www.chriscollins.me/blog/install-composer-globally-on-mac-os/
echo "Must execute this script as Root!"
rm ./composer.phar
curl -sS https://getcomposer.org/installer | php
rm /usr/local/bin/composer
mv composer.phar /usr/local/bin/composer
echo "Add alias to composer"
echo
echo "Default shell on Mac OS <10.14, 2002-2019"
echo "nano ~/.bash_profile"
echo
echo "Default shell on Mac OS 10.15+, 2019-Present"
echo "nano ~/.zshrc"
echo
echo "Then insert following parameter"
echo 'alias composer="php /usr/local/bin/composer"'
echo
exit 0
