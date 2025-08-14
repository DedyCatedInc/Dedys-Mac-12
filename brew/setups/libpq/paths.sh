#!/bin/bash
echo -e "\nBase Directory and Filename..."
BASEDIR00="$( cd "$( dirname "$0" )" && pwd )"
CURRDIR00=${BASEDIR00##*/}
FILENAME0=`basename $0`; FILE=$(echo $FILENAME0 | cut -d '.' -f 1)
echo [$BASEDIR00] [$CURRDIR00] [$FILENAME0] [$FILE]
echo "......."
echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc
echo 'export LDFLAGS="-L/usr/local/opt/libpq/lib"' >> ~/.zshrc
echo 'export CPPFLAGS="-I/usr/local/opt/libpq/include"' >> ~/.zshrc
echo 'export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"' >> ~/.zshrc
cat ~/.zshrc
exit 0
