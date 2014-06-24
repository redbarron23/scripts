#!/bin/bash
# Description: need number of records and size of full database backups from all POS and POA production servers
# Here are the list of DB Servers
# the script below should count records in each database.

# add additional hostname if needed
hostnames=( dcna-t-msql-01 dcna-t-msql-03 dcna-t-msql-04 dcna-t-msql-06)

for name in ${hostnames[@]}
do
      echo $name
         mysql -h $name -u$(cat /data0/ltdata/keystore/default_mysql.user) -p$(cat /data0/ltdata/keystore/default_mysql.pass) -e 'select @@hostname;';
         mysql -h $name -u$(cat /data0/ltdata/keystore/default_mysql.user) -p$(cat /data0/ltdata/keystore/default_mysql.pass) -e 'select table_schema, table_name, table_rows from information_schema.tables';
           echo ""
       done

       #mysql -h "dcna-t-msql-01" -u$(cat /data0/ltdata/keystore/default_mysql.user) -p$(cat /data0/ltdata/keystore/default_mysql.pass) -e 'select table_schema, table_name, table_rows from information_schema.tables';


#mysql> select @@hostname;
#+----------------+
#| @@hostname     |
#+----------------+
#| DCNA-T-MSQL-01 |
#+----------------+
#1 row in set (0.00 sec)

