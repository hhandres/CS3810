-- HW2 for Databases, Hoyt Andres
CREATE TABLE Countries (name VARCHAR(20),latitude VARCHAR(10),longitude VARCHAR(10),area INT, population INT, gdp DECIMAL(10,1), gdpYear INT);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Germany', '51 00 N', '9 00 E', 357022, 80594017, 3979, 2016),
('Netherlands', '52 30 N', '5 45 E', 41543, 17084719, 870.8, 2016),
('Belgium', '50 50 N', '4 00 E', 30528, 11491346, 508.6, 2016),
('Luxembourg', '49 45 N', '6 10 E', 2586, 594130, 58.74, 2016),
('Poland', '52 00 N', '20 00 E', 312685, 38476269, 1052, 2016),
('Czech Republic', '49 45 N', '15 30 E', 78867, 10674723, 350.9, 2016),
('Austria', '47 20 N', '13 20 E', 83871, 8754413, 416.6, 2016),
('France', '46 00 N', '2 00 E', 643801, 67106161, 2699, 2016),
('Switzerland', '47 00 N', '8 00 E', 41277, 8236303, 496.3, 2016);

CREATE TABLE Borders (name VARCHAR(20), bordercountry VARCHAR(20));
INSERT INTO Borders (name, bordercountry)
VALUES 
('Germany', 'Austria'),
('Germany', 'Belgium'),
('Germany', 'Czech Republic'),
('Germany', 'France'),
('Germany', 'Luxembourg'),
('Germany', 'Netherlands'),
('Germany', 'Poland'),
('Germany', 'Switzerland'),
('Netherlands', 'Belgium'),
('Netherlands', 'Germany'),
('Belgium', 'France'),
('Belgium', 'Germany'),
('Belgium', 'Luxembourg'),
('Belgium', 'Netherlands'),
('Luxembourg', 'Belgium'),
('Luxembourg', 'France'),
('Luxembourg', 'Germany'),
('Poland', 'Czech Republic'),
('Poland', 'Germany'),
('Czech Republic', 'Austria'),
('Czech Republic', 'Germany'),
('Czech Republic', 'Poland'),
('Austria', 'Czech Republic'),
('Austria', 'Germany'),
('Austria', 'Switzerland'),
('France', 'Belgium'),
('France', 'Germany'),
('France', 'Luxembourg'),
('France', 'Switzerland'),
('Switzerland', 'Austria'),
('Switzerland', 'France'),
('Switzerland', 'Germany');

SELECT bordercountry FROM borders WHERE name ='Germany';

SELECT name FROM countries WHERE population > 35000000;

SELECT bordercountry FROM countries
INNER JOIN borders
ON borders.bordercountry = countries.name
WHERE borders.name = 'Germany' AND population > 35000000;