# simplilearn-PostgreSQL-Become-an-SQL-developer

from: https://www.simplilearn.com/free-postgresql-course-skillup?tag=postgresql

## sql commands
1. ![alt text](image.png)
1. show version `select version();`
1. show all databases (sql shell): `\l`
1. create db: `create database sql_demo;`
1. connect to db: `\c sql_demo;`
1. create table `CREATE TABLE movies(movie_id int, movie_name varchar(40), movie_genre varchar(30), imdb_ratings real);`
1. delete table `DROP TABLE movies;`
1. show all: `SELECT * FROM movies;`
1. insert data: 
    ```
    INSERT INTO 
        movies (movie_id, movie_name, movie_genre, imdb_ratings)
    VALUES
        (101, 'Vertigo', 'Mystery, Romance', 8.3),
        (102, 'The Shawshank Redemption', 'Crime Fiction', 9.3),
        (103, '12 Angry Men', 'Drama', 9.0),
        (104, 'The Dark Knight', 'Action', 9.0),
        (105, 'The Matrix', 'Sci-Fi', 8.7),
        (106, 'Se7en', 'Crime', 8.6),
        (107, 'Interstellar', 'Adventure', 8.6),
        (108, 'The Lion King', 'Animation, Adventure', 8.5);
    ```
1. remove rows `DELETE FROM movies WHERE movie_id = 1;`
1. describe table (sql shell): `\d movies`
1. update rows
    ```
    UPDATE MOVIES
    SET
        MOVIE_GENRE = 'Drama, Crime'
    WHERE
        MOVIE_ID = 103;
    ```
1. 