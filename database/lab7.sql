--ВЫПОЛНИЛ МАМАЕВ ИЛЬЯ
--Задание 1
SELECT * FROM BOOKINGS WHERE book_date = '2017-07-14' AND total_amount > 100000;

--Задание 2
SELECT * FROM FLIGHTS WHERE actual_arrival IS NULL;

--Задание 3
SELECT * FROM SEATS WHERE fare_conditions = 'Business';

--Задание 4
SELECT DISTINCT passenger_name FROM TICKETS ORDER BY passenger_name;

--Задание 5
SELECT airport_code,airport_name FROM AIRPORTS WHERE city = 'Москва';

--Задание 6
SELECT * FROM FLIGHTS WHERE scheduled_departure NOT BETWEEN '2017-08-09' AND '2017-09-04'; 

--Задание 7
SELECT * FROM TICKET_FLIGHTS WHERE amount BETWEEN 10000 AND 30000 ORDER BY amount DESC;

--Задание 8
SELECT * FROM SEATS WHERE fare_conditions !='Economy';

--Задание 9
SELECT * FROM FLIGHTS WHERE departure_airport = 'VKO' OR departure_airport = 'SVX';

--Задание 10
SELECT DISTINCT fare_conditions AS class FROM SEATS;

--Задание 11
SELECT * FROM BOOKINGS WHERE total_amount > 30000 LIMIT 1500 OFFSET 1000;

--Задание 12
SELECT airport_name, airport_code FROM AIRPORTS WHERE city IN ('Москва','Санк-Петербург','Екатеринбург','Нюрюнгри');

--Задание 13
SELECT seat_no FROM SEATS WHERE fare_conditions NOT IN ('economy','business');

--Задание 14
SELECT ticket_no, passenger_name FROM TICKETS WHERE passenger_name LIKE 'A%';

--Задание 15
SELECT passenger_id, passenger_name FROM TICKETS WHERE passenger_name LIKE 'ANNA%';
