CS 3810
Homework 6
README
Author: Hoyt Andres

This program needs the following files to function:
-PostgreSQL.java
-HW6.error
-HW6.flight
-HW6Load.sql
-Flights.csv

Please follow the steps below in order to run the program correctly.

1. Place the following files in the same directory
	-PostgreSQL.java
	-HW6.error
	-HW6.flight
	-HW6Load.sql

2. Create a directory C:\Database and place the Flights.csv file into this directory.

3. Open (do not run) PostgreSQL.java and edit the url parameter in line 31 to point to your current Postgres database (the default is .../postgres)

4. Enter your username and password parameters on line 32 of PostgreSQL.java (the default is "username" and "password")

5. Save/recompile PostgreSQL.java

6. Start Postgres and load the HW6Load.sql file. This should create 3 tables (Customers, Flights, and Reservations) and import data for the Flights table from the Flights.csv file.

7. Make sure Postgres is running, then launch PostgreSQL.java 