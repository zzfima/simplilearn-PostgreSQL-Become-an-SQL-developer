# simplilearn-PostgreSQL-Become-an-SQL-developer

from: https://www.simplilearn.com/free-postgresql-course-skillup?tag=postgresql

## sql commands
1. ![alt text](image.png)
1. show version
    ```
    SELECT VERSION();
    ```
1. show all databases (sql shell):
    ``` 
    \l
    ```
1. create db
    ```
    CREATE DATABASE sql_demo;
    ```
1. connect to db (sql shell)
    ```
    \c sql_demo
    ```
1. create table
    ```
    CREATE TABLE movies(movie_id int, movie_name varchar(40), movie_genre varchar(30), imdb_ratings real);
    ```
1. delete table
    ```
    DROP TABLE movies;
    ```
1. show all
    ```
    SELECT * FROM movies;
    ```
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
1. remove rows
    ```
    DELETE FROM movies 
    WHERE 
        movie_id = 1;
    ```
1. describe table (sql shell)
    ```
    \d movies
    ```
1. update rows
    ```
    UPDATE MOVIES
    SET
        MOVIE_GENRE = 'Drama, Crime'
    WHERE
        MOVIE_ID = 103;
    ```
1. display movies rating > 8.7
    ```
    SELECT * FROM movies
    WHERE
	    IMDB_RATINGS > 8.7;
    ```
1. display movies rating between 5 and 8.7
    ```
    SELECT * FROM movies
    WHERE
        IMDB_RATINGS > 5 AND IMDB_RATINGS < 8.7;
    ```
    or
    ```
    SELECT * FROM movies
    WHERE
        IMDB_RATINGS BETWEEN 5 AND 8.7;
    ```
1. display Action movies
    ```
    SELECT * FROM movies
    WHERE
        movie_genre LIKE '%Action%';
    ```
1. display only movie genre:
    ```
    SELECT movie_genre FROM movies;
    ```
1. display movies with rating 8.6, 8.5, 9. 
    
    *8.59 AND 8.61 becouse of float*
    ```
    SELECT * FROM movies
    WHERE 
        imdb_ratings BETWEEN 8.59 AND 8.61 OR imdb_ratings = 8.5 OR imdb_ratings = 9;
    ```
    or
    ```
    SELECT * FROM movies
    WHERE 
        imdb_ratings IN (8.6, 8.5, 9);
    ```
1. create table employees
    ```
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
    ```
1. Import csv employees_import.csv file into employees db.
        
    csv file in next format

        ```
        EMP_ID,EMP_NAME,EMAIL,GENDER,DEPARTMENT,ADDRESS,SALARY
        1,Briant Grantham,bgrantham@,Male,Business Development,Russia,86598.38
        2,Shurlocke Silcocks,ssilcocks1@,Male,Research and Development,Russia,73186.45
        3,Sibley Collingdon,scollingdc@,Male,Research and Development,Russia,56875.26
        4,Ninnette MacGaughey,nmacgaug@,Female,Marketing,France,68338.48
        5,Sophie Hamshere,shamshere@,Female,Services,Russia,89436.64
        ...
        ```
    1. in postgre manager click on table emloyees and select import/export -> select file and check 'Header'
    1. Or execute query:
        ```
        COPY employees(emp_id, emp_name, email, gender, department, address, salary)
        FROM 'C:\Temp\employees_import.csv'
        WITH (FORMAT csv, HEADER, DELIMITER ',');
        ```
1. display unique addresses:
    ```
    SELECT DISTINCT address FROM employees;
    ```
1. display rows where some field is null:
    ```
    SELECT * FROM employees
    WHERE email is NULL;
    ```
1. display all sorted by salary from small to large
    ```
    SELECT * FROM employees
    ORDER BY salary ASC;
    ```
1. display all sorted by salary from large to small
    ```
    SELECT * FROM employees
    ORDER BY salary DESC;
    ```
1. rename column name address to country
    ```
    ALTER TABLE employees
    RENAME column address TO country;
    ```
1. add column
    ```
    ALTER TABLE employees
    ADD Heigth REAL;
    ```
1. remove column
    ```
    ALTER TABLE employees
    DROP column Heigth;
    ```
