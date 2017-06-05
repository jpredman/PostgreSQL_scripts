#Plane_type
BEGIN; 
COPY plane_type(plane)
FROM 'C:\Airport Project\postgres_load\plane_type.csv' DELIMITER ',' CSV;

select * from plane_type;
COMMIT;

#Airline_Category
BEGIN;
COPY airline_category(airline_cat)
FROM 'C:\Airport Project\postgres_load\airline_category.csv' DELIMITER ',' CSV HEADER;

select * from airline_category;
COMMIT;

#Airline
BEGIN;
COPY airline(airline, airline_cat)
FROM 'C:\Airport Project\postgres_load\airline.csv' DELIMITER ',' CSV;

select * from airline;
COMMIT;

#Fleet
BEGIN;
COPY fleet(id, plane, fleet_count, airline)
FROM 'C:\Airport Project\postgres_load\fleet.csv' DELIMITER ',' CSV HEADER;

select * from fleet;
COMMIT;

#Job_Category
BEGIN;
INSERT INTO job_category VALUES
	('Captain')
    ,('First Officer');

select * from job_category;
COMMIT;

#Pay_Category
BEGIN;
INSERT INTO pay_category VALUES
	('Regular')
    ,('Reserve');
    
select * from pay_category;
COMMIT;

#Flight_Category
BEGIN;
INSERT INTO flight_category VALUES
	('Domestic')
    ,('International');
    
select * from flight_category;
COMMIT;

#HUB
BEGIN;
COPY hub(hub,airport_name,city,state,country,latitude,longitude)
FROM 'C:\Airport Project\postgres_load\hub.csv' DELIMITER ',' CSV HEADER;

UPDATE hub
SET latlong = ST_GeomFromText('POINT(' || longitude || ' ' || latitude || ')'); 

select * from hub
COMMIT;