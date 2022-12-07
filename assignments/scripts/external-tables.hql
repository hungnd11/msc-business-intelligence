create database movielens;

-- movies table
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

-- users table
create external table if not exists movielens.users (
  id integer,
  gender string,
  age integer,
  occupation integer,
  zipcode string
)
comment 'users table'
row format delimited
fields terminated by ';'
stored as textfile
location '/user/hungnd/movielens/users/';

-- ratings table
create external table if not exists movielens.ratings (
  user_id integer,
  movie_id integer,
  rating integer,
  time_ms bigint
)
comment 'ratings table'
row format delimited
fields terminated by ';'
stored as textfile
location '/user/hungnd/movielens/ratings/';