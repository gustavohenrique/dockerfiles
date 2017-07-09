## Quick start

```bash
$ docker run -d --name mysql -e 'DB=mydatabase' -e 'USER=gustavo' -e 'PASS=docker' gustavohenrique/mysql
```

## Keep data

You should mount a volume at `/var/lib/mysql` to keep data saved.

```
$ docker run -d --name mysql -e 'DB=mydatabase' -e 'USER=gustavo' -e 'PASS=docker' -v $PWD/mysql:/var/lib/mysql gustavohenrique/mysql
```

This will make sure that the data stored in the database is not lost when the container is stopped and started again.

## Restore dump

```
$ docker run -d --name mysql -e 'DB=mydatabase' -e 'USER=gustavo' -e 'PASS=docker' -e 'DUMP=/tmp/data.sql' -v $PWD/dump:/tmp/dump gustavohenrique/mysql
```

