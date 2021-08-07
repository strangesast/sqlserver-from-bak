CREATE DATABASE ${DATABASE_NAME};
-- IF NOT EXISTS (
--   SELECT 1 FROM sys.databases WHERE name = '${DATABASE_NAME}'
-- )
-- BEGIN
--   RESTORE DATABASE $DATABASE_NAME
--   FROM DISK = '/data/${DATABASE_FILE}'
--   WITH MOVE '${DATABASE_NAME}' TO '/var/opt/mssql/data/${DATABASE_NAME}.mdf', MOVE '${DATABASE_NAME}_Log' TO '/var/opt/mssql/data/${DATABASE_NAME}_Log.ldf'
-- END
