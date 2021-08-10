#!/bin/bash
FILEPATH=$(pwd)/$2
if [ ! -f $FILEPATH ]; then
  exit 1
fi
FILENAME=$(basename -- $FILEPATH)
DB_DATABASE=${1:-master}
DB_SERVER=${DB_SERVER:-localhost}
DB_USER=${DB_USER:-sa}
DB_PASSWORD=${DB_PASSWORD:-Password--}
IMAGE=mcr.microsoft.com/mssql-tools
docker run \
  --rm \
  -it \
  --network=host \
  -v $FILEPATH:/tmp/$FILENAME \
   $IMAGE \
  /opt/mssql-tools/bin/sqlcmd \
    -y 0 \
    -d $DB_DATABASE \
    -S $DB_SERVER \
    -U $DB_USER \
    -P $DB_PASSWORD \
    -i /tmp/$FILENAME
