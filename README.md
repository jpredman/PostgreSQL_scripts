# PostgreSQL_scripts
PostgreSQL scripts for creating and loading data for airport web app project

Web map app will be done in CartoDB, which uses PostGIS as a backend that can be installed on any PostgreSQL database. I decided to normalize my data as I collected it and work in the beginning on creating a schema that makes sense with CartoDB.

-Included all of the LEGACY and MAJOR-NATIONAL-LLC airlines, the top 2 CARGO airlines (ups & fedex) and all REGIONAL airlines with >500 pilots (as of March 2017).

A NOTE ON THE DATATYPES USED:

-If the string to be stored is shorter than the declared length, values of type character will be space-padded; values of type character varying will simply store the shorter string, therefore, character varying was used in anything that was text.

-Variable-length fields are useful because they save space. Suppose, for example, that you want to define a NAME field. The length of each NAME field will vary according to the data placed in it. For example, John Smith is 10 characters long, but Thomas Horatio Jefferson is 24 characters long. With fixed-length fields, you would need to define each field to be long enough to hold the longest name. This would be a waste of space for records that had short names. With variable-length fields, the NAME field in each record would be just long enough to hold its data.

-Every table create query has "WITH ( OIDS=FALSE)", even when there is a unique ID needed because PostgreSQL documentation notes:  "Using OIDs in new applications is not recommended: where possible, using a SERIAL or other sequence generator as the table's primary key is preferred."

-coordinate system - SRID WGS84

