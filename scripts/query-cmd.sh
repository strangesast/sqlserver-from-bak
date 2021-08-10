#!/bin/bash
if [ -z "$2" ]
then
  exit 1
fi
CMD="$2"
DB_DATABASE=${1:-master}
DB_SERVER=${DB_SERVER:-localhost}
DB_USER=${DB_USER:-sa}
DB_PASSWORD=${DB_PASSWORD:-Password--}
IMAGE=mcr.microsoft.com/mssql-tools
docker run \
  --rm \
  -it \
  --network=host \
  $IMAGE \
  /opt/mssql-tools/bin/sqlcmd \
    -d $DB_DATABASE \
    -S $DB_SERVER \
    -U $DB_USER \
    -P $DB_PASSWORD \
    -Q "$CMD"
