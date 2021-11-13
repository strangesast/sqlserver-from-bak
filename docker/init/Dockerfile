from golang:1.16

run go get github.com/microsoft/go-sqlcmd/cmd/sqlcmd@v0.1.0

volume /data

run apt-get update \
  && apt-get install -y \
    gettext-base \
  && rm -rf /var/lib/apt/lists/*

workdir /usr/src/app

copy init-template.sql init.sh ./

cmd ["/usr/src/app/init.sh"]
