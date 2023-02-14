# Assignment 1

## Start HDFS and Hive

* Setup HDFS in pseudo-distributed mode.

* Start HDFS

```bash
cd ${HADOOP_HOME} && ./sbin/start-dfs.sh && ./sbin/start-yarn.sh
```

* Start Hive: In a terminal, type in this command

```bash
hiveserver2
```

* Start beeline (client to interact with hive)

```bash
beeline -u jdbc:hive2://localhost:10000
```

## Import from CSV file to MySQL

* Convert from file in `window-1252` codec to `utf-8` codec.

```bash
iconv -f windows-1252 -t utf-8 movies.dat > movies-utf8.dat
```

* Import from `csv` file to MySQL tables

```bash
mysqlimport \
  --default-character-set='utf8' \
  --lines-terminated-by='\n' \
  --fields-terminated-by='::' \
  --verbose \
  --local \
  -ubiclass \
  -p \
  movielens movies.dat
```

## Import from MySQL to HDFS using Sqoop

* Code Generation

```bash
sqoop codegen \
  --connect jdbc:mysql://localhost:3306/movielens \
  --fields-terminated-by ';' \
  --username biclass \
  --password biclass \
  --table movies
```

* Copy the path to generated code after above command and replace the path in `-libjars` parameters in the below command.

* Sqoop Import

```bash
sqoop import \
  -libjars /tmp/sqoop-hungnd/compile/28796f49869e41aa6b76847856c66667/movies.jar \
  --m 1 \
  --connect jdbc:mysql://localhost:3306/movielens \
  --table movies \
  --username biclass \
  --password biclass \
  --target-dir /user/hungnd/movielens/movies \
  --fields-terminated-by ';'
```

* Check the input result

```bash
hdfs dfs -cat /user/hungnd/movielens/movies/*
```

* Create external table in Hive: an example with movies table

```bash
beeline -n hungnd -u jdbc:hive2://localhost:10000

create database movielens;

create external table if not exists movielens.movies (
  id integer,
  title string,
  genre string
)
comment 'movies table'
row format delimited
fields terminated by ';'
stored as textfile
location '/user/hungnd/movielens/movies/';
```

## Run analytic queries on MySQL and Hive

| Query                                     | Hive (ms) | MySQL (ms) |
| ----------------------------------------- | --------- | ---------- |
| Count the number of user records          | 19,458    | 6          |
| Count the number of rating records        | 20,782    | 52         |
| Simple group by (num. users by rating)    | 20,898    | 837        |
| Any bias in the gender of users?          | 22,285    | 23         |
| Average rating by age group? (join + agg) | 26,710    | 912        |

## References

* [Movielens dataset](https://grouplens.org/datasets/movielens/)

* [Apache Hadoop Official Tutorial](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#Standalone_Operation)

* [Permission Denied error](https://stackoverflow.com/questions/42756555/permission-denied-error-while-running-start-dfs-sh)

* [JAVA_HOME error](https://stackoverflow.com/questions/21533725/hadoop-2-2-0-fails-running-start-dfs-sh-with-error-java-home-is-not-set-and-cou)

* [Hive Installation](https://data-flair.training/blogs/apache-hive-installation/)

* [MySQL Installation](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)

* [Sqoop Installation](https://juheck.gitbooks.io/hadoop-and-big-data/content/data-ingestion/data-ingestion/sqoop.html)
