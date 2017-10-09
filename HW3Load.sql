-- CS3810 Hoyt Andres

COPY Carrier
FROM 'C:\Database\Carrier.csv' DELIMITER ',' CSV HEADER;

COPY Aircraft
FROM 'C:\Database\Aircraft.csv' DELIMITER ',' CSV HEADER;

COPY Destination
FROM 'C:\Database\Destination.csv' DELIMITER ',' CSV HEADER;

COPY Flight_stats
FROM 'C:\Database\Flight_Stats.csv' DELIMITER ',' CSV HEADER;

COPY Origin
FROM 'C:\Database\Origin.csv' DELIMITER ',' CSV HEADER;

COPY Unique_carrier
FROM 'C:\Database\Unique_Carrier.csv' DELIMITER ',' CSV HEADER;

