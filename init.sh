#!/bin/bash
envsubst < init-template.sql > init.sql 

export SQLCMDPASSWORD=${MSSQL_SA_PASSWORD:-Password--};
for i in {1..50};
do
    sqlcmd -S localhost -U sa -d master -i init.sql
    if [ $? -eq 0 ]
    then
        echo "restore initiated"
        exit 0
    else
        sleep 1
    fi
done
exit 1
