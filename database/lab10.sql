--Мамаев Илья ИС-312
--1
SELECT COUNT(*) FROM bookings
WHERE total_amount > (SELECT avg(total_amount) FROM bookings);

--2
INSERT INTO Seats(aircraft_code, seat_no, fare_conditions) 
VALUES  (763, '40D', (SELECT fare_conditions 
                      FROM seats 
                      WHERE seat_no = '2A' AND aircraft_code = '319' )),
        (763, '40E', (SELECT fare_conditions 
                      FROM seats 
                      WHERE seat_no = '2A' AND aircraft_code = '319' )),
        (763, '40F', (SELECT fare_conditions 
                      FROM seats 
                      WHERE seat_no = '2A' AND aircraft_code = '319' ));

--3
SELECT model FROM aircrafts
WHERE aircraft_code IN (SELECT aircraft_code 
                        FROM seats
	                    WHERE fare_conditions = 'Business'
	                    GROUP BY aircraft_code, fare_conditions
	                    HAVING COUNT(*) > 20);

--4
SELECT * FROM bookings 
WHERE total_amount = (SELECT MIN(total_amount) FROM bookings );

--5
SELECT passenger_name FROM tickets
WHERE book_ref IN (
SELECT book_ref FROM bookings
WHERE book_date = '2017-08-07 16:23:00+05');

--6
SELECT flight_no FROM flights
WHERE departure_airport = 'LED' AND arrival_airport = 'KZN'
GROUP BY flight_no

--7
SELECT * FROM ticket_flights
WHERE amount > (SELECT avg (amount) FROM ticket_flights) AND fare_conditions = 'Comfort'
ORDER BY amount ASC

--8
UPDATE tickets
SET passenger_name = 'EGOR'
WHERE book_ref IN (SELECT book_ref FROM bookings
	               WHERE book_date = '2017-07-24 23:18:00+05') 
                   AND passenger_name LIKE 'IVAN%';

--9
SELECT book_ref FROM bookings 
WHERE total_amount = (SELECT MIN(amount) FROM ticket_flights);

--10 
SELECT contact_data FROM tickets
WHERE book_ref IN (SELECT book_ref FROM bookings WHERE book_date = '2017-07-10') LIMIT 30;

--11
SELECT contact_data::json->'phone' AS user_phone FROM tickets
WHERE book_ref IN (SELECT book_ref FROM bookings WHERE book_date = '2017-07-10') LIMIT 30;