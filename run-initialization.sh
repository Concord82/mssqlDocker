# Wait to be sure that SQL Server came up
sleep 90s

echo '###################################################'
echo '#             Start DB Initialize                 #'
echo '###################################################'

# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i create-database.sql \
    -v DBASE=$DBASE \
    -v USER_NAME=$USER_NAME \
    -v USER_PASS=$USER_PASS