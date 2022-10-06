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

Se concluye que se pueden estandarizar ciertas columnas del tipo VARCHAR a BOOLEAN como: 
- party_sex, 
- party_sobriety,
- cellphone_use_type

y limpiar population VARCHAR y convertir a INTEGER o RANGE.
