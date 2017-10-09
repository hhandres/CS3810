--CS3810 Hoyt Andres

CREATE TABLE Carrier
(
	Airline_id INT,
	Carrier_name VARCHAR(255),
	Carrier_entity VARCHAR (32),
	Carrier VARCHAR(6),
	Carrier_group INT,
	Carrier_group_new INT,
	Region VARCHAR(32),
	Start_date_source VARCHAR (32),
	Thru_date_source VARCHAR (32),
	Wac INT,
	CONSTRAINT PK_Carrier PRIMARY KEY (Airline_id, Carrier_name, Carrier_entity, Carrier_group, Start_date_source)
);


CREATE TABLE Unique_Carrier
(
	Airline_id INT,
	Unique_carrier VARCHAR(10),
	Unique_carrier_name VARCHAR (255),
	Unique_carrier_entity VARCHAR (32),
	CONSTRAINT PK_Unique_Carrier PRIMARY KEY (Airline_id, Unique_carrier, Unique_carrier_name, Unique_carrier_entity)
);


CREATE TABLE Aircraft
(
	Airline_id INT,
	Aircraft_group INT,
	Aircraft_type INT,
	Aircraft_config INT,
	CONSTRAINT PK_Aircraft PRIMARY KEY (Airline_id, Aircraft_group, Aircraft_type, Aircraft_config)
);


CREATE TABLE Origin
(
	Airline_id INT,
	Origin VARCHAR (6),
	Origin_airport_id INT,
	Origin_airport_seq_id INT,
	Origin_city_market_id INT,
	Origin_state_nm VARCHAR (32),
	Origin_state_abr VARCHAR (2),
	Origin_state_fips INT,
	Origin_city_name VARCHAR (32),
	Origin_wac INT,
	CONSTRAINT PK_Origin PRIMARY KEY (Airline_id, Origin)
);


CREATE TABLE Destination
(
	Airline_id INT,
	Dest VARCHAR (6),
	Dest_airport_id INT,
	Dest_airport_seq_id INT,
	Dest_city_market_id INT,
	Dest_state_nm VARCHAR (32),
	Dest_state_abr VARCHAR (2),
	Dest_state_fips INT,
	Dest_city_name VARCHAR (32),
	Dest_wac INT,
	CONSTRAINT PK_Destination PRIMARY KEY (Airline_id, Dest)
);


CREATE TABLE Flight_stats
(
	Flight_id INT,
	Airline_id INT,
	Payload INT,
	Seats INT,
	Passengers INT,
	Freight INT,
	Mail INT,
	Distance INT,
	Distance_group INT,
	Ramp_to_ramp INT,
	Air_time INT,
	Departures_scheduled INT,
	Departures_performed INT,
	Class VARCHAR (3),
	PRIMARY KEY (Flight_id)
);	