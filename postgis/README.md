# gustavohenrique/postgis

This image ensures that the default database created by the parent `postgres` image will have the following extensions installed:

* `postgis`
* `postgis_topology`
* `fuzzystrmatch`
* `postgis_tiger_geocoder`
* `citext`
* `uuid-ossp`

Also, this image have the [anyarray-functions](https://github.com/JDBurnZ/postgresql-anyarray) created:

| Function | Description | Example | Expected |
|----------|-------------|---------|----------|
|`anyarray_concat`|Returns the first argument with values from the second argument appended to it|`SELECT anyarray_concat(ARRAY[1, 2],ARRAY[2, 3]);`|{1,2,2,3}|
|`anyarray_concat_uniq`|Returns the first argument with values from the second argument (which are not in the first argument) appended to it|`SELECT anyarray_concat_uniq(ARRAY['one', 'two'], ARRAY['two', 'three']);`|{one,two,three}|
|`anyarray_diff`|Returns an array of every element which is not common between arrays|`SELECT anyarray_diff(ARRAY['one', 'one', 'two'], ARRAY['two', 'three', 'four', 'four']);`|{one,one,three,four,four}|
|`anyarray_diff_uniq`|Returns an array of every unique value which is not common between arrays|`SELECT anyarray_diff_uniq(ARRAY[1, 1, 2], ARRAY[2, 3, 4, 4]);`|{1,3,4}|
|`anyarray_numeric_only`|Returns the array passed with all non-numeric values removed from it. Retains whole and decimal values|`SELECT anyarray_numeric_only(ARRAY['1', '1.1', '1.1a', '1.a', 'a']::text[]);`|{1,1.1}|
|`anyarray_ranges`|Converts an array of values into ranges. Currently only supports smalling, integer and bigint|`SELECT anyarray_ranges(ARRAY[1, 2, 4, 5, 6, 9]);`|{1-2,4-6,9}|
|`anyarray_remove`|Returns the first argument with all values from the second argument removed from it|`SELECT anyarray_remove(ARRAY['one', 'two'], ARRAY['two', 'three']);`|{one}|
|`anyarray_remove_null`|Returns an array with all occurrences of NULL omitted|`SELECT anyarray_remove_null(ARRAY[1, 2, NULL, 4]);`|{1,2,4}|
|`anyarray_sort`|Returns the array, sorted|`SELECT anyarray_sort(ARRAY[1, 46, 15, 3]);`|{1,3,15,46}|
|`anyarray_uniq`|Returns an array of unique values present within the array passed|`SELECT anyarray_uniq(ARRAY['one', 'two', 'three', 'two', 'one']);`|{one,two,three}|

## Usage

Create a container with volume mapped to local directory

```
docker run -d --name mydb -v $PWD/.postgres_data:/var/lib/postgresql/data -p 5123:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydatabase gustavohenrique/postgis:11
```

Access Postgres console CLI (psql)

```
docker exec -it mydb bash -c 'psql -U admin mydatabase'
```

Create table using some installed extensions

```
CREATE TABLE mytable (
  id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  somename CITEXT NOT NULL DEFAULT 'test',
  geoplace GEOGRAPHY(POINT, 4326) NOT NULL,
  tags TEXT[]
);
```

