SELECT			results.resultid AS "Result ID"
				,results.number AS "Car Number"
				,results.grid AS "Starting Position"
				,results.positionorder AS "Finishing Position"
				,results.points AS "Points"
				,results.fastestlap AS "Drivers Fastest Lap Number"
				,MAX(results.laps) OVER (PARTITION BY results.raceid) AS "Total Laps for Race"
				,(CAST(results.fastestlap AS FLOAT) / NULLIF(MAX(results.laps) OVER (PARTITION BY results.raceid),0)) AS "Percent Completed at Fastest Lap"
				,results.rank AS "Drivers Fastest Lap Rank"
				,races.year AS "Race Year"
				,races.round AS "Race Round"
				,races.name AS "Race Name"
				,races.date AS "Race Date"
				,status.status AS "Driver Status"
				,drivers.code AS "Driver Code"
				,drivers.forename AS "Driver First Name"
				,drivers.surname AS "Driver Last Name"
				,drivers.date_of_birth AS "Driver Birthday"
				,drivers.nationality AS "Driver Nationality"
				,constructors.name AS "Constructor Name"
				,constructors.nationality AS "Constructor Nationality"
				,engines.engine AS "Constructor Engine"
				,circuits.name AS "Circuit Name"
				,circuits.location AS "Circuit City"
				,circuits.country AS "Circuit Country"
				,circuits.lat AS "Latitude"
				,circuits.long AS "Longitude"
				,circuits.alt AS "Altitude in Meters"
				,constructor_results.points AS "Total Constructor Points for Race"
				,constructor_standings.position AS "Constructor Position for Season at Time of Race"
				,constructor_standings.points AS "Constructor Points for Season at Time of Race"
				,driver_standings.points AS "Driver Points for Season at Time of Race"
				,driver_standings.position AS "Driver Position for Season at Time of Race"
				,races.date - drivers.date_of_birth AS "Driver Age at Race in Days"
FROM			results
INNER JOIN		races ON results.raceid = races.raceid
INNER JOIN		status ON results.statusid = status.statusid
INNER JOIN		drivers ON results.driverid = drivers.driverid
INNER JOIN		constructors ON results.constructorid = constructors.constructorid
INNER JOIN		circuits ON races.circuitid = circuits.circuitid
INNER JOIN		constructor_results ON results.raceid = constructor_results.raceid
	AND			results.constructorid = constructor_results.constructorid
INNER JOIN		constructor_standings ON results.raceid = constructor_standings.raceid
	AND			results.constructorid = constructor_standings.constructorid
INNER JOIN		driver_standings ON results.raceid = driver_standings.raceid
	AND			results.driverid = driver_standings.driverid
LEFT JOIN		engines ON constructors.name = engines.team
	AND			races.year = engines.year
WHERE			races.year >= 2014
