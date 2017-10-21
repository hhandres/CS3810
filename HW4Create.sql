--CS3810 Hoyt Andres

CREATE TABLE Airline_Name
(
	Airline_id INT,
	Carrier_name VARCHAR(255),
	CONSTRAINT PK_Airline_Name PRIMARY KEY (Airline_id, Carrier_name)
);


CREATE TABLE Flight_Info
(
	Airline_id INT,
	Carrier_name VARCHAR(255),
	Origin VARCHAR (5),
	Origin_city_name VARCHAR (64),
	Origin_state_nm VARCHAR (64),
	Origin_state_abr VARCHAR (3),
	Dest VARCHAR (5),
	Dest_city_name VARCHAR (64),
	Dest_state_nm VARCHAR (64),
	Dest_state_abr VARCHAR (3),
	Seats INT,
	Passengers INT,
	Distance INT,
	Payload INT,
	Mail INT,
	Freight INT,
	Departures_scheduled INT,
	Departures_performed INT,
	Ramp_to_ramp INT,
	Air_time INT,
	Region VARCHAR (2),
	Origin_airport_id INT,
	Origin_airport_seq_id INT,
	Origin_city_market_id INT,
	Origin_state_fips INT,
	Origin_wac INT,
	Dest_airport_id INT,
	Dest_airport_seq_id INT,
	Dest_city_market_id INT,
	Dest_state_fips INT,
	Dest_wac INT,
	CONSTRAINT PK_Flight_Info PRIMARY KEY (Airline_id, Origin, Dest, Seats, Passengers, Payload)
);


CREATE TABLE Carrier_and_airplane_info
(
	Airline_id INT,
	Unique_carrier_name VARCHAR (255),
	Unique_carrier_entity VARCHAR (32),
	Unique_carrier VARCHAR (32),
	Carrier VARCHAR (10),
	Carrier_group INT,
	Carrier_group_new INT,
	Aircraft_group INT,
	Aircraft_type INT,
	Aircraft_config INT,
	Distance_group INT,
	Class VARCHAR (2),
	CONSTRAINT PK_Carrier_and_airplane_info PRIMARY KEY (Unique_carrier_name, Unique_carrier_entity, Unique_carrier, Carrier, Carrier_group, Carrier_group_new, Aircraft_group, Aircraft_type, Aircraft_config, Distance_group, Class)
);


