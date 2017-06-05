BEGIN; 
COPY plane_type(plane)
FROM 'C:\Airport Project\postgres_load\plane_type.csv' DELIMITER ',' CSV;

select * from plane_type;
COMMIT;

BEGIN;
COPY airline_category(airline_cat)
FROM 'C:\Airport Project\postgres_load\airline_category.csv' CSV HEADER;
rollback;
select * from airline_category;
COMMIT;

BEGIN;
COPY airline(airline, airline_cat)
FROM 'C:\Airport Project\postgres_load\airline.csv' DELIMITER ',' CSV;

select * from airline;
COMMIT;

BEGIN;
COPY fleet(id, plane, fleet_count, airline)
FROM 'C:\Airport Project\postgres_load\fleet.csv' DELIMITER ',' CSV HEADER ;

select * from fleet;
COMMIT;