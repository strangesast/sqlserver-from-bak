#!/bin/bash
envsubst < init-template.sql > init.sql 

for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i init.sql
    if [ $? -eq 0 ]
    then
        echo "setup completed"
        break
    else
        sleep 1
    fi
done
