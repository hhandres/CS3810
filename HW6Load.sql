--HW6Load.sql
--CS 3810 Fall 2017
--Hoyt Andres

CREATE TABLE Flights
(
	Airline VARCHAR (64),
	Flight_number INT,
	Origin VARCHAR (32),
	Destination VARCHAR (32),
	Departure_date VARCHAR (10),
	Departure_time VARCHAR (10),
	Arrival_date VARCHAR (10),
	Arrival_time VARCHAR (10),
	Flight_length VARCHAR (32),
	PRIMARY KEY (Flight_number)
);

CREATE TABLE Customers
(
	Customer_id SERIAL PRIMARY KEY,
	First_name VARCHAR (32) NOT NULL,
	Last_name VARCHAR (32) NOT NULL,
	Street VARCHAR (32) NOT NULL,
	City VARCHAR (32) NOT NULL,
	State VARCHAR (2) NOT NULL,
	Zip VARCHAR (5) NOT NULL,
	Country VARCHAR (32) NOT NULL,
	Country_code INT,
	Area_code INT NOT NULL,
	Local_number VARCHAR (8) NOT NULL,
	Email1 VARCHAR (64),
	Email2 VARCHAR (64),
	Email3 VARCHAR (64),
	Email4 VARCHAR (64)
);

CREATE TABLE Reservations
(
	Reservation_id SERIAL PRIMARY KEY,
	Customer_name VARCHAR (64),
	Flight_number INT,
	Date VARCHAR (10),
	Origin VARCHAR (32),
	Destination VARCHAR (32),
	Departure_time VARCHAR (10),
	Arrival_time VARCHAR (10)
);

COPY Flights 
FROM 'C:\Database\Flights.csv' DELIMITER ',' CSV HEADER;


