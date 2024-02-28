-- Мамаев Илья Ис-212
--1
SELECT aircraft_code, COUNT(*) AS kolvo_mest  FROM seats GROUP BY aircraft_code ORDER BY kolvo_mest DESC;
--2
SELECT  aircraft_code, fare_conditions, COUNT(*) AS kolvo_mest  FROM seats GROUP BY  aircraft_code, fare_conditions ORDER BY aircraft_code, fare_conditions;
--3
ALTER TABLE bookings ALTER COLUMN book_date TYPE date;
SELECT book_date, min(total_amount) FROM bookings GROUP BY book_date;
--4
SELECT flight_id, fare_conditions, avg(amount) AS avg_amount FROM ticket_flights GROUP BY flight_id, fare_conditions ORDER BY flight_id DESC;
--5
SELECT flight_id, SUM(amount) AS avg_sum FROM ticket_flights GROUP BY flight_id ORDER BY avg_sum DESC LIMIT 10;
--6
SELECT aircraft_code, fare_conditions, COUNT(*) AS count_business_seats FROM seats WHERE fare_conditions='Business' GROUP BY aircraft_code, fare_conditions;
--7
SELECT aircraft_code, fare_conditions, COUNT(*) AS count_economy_seats FROM seats WHERE fare_conditions='Economy' and aircraft_code IN ('321', '320', '763') GROUP BY aircraft_code, fare_conditions ORDER BY count_economy_seats DESC;
--8
SELECT book_date, avg(total_amount) AS avg_amount FROM bookings WHERE book_date IN ('2017-07-01', '2017-08-01', '2017-08-11', '2017-07-11') GROUP BY  book_date ORDER BY  avg_amount DESC; 
--9
SELECT EXTRACT(MONTH FROM book_date) AS month, avg(total_amount) AS avg_amount FROM bookings GROUP BY book_date;
--10
SELECT min(range) FROM aircrafts_data WHERE aircraft_code IN('733', '763','773');