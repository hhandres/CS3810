--CS 3810 Homework 5
--Hoyt Andres

CREATE TABLE Airline
(
	Airline_id INT,
	Airline_name VARCHAR (255),
	Airline_home_country VARCHAR (64),
	PRIMARY KEY (Airline_id)
);

CREATE TABLE Customer_name
(
	Customer_id INT,
	First_name VARCHAR (32) NOT NULL,
	Last_name VARCHAR (32) NOT NULL,
	PRIMARY KEY (Customer_id)
);

CREATE TABLE Customer_address
(
	Customer_id INT,
	Street VARCHAR (32) NOT NULL,
	City VARCHAR (32) NOT NULL,
	State_or_Province VARCHAR (32) NOT NULL,
	Postal_code VARCHAR (16) NOT NULL,
	Country VARCHAR (32) NOT NULL,
	PRIMARY KEY (Customer_id)
);

CREATE TABLE Customer_phone
(
	Customer_id INT,
	Country_code INT,
	City_or_Area_code INT,
	Local_number VARCHAR(10),
	PRIMARY KEY (Customer_id)
);

CREATE TABLE Customer_email
(
	Customer_id INT,
	Email_1 VARCHAR (64),
	Email_2 VARCHAR (64),
	Email_3 VARCHAR (64),
	Email_4 VARCHAR (64),
	PRIMARY KEY (Customer_id)
);

CREATE TABLE Booking
(
	Customer_id INT,
	Booking_number INT,
	Booking_city VARCHAR (64),
	Booking_date VARCHAR (10),
	Unique_flight_number INT,
	Name_on_ticket VARCHAR (64),
	Payer_name VARCHAR (64),
	PRIMARY KEY (Booking_number),
	FOREIGN KEY (Unique_flight_number) REFERENCES Flights (Unique_flight_number)
);

CREATE TABLE Countries_covered
(
	Airline_id INT,
	Airline_name VARCHAR (255),
	Toronto BIT,
	Montreal BIT,
	New_York BIT,
	Chicago BIT,
	London BIT,
	Edinburgh BIT,
	Paris BIT,
	Nice BIT,
	PRIMARY KEY (Airline_id)
);

CREATE TABLE Flights
(
	Airline_id INT,
	Unique_flight_number INT,
	Airline_flight_number INT,
	Flight_length INT,
	Departure_city_code VARCHAR (3),
	Departure_date VARCHAR (10),
	Departure_time VARCHAR (10),
	Destination_city_code VARCHAR (3),
	Destination_date VARCHAR (10),
	Destination_time VARCHAR (10),
	PRIMARY KEY (Unique_flight_number)
);
	

