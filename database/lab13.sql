-- Мамаев Илья Иc-312
--1
CREATE ROLE administrator LOGIN PASSWORD '123' SUPERUSER;

--2
CREATE ROLE registrator;
GRANT SELECT ON bookings, tickets, flights TO registrator;
GRANT INSERT, UPDATE ON boarding_passes TO registrator;

--3
CREATE ROLE user_1 LOGIN PASSWORD '123' INHERIT;
CREATE ROLE user_2 LOGIN PASSWORD '123' INHERIT;
CREATE ROLE user_2 LOGIN PASSWORD '123' INHERIT;

--4
GRANT registrator TO user_1, user_2, user_2;

--5
ALTER ROLE user_1 VALID UNTIL '11.11.2111';
ALTER ROLE user_2 VALID UNTIL '11.11.2111';
ALTER ROLE user_2 VALID UNTIL '11.11.2111';

--6
CREATE ROLE mechanic_role;
GRANT SELECT on aircrafts_data, seats, flights, airports_data to mechanic_role;

--7
CREATE ROLE mechanic_user_1 LOGIN IN ROLE mechanic_role PASSWORD '123';
CREATE ROLE mechanic_user_2 LOGIN IN ROLE mechanic_role PASSWORD '123';

--8
CREATE ROLE user_noinherit LOGIN PASSWORD '123';
ALTER ROLE user_noinherit NOINHERIT;
GRANT user_noinherit TO registrator;

--9
CREATE ROLE role_creator CREATEROLE;

--10
DROP ROLE mechanic_role, mechanic_user_1, mechanic_user_2;
REVOKE ALL ON aircrafts_data, seats, flights, airports_data FROM mechanic_role, mechanic_user_2, mechanic_user_1;
