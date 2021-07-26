-- Shane Hylton SQL Bridge Assignment 1

-- QUESTION 1

SELECT dest
FROM flights
WHERE distance=(select max(distance) from flights)
GROUP BY dest;
-- HNL is the farthest destination.

-- QUESTION 2
SELECT engines
FROM planes
GROUP BY engines
ORDER BY engines;
-- There are planes with 1, 2, 3, and 4 engines. 

SELECT engines, max(seats)
FROM planes
GROUP BY engines
ORDER BY engines;
-- Maximum seats for each engine count: 1: 16, 2: 400, 3: 379, 4: 450

SELECT DISTINCT model, seats
FROM planes
WHERE engines = 1 AND seats = (select max(seats) from planes WHERE engines = 1);

SELECT DISTINCT model, seats
FROM planes
WHERE engines = 2 AND seats = (select max(seats) from planes WHERE engines = 2);

SELECT DISTINCT model, seats
FROM planes
WHERE engines = 3 AND seats = (select max(seats) from planes WHERE engines = 3);

SELECT DISTINCT model, seats
FROM planes
WHERE engines = 4 AND seats = (select max(seats) from planes WHERE engines = 4);

-- The above four queries give the model and number of seats for 1, 2, 3, and 4 engine planes. 

-- Below is an attempt at making a list of four objects, showing the max seats per engine with model.

SELECT DISTINCT engines, model, seats
FROM planes
WHERE seats IN (select max(seats) from planes GROUP BY engines)
ORDER BY engines;


-- QUESTION 3
SELECT COUNT(*) AS 'Total Flight Count' from flights;
-- 336776 total flights

-- QUESTION 4
SELECT carrier AS 'Airline',
COUNT(*) AS 'Total Flights'
FROM flights
GROUP BY carrier;

-- QUESTION 5
SELECT carrier AS 'Airline',
COUNT(*) AS 'Total Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;


-- QUESTION 6
SELECT carrier AS 'Airline',
COUNT(*) AS 'Total Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- QUESTION 7
SELECT carrier AS 'Airline',
COUNT(*) AS 'Total Flights'
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- QUESTION 8
/*Show only the top 3 airlines, by number of flights directly to SEA,
ordered by number of flights in descending order.*/
SELECT carrier AS 'Airline',
COUNT(*) AS 'Total Flights',
dest AS 'Destination'
FROM flights
WHERE dest = 'SEA'
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 3;

