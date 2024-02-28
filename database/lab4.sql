--ВЫПОЛНИЛ МАМАЕВ ИЛЬЯ
CREATE TABLE Salespeople(
	snum SERIAL not NULL PRIMARY KEY,
	sname TEXT,
	city TEXT,
	comm NUMERIC
);

CREATE TABLE Customers (
	cnum SERIAL not NULL PRIMARY KEY,
	cname TEXT,
	city TEXT,
	rating INTEGER,
	snum INTEGER NOT NULL REFERENCES Salespeople(snum)
);

CREATE TABLE Orders (
	onum SERIAL not null PRIMARY key,
	amt NUMERIC,
	odate DATE,
	cnum INTEGER NOT NULL REFERENCES Customers(cnum),
	snum INTEGER NOT NULL REFERENCES Salespeople(snum)
);

INSERT into Salespeople (snum, sname, city, comm)
	Values 
		(1002, 'Serres',  'San_Jose',  0.13), 
		(1007, 'Rifkun',  'Barcelona', 0.15), 
		(1001, 'Peel',    'London',    0.12), 
		(1004, 'Motika',  'London',    0.11), 
		(1003, 'Axelrod', 'New_York',  0.1);
	
INSERT into Customers (cnum, cname, city, rating, snum)
	VALUES (2001, 'Hoffman',  'London',   100, 1001), 
		   (2002, 'Giovanni', 'Rome',     200, 1003), 
		   (2003, 'Liu',      'San Jose', 200, 1002), 
		   (2004, 'Grass',    'Berlin',   300, 1002), 
		   (2006, 'Clamens',  'London',   100, 1001), 
		   (2007, 'Pereira',  'Rome',     100, 1004),
		   (2008, 'Cisneros', 'San Jose', 300, 1007);

INSERT into  Orders (onum, amt, odate, cnum, snum)
	VALUES (3001, 18.69,   '2015-03-10', 2008, 1007),
		   (3007, 72.72,   '2015-04-10', 2004, 1002),
		   (3003, 767.19,  '2015-03-10', 2001, 1001),
		   (3006, 1098.16, '2015-03-10', 2008, 1007),
		   (3010, 1309.95, '2015-06-10', 2004, 1002),
		   (3009, 1713.23, '2015-04-10', 2002, 1003),
		   (3002, 1900.1,  '2015-03-10', 2007, 1004),
		   (3008, 4723,    '2015-05-10', 2006, 1001),
		   (3005, 5160.45, '2015-03-10', 2003, 1002),
		   (3011, 9891.88, '2015-06-10', 2006, 1001);



--1
select onum, amt, odate from Orders;

--2
SELECT cnum, cname, city, rating from customers
where snum = 1003;

--3
SELECT cname, city from customers
where rating >= 200;

--4
SELECT onum, odate from Orders
ORDER by odate;

--5
SELECT cname from Customers
where city = 'London'
ORDER by cname;

--6
SELECT rating, cname from Customers
where city = 'San Jose';

--7
SELECT Distinct snum from Orders;

--8
SELECT sname, city from salespeople
where city = 'London' and comm > 0.1;

--9
SELECT cnum, cname from customers
where rating <= 100 and not city = 'Rome';

--10
SELECT onum, amt, odate, cnum, snum from Orders
where odate = '2015-03-10' or odate = '2015-04-10';

--11
SELECT distinct rating from customers;

--12
SELECT distinct odate from Orders;

--13
SELECT cnum, cname from Customers
where city in ('London', 'Berlin', 'Rome');

--14
SELECT onum, odate, cnum, snum from Orders
where amt between 1000 and 5000;

--15
SELECT cname from Customers
where cname like 'C%';

--16
SELECT sum (amt) from Orders
where odate = '2015-03-10';

--17
SELECT cname from Customers
where cname like 'G%'
ORDER by cname;