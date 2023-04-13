--1)Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
AND
POPULATION > 100000;

--2)Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME 
FROM CITY
WHERE COUNTRYCODE = 'USA'
AND 
POPULATION > 120000;

--3)Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;

--4)Query all columns for a city in CITY with the ID 1661.
SELECT *
FROM
CITY
WHERE
ID = 1661;

--5)Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT *
FROM CITY
WHERE
COUNTRYCODE = 'JPN';

--6)Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--7)Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;

--8)Query a list of CITY names from STATION for cities that have an even ID number. 
--Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY
FROM STATION
WHERE ID %2 = 0;

--9)Find the difference between the total number of CITY entries in the table 
--and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

--10)Query the two cities in STATION with the shortest and longest CITY names, 
--as well as their respective lengths (i.e.: number of characters in the name). 
--If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY ASC LIMIT 1)
UNION
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC LIMIT 1);

--11)Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
--Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE (CITY LIKE 'A%')
    OR(CITY LIKE 'E%') 
    OR(CITY LIKE 'I%')   
    OR(CITY LIKE 'O%') 
    OR(CITY LIKE 'U%');  
    
--12)Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
--Your result cannot contain duplicates.

SELECT DISTINCT CITY 
FROM STATION 
WHERE (CITY LIKE '%A')
    OR(CITY LIKE '%E') 
    OR(CITY LIKE '%I')   
    OR(CITY LIKE '%O') 
    OR(CITY LIKE '%U');  
    
--13)Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their 
--first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) IN ('A','E','I','O','U') AND
LOWER(SUBSTR(CITY,LENGTH(CITY),1)) IN ('A','E','I','O','U');

--14)Query the list of CITY names from STATION that do not start with vowels. 
--Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM
STATION
WHERE CITY REGEXP '^[^aeiou]';

--15)Query the list of CITY names from STATION that do not end with vowels. 
--Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '[AEIOU]$'

--16)Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
--Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM
STATION
WHERE CITY REGEXP '^[^aeiou]'
OR 
CITY NOT REGEXP '[AEIOU]$';

--17)Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
--Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM
STATION
WHERE CITY REGEXP '^[^aeiou]'
AND
CITY NOT REGEXP '[AEIOU]$';

--18)Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
--If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3) ASC, ID;

--19)Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME ASC;
--20)Write a query that prints a list of employee names (i.e.: the name attribute)
--for employees in Employee having a salary greater than 2000  per month 
--who have been employees for less than 10 months. Sort your result by ascending employee_id.
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000
AND
MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;
--21)Query the average population of all cities in CITY where District is California.
SELECT AVG(POPULATION) 
FROM CITY 
WHERE DISTRICT = 'CALIFORNIA';

--22)Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT FLOOR (AVG(POPULATION))
FROM CITY;

--23)Query the sum of the populations for all Japanese cities in CITY. 
--The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION) 
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--24)Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

--25)Write a query calculating the amount of error (i.e.: Actual - Miscalculated average monthly salaries), 
--and round it up to the next integer.
SELECT CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))
FROM EMPLOYEES;

--26) Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
--Then print these values as 2 space-separated integers.
SELECT MAX(SALARY * MONTHS), COUNT(NAME)
FROM EMPLOYEE 
GROUP BY (SALARY * MONTHS)
ORDER BY (SALARY * MONTHS) DESC LIMIT 1

--27)Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of 2 decimal places.
--The sum of all values in LONG_W rounded to a scale of 2 decimal places.
SELECT ROUND(SUM(LAT_N), 2) , ROUND(SUM(LONG_W), 2)
FROM STATION;

--28)Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880
--and less than 137.23.45 . Truncate your answer to  decimal places.
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 
AND
LAT_N < 137.2345

--29)Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 .
--Truncate your answer to  decimal places.
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

--30)Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 .
--Round your answer to 4  decimal places.
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC LIMIT 1;

--31)Query the total population of all cities in CITY where District is California.
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

--32)Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . Round your answer to 4 decimal places.
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION 
WHERE (LAT_N) > 38.7780

--33)Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places
SELECT ROUND(LONG_W, 4) 
FROM STATION 
WHERE (LAT_N) > 38.7780
ORDER BY LAT_N LIMIT 1;

--33)Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places
SELECT ROUND(LONG_W, 4) 
FROM STATION 
WHERE (LAT_N) > 38.7780
ORDER BY LAT_N LIMIT 1;

--33)Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places
SELECT ROUND(LONG_W, 4) 
FROM STATION 
WHERE (LAT_N) > 38.7780
ORDER BY LAT_N LIMIT 1;




