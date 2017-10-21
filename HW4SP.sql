--Hoyt Andres CS3810 Homework 4 Stored Procedure

CREATE OR REPLACE FUNCTION flight_analysis() RETURNS refcursor AS $$
DECLARE
	ref refcursor;
BEGIN
	OPEN ref FOR SELECT Carrier_name, SUM(Departures_performed) AS "Total Departures", AVG(Distance) AS "Avg Distance", SUM(passengers) / SUM(distance) AS "Passengers/Distance", SUM(freight) / SUM(distance) AS "freight/distance", CORR (passengers, freight) AS "Corr Coeff pass/freight", CORR (passengers, distance) AS "Corr Coeff pass/dist"

	FROM Flight_info
	GROUP BY Carrier_name;
	
	RETURN ref;
END;
$$ LANGUAGE plpgsql;