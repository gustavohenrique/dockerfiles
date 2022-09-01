if [ ! -z "${ADDITIONAL_DB}" ] && [ "${ADDITIONAL_DB}" != "" ]; then
    for i in `echo "${ADDITIONAL_DB}" | tr "," "\n"`; do
        echo "I will create database $i..."
        "${psql[@]}" <<- EOSQL
DROP DATABASE IF EXISTS $i;
CREATE DATABASE $i;
DROP ROLE IF EXISTS $i;
CREATE ROLE $i NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;
EOSQL
    done
fi