1. change column type
    ```
    ALTER TABLE employees
    ALTER column Heigth TYPE integer;
    ```
1. display only 5 rows and skip first 2
    ```
    SELECT * FROM employees
    LIMIT 5 OFFSET 2;
    ```
1. display employees where name have second letter 'o'
    ```
    SELECT * FROM employees
    WHERE emp_name LIKE '_o%';
    ```
1. display sum of salaries under alias total_salary
    ```
    SELECT SUM(salary) AS total_salary FROM employees;
    ```
1. display max salary under alias max_salary
    ```
    SELECT MAX(salary) AS max_salary FROM employees;
    ```
1. display number of departments
    ```
    SELECT COUNT(DISTINCT department) AS deps_cnt FROM employees;
    ```
1. set department name Analytics if it was null
    ```
    UPDATE employees
    SET department = 'Analytics'
    WHERE department IS NULL;
    ```
1. find average salary of employees in each country
    ```
    SELECT AVG(salary) as average_salary, country FROM employees
    GROUP BY country ORDER BY average_salary DESC;
    ```
1. find the max, min and average salary per sex
    ```
    SELECT
        MIN(SALARY) AS MIN_SALARY, 
        MAX(SALARY) AS MAX_SALARY,
        AVG(SALARY) AS AVG_SALARY,
        gender
    FROM EMPLOYEES
    GROUP BY GENDER;
    ```
1. count amount of employees per country
    ```
    SELECT COUNT(emp_name) AS employees_count, country
    FROM employees
    GROUP BY country;
    ```
1. show countries where average salary > 50000 (dont display Germany)

    using __nested query__
    ```
    SELECT * FROM
        (SELECT country, avg(salary) as avg_salary
        FROM employees
        GROUP BY country)
    WHERE avg_salary > 50000;
    ```
    or using __having__ id much shorter
    ```
    SELECT country, avg(salary) as avg_salary
    FROM employees
    GROUP BY country 
    HAVING avg(salary) > 50000;
    ```
1. find count of employees per each country where is less than 10 employees (Russia will not be displayed)
    ```
    SELECT count(emp_name) emp_amount, country
    FROM employees
    GROUP BY country
    HAVING count(emp_name) < 10
    ORDER BY emp_amount;
    ```
1. create new column which will show salary rate of employee: low, med or high using __case__
    ```
    SELECT department, country, salary,
    CASE
        WHEN salary < 45000 
            THEN 'Very low salary'
        WHEN salary BETWEEN 45000 AND 55000
            THEN 'Low salary'
        WHEN salary BETWEEN 55000 AND 80000
            THEN 'Medium salary'
        WHEN salary > 80000
            THEN 'High salary'
    END AS salary_grade
    FROM employees;
    ```
1. find emloyee name, department of emoloyes their salary above average using __nested query__
    ```
    SELECT emp_name, department, country, salary
    FROM employees
    WHERE salary > (SELECT avg(salary) FROM employees);
    ```

1. math functions
    ```
    SELECT ABS(-100);
    SELECT GREATEST(1, 6, 88, 4, 5);
    SELECT LEAST(1, 6, 88, 4, 5);
    SELECT MOD(54, 10);
    SELECT POWER(2, 3);
    SELECT SQRT(9);
    SELECT CEIL(9.5);
    SELECT FLOOR(9.5);
    ```
1. string functions
    ```
    SELECT CHAR_LENGTH('HELLO WORLD');
    SELECT CONCAT('HELLO ', 'WORLD', '!');
    SELECT LEFT('HELLO WORLD !!!', 3);
    SELECT RIGHT('HELLO WORLD !!!', 3);
    SELECT REPEAT('HELLO WORLD !!!', 3);
    SELECT REVERSE('HELLO WORLD !!!');
    ```
1. count emails using __user defined functons__

    creating user definded function for count emails
    ```
    CREATE OR REPLACE FUNCTION count_emails()
    RETURNS integer AS $total_emails$
    DECLARE
        total_emails integer;
    BEGIN
        SELECT COUNT(email) INTO total_emails
        FROM employees;
        RETURN total_emails;
    END;
    $total_emails$ LANGUAGE plpgsql;
    ```
    using function
    ```
    SELECT count_emails();
    ```