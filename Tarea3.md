<!-- Tarea 3. Modelo Relacional-->

# 3.- Modelo Relacional
## Esquema del Modelo Relacional
collisions(case_id, officer_id, primary_collision_factor,  pcf_violation_category,type_of_collision, movement_preceding_collision, weather_1, lighting, road_surface, collision_date, collision_time)

vehicles(id, case_id, vehicle_make, vehicle_year_, statewide_vehicle_type_, motor_vehicle_involved_with)

parties(id, case_id, party_number, party_type, at_fault, party_sex, party_race, party_sobriety, cellphone_use_type, victim_degree_of_injury)

location(id, case_id, country_location, population, party_number_killed, party_number_injured)

## Diagrama del Modelo Relacional


![Diagrama Relacional](DiagramaRelacional.png)


 **Accidentes por condado:**


Π id, case_id, county_location(location)

```
location(id, case_id, country_location)
```


**Accidentes donde el culpable utilizaba el celular:**


σ cellphone_use_type = "cellphone in use" and at_fault is true(parties)

```
parties[(cellphone_use_type = "cellphone in use") | (at_fault is true)]
```

**Accidentes que involucran bebidas alcolicas:**


σ party_sobriety = "had been drinking, under influence" and at_fault is true(parties)

```
parties[(party_sobriety = "had been drinking, under influence") | (at_fault is true) ]
```


 **Cuplables por sexo:**


Π party_sex, at_fault(parties)

```
parties(party_sex, at_fault)
```
