## postgres

Features:

- Postgis 2.5.2
- Multi databases
- [Anyarray](https://github.com/JDBurnZ/postgresql-anyarray)

Usage:

```sh
docker run -d \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  -e POSTGRES_DB=maindb \
  -e ADDITIONAL_DB=db1,db2 \
  gustavohenrique/postgres:alpine
```
