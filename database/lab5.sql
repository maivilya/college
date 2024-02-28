--ВЫПОЛНИЛ МАМАЕВ ИЛЬЯ
CREATE TABLE Customer ( 
    id_customers INTEGER NOT NULL PRIMARY KEY,
    series_numbers VARCHAR(10) NOT NULL,
    telephone VARCHAR(50) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE Post (
    id_post INTEGER NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary INTEGER NOT NULL,
    employment_contract INTEGER NOT NULL
);

CREATE TABLE Employee (
    id_employee INTEGER NOT NULL PRIMARY KEY,
    maol TEXT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    access_night INTEGER NOT NULL,
    id_post INTEGER NOT NULL REFERENCES Post (id_post)
);

CREATE TABLE Application (
    id_aplication INTEGER NOT NULL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    design VARCHAR(50) NOT NULL,
    comments VARCHAR(50) NOT NULL,
    id_employee INTEGER NOT NULL REFERENCES Employee (id_employee),
    id_customers INTEGER NOT NULL REFERENCES Customer (id_customers),
    cost INTEGER NOT NULL
);

CREATE TABLE Project (
    id_project INTEGER NOT NULL PRIMARY KEY,
    notes VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_aplication INTEGER NOT NULL REFERENCES Application (id_aplication)
);

CREATE TABLE Department (
    id_departament INTEGER NOT NULL PRIMARY KEY,
    jur_adress VARCHAR(50) NOT NULL,
    departament_phone VARCHAR(11) NOT NULL,
    departament_mail VARCHAR(50) NOT NULL,
    id_project INTEGER NOT NULL REFERENCES Project (id_project),
    id_employee INTEGER NOT NULL REFERENCES Employee (id_employee)
);

CREATE TABLE report (
    report INTEGER NOT NULL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    id_project INTEGER NOT NULL REFERENCES Project (id_project),
    id_employee INTEGER NOT NULL REFERENCES Employee (id_employee),
    id_departament INTEGER NOT NULL REFERENCES Department (id_departament)
)