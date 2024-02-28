--ВЫПОЛНИЛ МАМАЕВ ИЛЬЯ
CREATE TABLE BOOKINGS (
    book_ref VARCHAR(6) NOT NULL PRIMARY KEY,
    book_date DATE NOT NULL,
    total_amount REAL NOT NULL
);

CREATE TABLE TICKETS (
    ticket_no BIGINT NOT NULL PRIMARY KEY,
    book_ref VARCHAR(6) NOT NULL REFERENCES BOOKINGS(book_ref),
    passenger_id INTEGER NOT NULL,
    passenger_name TEXT NOT NULL,
    contact_data TEXT
);

CREATE TABLE AIRPORTS (
    airport_code VARCHAR(3) NOT NULL PRIMARY KEY,
    airport_name TEXT NOT NULL,
    city TEXT NOT NULL,
    longitude REAL NOT NULL,
    latitude REAL NOT NULL ,
    timezone TEXT NOT NULL
);

CREATE TABLE AIRCRAFTS (
    aircraft_code VARCHAR NOT NULL PRIMARY KEY,
    model VARCHAR NOT NULL,
    range INTEGER NOT NULL
);

CREATE TABLE FLIGHTS (
    flight_id INTEGER NOT NULL PRIMARY KEY,
    flight_no VARCHAR(6) NOT NULL,
    scheduled_departure DATE NOT NULL,
    scheduled_arrival DATE NOT NULL,
    departure_airport VARCHAR(3) NOT NULL REFERENCES AIRPORTS(airport_code),
    arrival_airport VARCHAR(3) NOT NULL REFERENCES AIRPORTS(airport_code),
    status TEXT NOT NULL,
    aircraft_code VARCHAR NOT NULL REFERENCES AIRCRAFTS(aircraft_code),
    actual_departure TIME NOT NULL,
    actual_arrival TIME NOT NULL
);

CREATE TABLE TICKET_FLIGHTS (
    flight_id INTEGER NOT NULL REFERENCES FLIGHTS(flight_id),
    ticket_no BIGINT NOT NULL REFERENCES Tickets(ticket_no),
    fare_conditions TEXT NOT NULL,
    amount REAL NOT NULL,
    PRIMARY KEY(ticket_no,flight_id)
);

CREATE TABLE SEATS (
    aircraft VARCHAR NOT NULL REFERENCES AIRCRAFTS(aircraft_code),
    seat_no VARCHAR NOT NULL,
    fare_conditions TEXT NOT NULL,
    PRIMARY KEY (aircraft,seat_no)
);

CREATE TABLE BOARDING_PASSES (
    ticket_no BIGINT NOT NULL,
    flight_id INTEGER NOT NULL,
    FOREIGN KEY(ticket_no,flight_id) REFERENCES TICKET_FLIGHTS(ticket_no,flight_id),
    boarding_no INTEGER NOT NULL,
    seat_no VARCHAR NOT NULL,
    PRIMARY KEY (ticket_no,flight_id)
);

INSERT INTO AIRPORTS(airport_code,airport_name,city,longitude,latitude,timezone) 
VALUES ('LED','Пулково', 'Санкт-Петербург','30.315785','59.939039','МСК'),
       ('SVX','Кольцово','Екатеринбург',   '60.8027',  '56.743099','МСК+2');

INSERT INTO AIRCRAFTS(aircraft_code,model,range) 
VALUES  ('A321','Airbus A321','10000'),
        ('B712','Boeing 717', '12000');

INSERT INTO SEATS(aircraft,seat_no,fare_conditions) 
VALUES  ('A321','11B','economy'),
        ('B712','1A', 'business');
INSERT INTO FLIGHTS(
                    flight_id,flight_no,scheduled_departure, scheduled_arrival,departure_airport,arrival_airport,
                    status, aircraft_code,actual_departure,actual_arrival) 
VALUES  ('48632','PS4729','2022-02-03','2022-02-03','LED','SVX','Departed','A321','15:00:00','18:15:00'),
        ('75321','RT4468','2022-02-04','2022-02-04','SVX','LED','Delayed', 'B712','19:00:00','21:30:00');

INSERT INTO BOOKINGS(book_ref,book_date,total_amount) 
VALUES  ('AAA765','2022-02-03','20000');

INSERT INTO TICKETS (ticket_no,book_ref,passenger_id, passenger_name,contact_data) 
VALUES  ('4829503958654','AAA765','719133','Rerin_Nikita','79122345678');

INSERT INTO TICKET_FLIGHTS(ticket_no, flight_id,fare_conditions,amount) 
VALUES('4829503958654','48632','economy','10000');

INSERT INTO BOARDING_PASSES(ticket_no, flight_id,boarding_no,seat_no) 
VALUES  ('4829503958654','48632','2','11B');