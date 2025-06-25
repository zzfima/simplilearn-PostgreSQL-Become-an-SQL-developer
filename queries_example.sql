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


SELECT * FROM movies
WHERE
	IMDB_RATINGS > 8.7;


SELECT * FROM movies
WHERE
	IMDB_RATINGS > 5 AND IMDB_RATINGS < 8.7;


SELECT * FROM movies
WHERE
	IMDB_RATINGS BETWEEN 5 AND 8.7;


SELECT * FROM movies
WHERE
	movie_genre LIKE '%Action%';


SELECT movie_genre FROM movies;


SELECT * FROM movies
WHERE 
	imdb_ratings BETWEEN 8.59 AND 8.61 OR imdb_ratings = 8.5 OR imdb_ratings = 9;


SELECT * FROM movies
WHERE 
	imdb_ratings IN (8.6, 8.5, 9);


CREATE TABLE employees
(
	EMP_ID INT NOT NULL PRIMARY KEY,
	EMP_NAME VARCHAR(40),
	EMAIL VARCHAR(40),
	GENDER VARCHAR(10),
	DEPARTMENT VARCHAR(40),
	ADDRESS VARCHAR(40),
	SALARY REAL
);


INSERT INTO employees (EMP_ID, EMP_NAME, EMIL, GENDER, DEPARTMENT, ADDRESS, SALARY) 
VALUES
(1, 'Briant Grantham', 'bgrantham@', 'Male', 'Business Development', 'Russia', 86598.38),
(2, 'Shurlocke Silcocks', 'ssilcocks1@', 'Male', 'Research and Development', 'Russia', 73186.45),
(3, 'Sibley Collingdon', 'scollingdc@', 'Male', 'Research and Development', 'Russia', 56875.26),
(4, 'Ninnette MacGaughey', 'nmacgaug@', 'Female', 'Marketing', 'France', 68338.48),
(5, 'Sophie Hamshere', 'shamshere@', 'Female', 'Services', 'Russia', 89436.64),
(6, 'Quintilla Alden', 'qalden5@', 'Male', 'Research and Development', 'Russia', 57366.79),
(7, 'Conant Moehler', '', 'Female', 'Accounting', 'Russia', 98111.94),
(8, 'Alexia Aukland', 'aaukland7@', 'Male', 'Marketing', 'Germany', 48282.33),
(9, 'Tommy Jandourek', 'tjandoure@', 'Female', 'Accounting', 'Russia', 92659.12),
(10, 'Joseito Fackney', 'jfackney9@', 'Male', 'Sales', 'Russia', 64723.82),
(11, 'Jude Fluger', 'jflugera@', 'Female', 'Engineering', 'United States', 116125.1),
(12, 'Ginger Cheeke', 'gcheekeb@', 'Female', 'Product Management', 'Israel', 55763.2),
(13, 'Fenelia Trude', 'ftrudec@', 'Female', 'Services', 'United States', 81973.05),
(14, 'Swen Teasdale-Markie', 'steasdalei@', 'Male', 'Support', 'Russia', 49424.26),
(15, 'Susan Shipp', 'sshippe@', 'Male', '', 'United States', 110568.5),
(16, 'Rebekah Callis', 'rcallisf@', 'Female', 'Business Development', 'France', 119161.6),
(17, 'Kerrin Rymill', 'krymillg@', 'Male', 'Legal', 'France', 76205.76),
(18, 'Woodrow Acland', 'waclandhh@', 'Male', 'Accounting', 'Russia', 107828.8),
(19, 'Malissa Anthony', 'manthony@', 'Female', 'Accounting', 'Russia', 118151.2),
(20, 'Garnet Klehn', '', 'Male', 'Marketing', 'Russia', 47262.47),
(21, 'Biddy Nazer', 'bnazerk@', 'Male', 'Human Resources', 'Russia', 91071.43),
(22, 'Markus Falla', 'mfaliaiie@', 'Male', 'Services', 'Russia', 62394.31),
(23, 'Leanor Benedidick', 'lbenedidick@', 'Female', 'Human Resources', 'France', 54413.63),
(24, 'Cort Lansly', 'clanslyn@', 'Female', 'Sales', 'Russia', 63138.92);


SELECT * FROM employees;


COPY employees(emp_id, emp_name, email, gender, department, address, salary)
FROM 'C:\Temp\employees_import.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',');


