DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits (
	circuitid INT
	,circuitref VARCHAR(96)
	,name VARCHAR(96)
	,location VARCHAR(96)
	,country VARCHAR(96)
	,lat FLOAT
	,long FLOAT
	,alt INT
	,url VARCHAR(96)
);

DROP TABLE IF EXISTS constructor_results;
CREATE TABLE constructor_results (
	constructorresultsid INT
	,raceid INT
	,constructorid INT
	,points FLOAT
	,status VARCHAR(10)
);

DROP TABLE IF EXISTS constructor_standings;
CREATE TABLE constructor_standings (
	constructorstandingsid INT
	,raceid INT
	,constructorid INT
	,points FLOAT
	,position INT
	,positionText VARCHAR(10)
	,wins INT
);

DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
	constructorid INT
	,constructorref VARCHAR(24)
	,name VARCHAR(100)
	,nationality VARCHAR(100)
	,url VARCHAR(100)
);

DROP TABLE IF EXISTS driver_standings;
CREATE TABLE driver_standings (
	driverstandingsid INT
	,raceid INT
	,driverid INT
	,points FLOAT
	,position INT
	,positionText VARCHAR(10)
	,wins INT
);

DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
	driverid INT
	,driverref VARCHAR(96)
	,number VARCHAR(10)
	,code VARCHAR(10)
	,forename VARCHAR(96)
	,surname VARCHAR(96)
	,date_of_birth DATE
	,nationality VARCHAR(96)
	,url VARCHAR(100)
);

DROP TABLE IF EXISTS lap_times;
CREATE TABLE lap_times (
	raceid INT
	,driverid INT
	,lap INT
	,position INT
	,time VARCHAR(48)
	,milliseconds INT
);

DROP TABLE IF EXISTS pit_stops;
CREATE TABLE pit_stops (
	raceid INT
	,driverid INT
	,stop INT
	,lap INT
	,time VARCHAR(48)
	,duration VARCHAR(48)
	,milliseconds INT
);

DROP TABLE IF EXISTS qualifying;
CREATE TABLE qualifying (
	qualifyid INT
	,raceid INT
	,driverid INT
	,constructorid INT
	,number INT
	,position INT
	,q1 VARCHAR(48)
	,q2 VARCHAR(48)
	,q3 VARCHAR(48)
);

DROP TABLE IF EXISTS races;
CREATE TABLE races (
	raceid INT
	,year INT
	,round INT
	,circuitid INT
	,name VARCHAR (200)
	,date DATE
	,time VARCHAR(48)
	,url VARCHAR (200)
);

DROP TABLE IF EXISTS results;
CREATE TABLE results (
	resultid INT
	,raceid INT
	,driverid INT
	,constructorid INT
	,number INT
	,grid INT
	,position INT
	,positiontext VARCHAR(10)
	,positionorder INT
	,points FLOAT
	,laps INT
	,time VARCHAR(48)
	,milliseconds INT
	,fastestlap INT
	,rank INT
	,fastestlaptime VARCHAR(48)
	,fastestlapspeed FLOAT
	,statusid INT
);

DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons (
	year INT
	,url VARCHAR (100)
);

DROP TABLE IF EXISTS status;
CREATE TABLE status (
	statusid INT
	,status VARCHAR (100)
);

DROP TABLE IF EXISTS engines;
CREATE TABLE engines (
	year INT
	,team VARCHAR(96)
	,engine VARCHAR(96)
);







