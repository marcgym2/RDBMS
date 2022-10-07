<!-- Tarea 4. Modelo e-r-->

# T4. Crear base de datos
### Instrucciones
[2 puntos] Elegir entre SQLite, MySQL (MariaDB), PostgreSQL o MS SQL para trabajar a partir de aquí. Justificar la decisión.


[6 puntos] Escribir las instrucciones para crear una base de datos a partir del modelo e-r o relacional.


Guarda estas instrucciones en un archivo de texto con una extensión adecuada al SGBD que elegiste.
Asegúrate de que tus instrucciones se puedan ejecutar desde https://sqliteonline.com/


[2 puntos] Detallar las modificaciones o cambios no contempladas en los modelos, que surgieron tras crear la base de datos y las tablas.

---

La presente base de datos fue creada utilizando PostgreSQL. Debido a que es uno de los SGBD mas utilizados en el mundo por su gran conjunto de características robustas, desempeño en diversas escalas y compatibilidad con diversos lenguajes de programación.



```
DROP DATABASE IF EXISTS collisions_DB;
CREATE DATABASE collisions_DB;

DROP TABLE IF EXISTS collisions;
CREATE TABLE IF NOT EXISTS collisions (
	case_id INTEGER PRIMARY KEY,
	oficcer_id INTEGER NOT NULL,
	primary_collision_factor VARCHAR (22) NOT NULL,
	pcf_violation_category VARCHAR (33) NOT NULL,
	type_of_collision VARCHAR (10) NOT NULL,
	movement_preceding_collision VARCHAR (26) NOT NULL,
	weather VARCHAR (7) NOT NULL,
	lighting VARCHAR (39) NOT NULL,
	road_surface VARCHAR (8) NOT NULL,
	road_condition VARCHAR (14) NOT NULL,
	collision_date DATE NOT NULL,
	collision_time TIME NOT NULL
		
);

DROP TABLE IF EXISTS vehicles;
CREATE TABLE IF NOT EXISTS vehicles (
	id INTEGER PRIMARY KEY,
	case_id INTEGER NOT NULL, 
	vehicle_make VARCHAR (28), 
	vehicle_year INTEGER NOT NULL, 
	statewide_vehicle_type VARCHAR (35),
	motor_vehicle_involved_with VARCHAR (30),
	FOREIGN KEY (case_id)
		REFERENCES collisions (case_id)
	
);

DROP TABLE IF EXISTS location;
CREATE TABLE IF NOT EXISTS location (
	id INTEGER PRIMARY KEY,
	case_id INTEGER NOT NULL, 
	country_location VARCHAR (15) NOT NULL, 
	population VARCHAR (16) NOT NULL, 
	party_number_killed BOOLEAN NOT NULL, 
	party_number_injured BOOLEAN NOT NULL, 
	db_year INTEGER NOT NULL,
	FOREIGN KEY (case_id)
		REFERENCES collisions (case_id)


);

DROP TABLE IF EXISTS parties;
CREATE TABLE IF NOT EXISTS parties (
	id INTEGER PRIMARY KEY,
	case_id INTEGER NOT NULL, 
	party_number INTEGER NOT NULL,
	party_type VARCHAR (14) NOT NULL,
	at_fault BOOLEAN NOT NULL, 
	party_sex VARCHAR (6) NOT NULL, 
	party_race VARCHAR (8) NOT NULL, 
	party_sobriety VARCHAR (38) NOT NULL, 
	cellphone_use_type VARCHAR (29),
	victim_degree_of_injury VARCHAR (24),
	FOREIGN KEY (case_id)
		REFERENCES collisions (case_id)

);

```



```

DELETE FROM collisions;
INSERT INTO collisions (case_id, oficcer_id, primary_collision_factor, pcf_violation_category, type_of_collision, movement_preceding_collision, weather, lighting, road_surface, road_condition, collision_date, collision_time)
VALUES
	(3899490,11342,'vehicle code violation','speeding','rear end','proceeding straight','cloudy','daylight','dry','normal', '2020/03/14', '7:45:00'),
	(3899493,8945,'vehicle code violation','speeding', 'hit object','proceeding straight','clear','dark with street lights','dry','normal','2020/07/26', '2:50:00'),
	(3858022,17242,'other improper driving','other improper driving','rear end','proceeding straight','clear','daylight','dry','normal','2009/02/03','17:11:00'),
	(3899441,17248,'vehicle code violation','improper turning','hit object','proceeding straight','clear','dark with no street lights','dry','normal','2009/02/28','1:45:00'),
	(3899442,19005,'vehicle code violation','speeding','sideswipe','proceeding straight','raining','daylight','wet','normal','2009/02/09', '10:20:00'),
	(3899445,19284,'vehicle code violation','improper turning','sideswipe','proceeding straight','clear','daylight','dry','normal','2009/02/18', '15:50:00'),
	(3899446,19289,'vehicle code violation','speeding','rear end','proceeding straight','cloudy','dusk or dawn','dry','normal','11/02/09','17:35:00'),
	(3899449,19374,'vehicle code violation','speeding','rear end','proceeding straight','clear','dark with no street lights','dry','normal','2009/02/11','21:20:00'),
	(3899450,19374,'vehicle code violation','speeding','rear end','other','clear','dark with no street lights','dry','normal','2009/02/13', '20:40:00'),
	(3899453,18723,'vehicle code violation','speeding','rear end','proceeding straight','clear','dark with no street lights','wet','normal','2009/02/13', '18:20:00'),
	(3899454,19021,'vehicle code violation','pedestrian violation','pedestrian','proceeding straight','cloudy','dark with street lights','wet','normal','2009/02/13','18:20:00'),
	(3899457,14654,'vehicle code violation','unsafe lane change','sideswipe','proceeding straight','clear','daylight','dry','normal','2009/02/08', '13:50:00'),
	(3899458,19241,'vehicle code violation','speeding','hit object','stopped','cloudy','dark with no street lights','wet','normal','2009/02/10', '2:30:00'),
	(3899462,13604,'vehicle code violation','speeding','rear end','stopped','clear','daylight','dry','normal','2009/02/17','10:25:00'),
	(3899466,19210,'vehicle code violation','speeding','hit object','slowing/stopping','clear','dark with street lights','dry','normal','2009/02/14','1:15:00'),
	(3899469,19374,'vehicle code violation','speeding','sideswipe','slowing/stopping','cloudy','daylight','wet','normal','2009/02/12','16:35:00'),
	(3899470,19018,'vehicle code violation','improper turning','hit object','proceeding straight','clear','daylight','dry','normal','2009/02/13','17:00:00'),
	(3899473,18751,'other than driver','other than driver (or pedestrian)','hit object','proceeding straight','clear','dark with street lights','dry','normal','2009/02/15','22:25:00'),
	(3899474,19005,'vehicle code violation','speeding','hit object','proceeding straight','raining','daylight','wet','normal','2009/02/14', '7:25:00'),
	(3899477,15995,'vehicle code violation','automobile right of way','broadside','slowing/stopping','cloudy','daylight','dry','normal','2009/02/13','9:00:00');


SELECT * from collisions;


```


Se concluye que se pueden estandarizar ciertas columnas del tipo VARCHAR a BOOLEAN como: 
- party_sex, 
- party_sobriety,
- cellphone_use_type

y limpiar population VARCHAR y convertir a INTEGER o RANGE.
