SELECT VERSION();


SELECT 5+3;


CREATE TABLE movies(movie_id int NOT NULL, movie_name varchar(40), movie_genre varchar(30), imdb_ratings real);


SELECT * FROM movies;


DROP TABLE movies;


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


DELETE FROM MOVIES
WHERE
	MOVIE_ID = 1;


UPDATE MOVIES
SET
	MOVIE_GENRE = 'Drama, Crime'
WHERE
	MOVIE_ID = 103;