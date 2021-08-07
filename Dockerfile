from mcr.microsoft.com/mssql/server:2019-latest

env ACCEPT_EULA=Y
env SA_PASSWORD=Password--
env MSSQL_TCP_PORT=1433

volume /data

user root

run apt-get update \
  && apt-get install -y \
    gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/src/app /data \
  && chown -R mssql /usr/src/app /data

user mssql

workdir /usr/src/app

copy init-template.sql init.sh entrypoint.sh ./

cmd ["/usr/src/app/entrypoint.sh"]
