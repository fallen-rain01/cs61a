CREATE table newest AS
   SELECT title,year FROM titles ORDER BY year DESC LIMIT 10;


CREATE table dog_movies AS 
    SELECT title,character FROM titles AS a ,principals AS b WHERE a.tconst = b.tconst AND character LIkE '%dog%';

CREATE table leads AS 
     SELECT name,COUNT(*) AS lead_roles FROM names 
     JOIN principals ON names.nconst = principals.nconst 
     WHERE ordering = 1
     GROUP BY names.nconst HAVING COUNT(*) > 10;

CREATE table long_movies AS 
    SELECT CAST(year / 10 AS TEXT) || "0s" AS decade,COUNT(*) AS count  FROM titles 
    WHERE runtime > 180  
    GROUP BY CAST(year / 10 AS TEXT) || "0s";
