--Hoyt Andres CS 3810 Homework 4
--A) HW4 SQL Queries

--1.
SELECT DISTINCT origin_city_name, origin_state_nm, origin, origin_airport_id, carrier_name, SUM(passengers) AS "Total Passengers"
FROM flight_info
WHERE origin_state_nm = 'Colorado'

GROUP BY origin_city_name, origin_state_nm, origin, origin_airport_id, carrier_name, passengers;


--2.
SELECT DISTINCT origin_city_name, origin_state_nm, origin, origin_airport_id, carrier_name, SUM(freight) AS "Total Freight"
FROM flight_info
WHERE origin_state_nm = 'Colorado'

GROUP BY origin_city_name, origin_state_nm, origin, origin_airport_id, carrier_name, freight;


--3.
SELECT DISTINCT origin_city_name, origin_state_nm, dest_city_name, carrier_name, SUM (passengers) AS "Total Passengers"
FROM Flight_info
WHERE (origin_state_nm != 'Colorado' AND dest_state_nm = 'Colorado')

GROUP BY origin_city_name, origin_state_nm, dest_city_name, carrier_name, passengers;


--4.
SELECT DISTINCT origin_city_name, origin_state_nm, carrier_name
FROM Flight_info
WHERE (dest_city_name = 'Denver, CO' AND distance > 500 AND distance < 1200)

GROUP BY origin_city_name, origin_state_nm, carrier_name;