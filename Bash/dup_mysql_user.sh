#!/bin/bash

#
# Script to add a new user to MySQL with the same permissions
# as an existing user.
#
# Just prints out the appropriate list of GRANT statements.
#
# another script I borrowed <author unknown>

PROGNAME=`basename $0`

usage() {
  echo "Usage: ${PROGNAME} <old_user> <new_user> <password>"
  exit 1
}

run_sql() {
  SQL="${1}"

  mysql --skip-column-names -u root -e "${SQL}" mysql
}

if [ $# != 3 ] ; then
  usage
else
  OLD_USER="${1}"
  NEW_USER="${2}"
  PASSWORD="${3}"
fi

HOSTS="$(run_sql "select host from user where user = '${OLD_USER}'")"

for host in ${HOSTS} ; do
  run_sql "show grants for '${OLD_USER}'@'${host}'" | \
    sed -e "s/'${OLD_USER}'/'${NEW_USER}'/" \
        -e "s/'\$/' IDENTIFIED BY '${PASSWORD}'/" \
    -e "s/WITH GRANT OPTION/IDENTIFIED BY '${PASSWORD}' &/" \
    -e "s/ IDENTIFIED BY PASSWORD '[^']*'//" \
        -e 's/$/;/'
done

echo "flush privileges;"
