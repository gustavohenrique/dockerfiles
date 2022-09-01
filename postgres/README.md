## postgres

Features:

- Postgis 3.3.0
- Multi databases
- [Anyarray](https://github.com/JDBurnZ/postgresql-anyarray)

Usage:

```sh
docker run -d \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  -e POSTGRES_DB=maindb \
  -e ADDITIONAL_DB=db1,db2 \
  gustavohenrique/postgres:14-alpine
```

Enable PostGis:

```bash
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;
```
