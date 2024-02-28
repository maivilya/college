--Мамаев и Муминов ИС-312
--1
CREATE TABLE pilots (
    id_pilot SERIAL PRIMARY KEY,
    pilot_name TEXT NOT NULL,
    experience NUMERIC
);

--2
INSERT INTO pilots (pilot_name, experience)
VALUES ('Иван',  5),
       ('Петр',  2),
       ('Павел', 7),
       ('Борис', 1);

--3
ALTER TABLE pilots
ADD phone BIGINT;

UPDATE pilots
SET phone=88005553535
WHERE id_pilot=1;

UPDATE pilots
SET phone=88005553536
WHERE id_pilot=2;

UPDATE pilots
SET phone=88005553537
WHERE id_pilot=3;

UPDATE pilots
SET phone=88005553538
WHERE id_pilot=4;

--4
CREATE VIEW z_4 (name, airport_name, city)
AS SELECT airport_code, airport_name, city
FROM airports_data;
SELECT * FROM z_4;

--5
CREATE VIEW siberian_airports 
AS SELECT * FROM airports_data 
WHERE city->>'ru' = 'Новосибирск' OR city->>'ru' = 'Кемерово';
SELECT * FROM siberian_airports;

--6
CREATE VIEW z_6 
AS SELECT *
FROM airports_data AS ad, flights AS f
WHERE f.departure_airport = ad.airport_code AND (city->>'ru' = 'Москва' OR city->>'ru' = 'Санкт-Петербург');
	
SELECT ad.city->>'ru' AS arrival_city
FROM airports_data AS ad, z_6
WHERE z_6.arrival_airport = ad.airport_code
ORDER BY arrival_city DESC;

--7 
CREATE VIEW flights_city 
AS SELECT ad.city, COUNT(*) AS count_flights
FROM airports_data AS ad, flights AS f
WHERE f.departure_airport = ad.airport_code
GROUP BY ad.city
ORDER BY count_flights DESC;

SELECT * FROM flights_city
WHERE city->>'ru' LIKE 'А%';

--8
CREATE VIEW z_8
AS SELECT t.passenger_name, t.ticket_no
FROM tickets AS t, flights AS f, ticket_flights AS tf, airports_data AS ad
WHERE f.flight_id = tf.flight_id AND tf.ticket_no = t.ticket_no AND f.departure_airport = ad.airport_code
AND f.scheduled_departure BETWEEN '2017-09-05 11:15:00+05' AND '2017-09-05 17:15:00+05' AND ad.airport_name ->> 'ru' = 'Домодедово';
SELECT * FROM z_8;

--9
CREATE VIEW time_between  
AS SELECT actual_arrival - actual_departure AS time_bet
FROM flights
WHERE departure_airport IN (SELECT airport_code FROM airports_data WHERE city ->> 'ru' = 'Москва')
AND arrival_airport IN (SELECT airport_code FROM airports_data WHERE city ->> 'ru' = 'Казань');
OR arrival_airport IN (SELECT airport_code FROM airports_data WHERE city ->> 'ru' = 'Москва')
AND departure_airport IN (SELECT airport_code FROM airports_data WHERE city ->> 'ru' = 'Казань')
SELECT AVG(time_bet) FROM time_between;

--10
DROP VIEW IF EXISTS aircrafts;
DROP VIEW IF EXISTS airports CASCADE;
DROP VIEW IF EXISTS flights_v;
DROP VIEW IF EXISTS fligts_city;
DROP VIEW IF EXISTS routes;
DROP VIEW IF EXISTS siberian_airports;
DROP VIEW IF EXISTS z_4;
DROP VIEW IF EXISTS z_6;
DROP VIEW IF EXISTS z_8;
DROP VIEW IF EXISTS time_between;