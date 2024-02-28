--ВЫПОЛНИЛ МАМАЕВ ИЛЬЯ
CREATE TABLE  Salespeople(
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

INSERT into Salespeople (sname, city, comm)
	Values ('Serres',  'San_Jose',  0.13), 
           ('Rifkun',  'Barcelona', 0.15), 
           ('Peel',    'London',    0.12), 
           ('Motika',  'London',    0.11), 
           ('Axelrod', 'New_York',  0.1);
	
INSERT into Customers (cname, city, rating, snum)
	VALUES ('Hoffman',  'London',   100, 3), 
           ('Giovanni', 'Rome',     200, 5), 
           ('Liu',      'San Jose', 200, 1), 
           ('Grass',    'Berlin',   300, 1), 
           ('Clamens',  'London',   100, 3), 
           ('Pereira',  'Rome',     100, 4),
           ('Cisneros', 'San Jose', 300, 2);

INSERT into  Orders (amt, odate, cnum, snum)
	VALUES (18.69,   '2015-03-10', 7, 2),
		   (72.72,   '2015-04-10', 4, 1),
		   (767.19,  '2015-03-10', 1, 3),
		   (1098.16, '2015-03-10', 7, 2),
		   (1309.95, '2015-06-10', 4 ,1),
		   (1713.23, '2015-04-10', 2, 5),
		   (1900.1,  '2015-03-10', 6, 4),
		   (4723,    '2015-05-10', 5 ,3),
		   (5160.45, '2015-03-10', 3, 1),
		   (9891.88, '2015-06-10', 5, 3);