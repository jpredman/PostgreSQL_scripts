/*
DROP VIEW HUB_Master;
DROP VIEW HUB_Major;
DROP VIEW HUB_MidMajor;
DROP VIEW HUB_Regional;
DROP VIEW HUB_Cargo;
*/

CREATE VIEW HUB_Master AS
	select 
    row_number() OVER () AS id
    ,a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline;

CREATE VIEW HUB_Major AS
	select 
    row_number() OVER () AS id
    ,a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline
    where c.airline_cat = 'Major';
    
CREATE VIEW HUB_MidMajor AS
	select 
    row_number() OVER () AS id
    ,a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline
    where c.airline_cat = 'MidMajor';
    
 CREATE VIEW HUB_Regional AS
	select 
    row_number() OVER () AS id
    ,a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline
    where c.airline_cat = 'Regional';
    
CREATE VIEW HUB_Cargo AS
	select 
    row_number() OVER () AS id
    ,a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline
    where c.airline_cat = 'Cargo';
    
