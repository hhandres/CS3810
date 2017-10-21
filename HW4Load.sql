COPY Airline_Name
FROM 'C:\Database\Airline_Name.csv' DELIMITER ',' CSV HEADER;

COPY Flight_Info
FROM 'C:\Database\Flight_Info.csv' DELIMITER ',' CSV HEADER;

COPY Carrier_And_Airplane_Info
FROM 'C:\Database\Carrier_And_Airplane_Info.csv' DELIMITER ',' CSV HEADER;

