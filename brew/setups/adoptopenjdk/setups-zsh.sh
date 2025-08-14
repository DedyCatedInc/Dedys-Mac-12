#!/bin/zsh
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
rm ~/.zshrc
cp zshrc_${1}.sh ~/.zshrc
cat ~/.zshrc
chmod 755 ~/.zshrc
source ~/.zshrc
echo $JAVA_HOME
java -version
exec zsh -l
