if [ ! -z "${ADDITIONAL_DB}" ] && [ "${ADDITIONAL_DB}" != "" ]; then
    for i in `echo "${ADDITIONAL_DB}" | tr "," "\n"`; do
        echo "I will create database $i..."
        "${psql[@]}" <<- EOSQL
CREATE DATABASE $i;
EOSQL
    done
fi
