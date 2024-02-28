-- Мамаев, Муминов Ис-312

--1
CREATE TYPE type_for_flights_info AS (f
    light_no character(6),
    arrival_airport character(3),
    airport_name jsonb, 
    scheduled_arrival timestamp with time zone,	
    actual_arrival timestamp with time zone, 
    to_char text, 
    actual_departure timestamp with time zone, 
	status character varying(20)
);

CREATE FUNCTION flights_info() RETURNS SETOF type_for_flights_info AS $$
	SELECT flight_no, arrival_airport, 
    (SELECT airport_name FROM airports_data WHERE flights.arrival_airport = airports_data.airport_code),
	scheduled_arrival, actual_arrival,TO_CHAR(scheduled_departure, 'HH24:MI:SS'), actual_departure, status
	FROM flights O
    RDER BY scheduled_departure DESC;
$$ LANGUAGE SQL;

SELECT * FROM flights_info();

--2
CREATE FUNCTION zD2 (date1 timestamp with time zone)
RETURNS real AS $$

SELECT AVG(total_amount) FROM bookings WHERE TO_CHAR(book_date, 'DD:MM:YY') = TO_CHAR(date1, 'DD:MM:YY');
$$ LANGUAGE SQL;

SELECT zD2('2017-07-05');

--3
CREATE FUNCTION zd3(ad airports_data) RETURNS TEXT AS $$
	SELECT 'Аэропорт '::text || (ad.airport_name ->> 'ru') ::text || ' находится в городе '::text || (ad.city->>'ru')::text ||  ' и имеет код '::text
	|| ad.airport_code::text;
$$ LANGUAGE SQL;

SELECT zd3(airports_data.*) FROM airports_data WHERE LENGTH(city->>'ru') = 6;

--4
CREATE FUNCTION zadanie4 (class1 character varying(10)) RETURNS SETOF output2 AS $$
SELECT flight_no,  AVG(amount) AS average1  
FROM flights, ticket_flights WHERE fare_conditions = class1 AND ticket_flights.flight_id=flights.flight_id GROUP BY flight_no;
$$ LANGUAGE SQL;

SELECT DISTINCT * FROM zadanie4('Business') ORDER BY average1;

--5
CREATE TABLE refund_tickets(ticket_no CHARACTER(13) REFERENCES tickets(ticket_no),
						   total_amount NUMERIC(10,2),
						   reason TEXT);

CREATE FUNCTION z5 (number_t CHARACTER(13)) RETURNS real AS $$
SELECT SUM(amount) FROM ticket_flights WHERE ticket_no = number_t;
$$ LANGUAGE SQL;

CREATE PROCEDURE zp5 (number_t CHARACTER(13), reason1 TEXT) AS $$
INSERT INTO refund_tickets VALUES(number_t, z5(number_t), reason1);
$$ LANGUAGE SQL;

--6
CREATE FUNCTION zad6 (date2 text)RETURNS SETOF character(6) AS $$
SELECT flight_no FROM flights WHERE TO_CHAR(scheduled_departure, 'DD:MM:YY') = date2
$$ LANGUAGE SQL;

--7
CREATE FUNCTION zadani7 (number_t CHARACTER(13)) RETURNS SETOF TEXT AS $$
SELECT DISTINCT ad.city->>'ru' FROM airports_data AS ad, ticket_flights AS tf, flights AS f
WHERE (tf.ticket_no = number_t AND tf.flight_id = f.flight_id AND f.departure_airport = ad.airport_code) OR 
(tf.ticket_no = number_t AND tf.flight_id = f.flight_id AND f.arrival_airport = ad.airport_code);

$$ LANGUAGE SQL;

SELECT * FROM zadani7 ('0005435212386');
SELECT * FROM zadani7 ('0005432000992');
SELECT * FROM zadani7 ('0005433367257');
