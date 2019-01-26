#!/bin/sh
echo "chaidong"
DATE=`date +%Y%m%d`
SEC=`date +%Y%m%d%H%M%S`
DIR=/root/backup
NAME=backup
SOURCE=/root/src
DAYS=5

if [ ! -f $DIR/$NAME_$DATE.tar.gz ];then

  find $DIR -mtime +$DAYS  -name $NAME"_"*.tar.gz|xargs rm -f

  /bin/rm -f $DIR/snapshot

  /bin/tar -g $DIR/snapshot -zcpPf $DIR/$NAME"_"$DATE.tar.gz $SOURCE

else
  
  /bin/tar -g $DIR/snapshot -zcpPf $DIR/$NAME"_incremental_"$SEC.tar.gz $SOURCE

fi

