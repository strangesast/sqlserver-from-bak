-- CREATE DATABASE ${DATABASE_NAME};
IF NOT EXISTS (
  SELECT 1 FROM sys.databases WHERE name = '${DATABASE_NAME}'
)
BEGIN
  RESTORE DATABASE $DATABASE_NAME
  FROM DISK = N'/data/${DATABASE_FILE}' WITH FILE = 2,
    MOVE N'${DATABASE_NAME}' TO N'/var/opt/mssql/data/${DATABASE_NAME}.mdf',
    MOVE N'${DATABASE_NAME}_log' TO N'/var/opt/mssql/data/${DATABASE_NAME}_log.ldf',
    STATS = 10
END

