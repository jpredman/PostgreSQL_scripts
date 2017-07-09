CREATE VIEW HUB_Master AS
	select 
    a.airline
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
    a.airline
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
    a.airline
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
    a.airline
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
    a.airline
    ,a.hub
    ,b.airport_name
    ,c.airline_cat
    ,a.departures
    ,b.latlong
  	from airline_hub a 
    join hub b on b.hub = a.hub
    join airline c on c.airline = a.airline
    where c.airline_cat = 'Cargo';
    
