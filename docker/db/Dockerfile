from mcr.microsoft.com/azure-sql-edge

env ACCEPT_EULA=1

user root

run mkdir /var/opt/mssql/log && mkdir /var/opt/mssql/data && chown -R mssql /var/opt/mssql
user mssql

run touch /var/opt/mssql/log/errlog

volume /var/opt/mssql
volume /data

cmd ["/opt/mssql/bin/sqlservr"]
