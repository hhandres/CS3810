CS 3810
Homework 6
README
Author: Hoyt Andres

This program needs the following files to function:
-PostgreSQL.java
-HW6Load.sql
-Flights.csv

Before running PostgreSQL.java
---------------------------------
1. Open the HW6Load.sql file in a text editor and alter the path in the COPY statement to point to the directory where you put the Flights.csv file.

2. Load the contents of the HW6Load.sql file into Postgres. This should create 3 tables (flights, customers, and reservations) as well as load the contents of the Flights.csv file into the flights table.

NOTE: Any input errors are written to HW6.error (which will be created in the same directory as PostgreSQL.java).