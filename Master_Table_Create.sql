#DROP TABLE mandatory_retire;
#DROP TABLE hour_guarentee;
#DROP TABLE pay_scale;
#DROP TABLE fleet;
#DROP TABLE per_diem;
#DROP TABLE hub;
#DROP TABLE airline;
#DROP TABLE airline_category;
#DROP TABLE flight_category;
#DROP TABLE job_category;
#DROP TABLE plane_type;
#DROP TABLE pay_category;

#Plane_Type
CREATE TABLE public.Plane_Type
(
    Plane character varying NOT NULL,
    CONSTRAINT Plane_Type_pkey PRIMARY KEY (Plane)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Plane_Type
    OWNER to postgres;
    
#Airline_Category
CREATE TABLE public.Airline_Category
(
    Airline_Cat character varying NOT NULL,
    CONSTRAINT Airline_Category_pkey PRIMARY KEY (Airline_Cat)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Airline_Category
    OWNER to postgres;
    
#Airline
CREATE TABLE public.Airline
(
    Airline character varying NOT NULL,
    Airline_Cat character varying REFERENCES Airline_Category(Airline_Cat),
    CONSTRAINT Airline_pkey PRIMARY KEY (Airline)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Airline
    OWNER to postgres;
    
#Flight_Category
CREATE TABLE public.Flight_Category
(
    Flight_Cat character varying NOT NULL,
    CONSTRAINT Flight_Category_pkey PRIMARY KEY (Flight_Cat)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Flight_Category
    OWNER to postgres;  

#Job_Category
CREATE TABLE public.Job_Category
(
    Job_Cat character varying NOT NULL,
    CONSTRAINT Job_Category_pkey PRIMARY KEY (Job_Cat)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Job_Category
    OWNER to postgres;
    
#Mandatory_Retire
CREATE TABLE public.Mandatory_Retire
(
    ID SERIAL UNIQUE, 
    Airline character varying REFERENCES airline(airline),
    Year INT,
    Retiring INT,
    CONSTRAINT Mandatory_Retire_pkey PRIMARY KEY (ID)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Mandatory_Retire
    OWNER to postgres;
    
#Pay_Category
CREATE TABLE public.Pay_Category
(
    Pay_Cat character varying NOT NULL,
    CONSTRAINT Pay_Category_pkey PRIMARY KEY (Pay_Cat)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Pay_Category
    OWNER to postgres;

#Per_Diem
CREATE TABLE public.Per_Diem
(
    ID SERIAL UNIQUE, 
    Airline character varying REFERENCES airline(airline),
    Flight_Cat character varying REFERENCES Flight_Category(Flight_Cat),
    Hourly_Rate money,
    CONSTRAINT Per_Diem_pkey PRIMARY KEY (ID)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Per_Diem
    OWNER to postgres;

#Fleet
CREATE TABLE public.Fleet
(
    ID SERIAL UNIQUE, 
    Airline character varying REFERENCES airline(airline),
    Plane character varying REFERENCES Plane_Type(Plane),
    Fleet_Count INT,
    CONSTRAINT Fleet_pkey PRIMARY KEY (ID)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Fleet
    OWNER to postgres;
    
#HUB
CREATE TABLE public.HUB
(
    HUB character varying NOT NULL,
    Airport_Name character varying,
    City character varying,
    Country character varying,
    LatLong point[] NOT NULL,
    CONSTRAINT HUB_pkey PRIMARY KEY (HUB)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.HUB
    OWNER to postgres;

#Pay_Scale
CREATE TABLE public.Pay_Scale
(
    ID SERIAL UNIQUE,
    Job_Cat character varying REFERENCES job_category(job_cat),
    Airline character varying REFERENCES airline(airline),
    Plane character varying REFERENCES Plane_type(plane),
    Years int,
    Rate money,
    CONSTRAINT Pay_Scale_pkey PRIMARY KEY (ID)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.Pay_Scale
	OWNER  to postgres;
