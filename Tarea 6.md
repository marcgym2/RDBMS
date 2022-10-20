<!-- Tarea 6. Consultas-->

# T6. Consultas
### Instrucciones 
Usar funciones de agregación para calcular:

[1 punto] conteo de frecuencias o media


```SQL
SELECT AVG(party_number_injured) FROM LOCATION;


SELECT CAST(sum(party_number_injured) as decimal) / count(party_number_injured) as decimal from location; 
```

[1 punto] mínimos o máximos

```SQL
--MINIMOS
SELECT party_number_injured 
FROM LOCATION 
ORDER BY party_number_injured ASC
LIMIT 1;

--MINIMOS
SELECT MIN(party_number_injured) FROM LOCATION;

--MAXIMOS
SELECT party_number_injured 
FROM LOCATION 
ORDER BY party_number_injured DESC
LIMIT 1;

 --MAXIMOS 
SELECT MAX(party_number_injured) FROM LOCATION; 
```

[4 puntos] cuantil cuyo resultado sea distinto a la mediana
```SQL
--CUANTILES
select
  percentile_disc(0.25) within group (order by location.party_number_injured),
  percentile_disc(0.5) within group (order by location.party_number_injured),
  percentile_disc(0.75) within group (order by location.party_number_injured)
from location;
```
```SQL 
--Q1
SELECT CAST(count(party_number_injured) as decimal) / 4 as "n/4" from location;

SELECT CAST(count(party_number_injured) as decimal) / 4 +1 as "n/4+1" from location;

SELECT id,party_number_injured from location ORDER BY party_number_injured OFFSET 124 LIMIT 2;

SELECT id,party_number_injured as Perc from location ORDER BY party_number_injured OFFSET 124 LIMIT 2;
```

[4 puntos] moda
```SQL
--MODA
SELECT mode() WITHIN GROUP (ORDER BY party_number_injured) AS moda_injured FROM location;

SELECT DISTINCT party_number_injured, count(party_number_injured) as Frecuencia FROM location GROUP BY party_number_injured ORDER BY Frecuencia DESC ;
```
[2 puntos] reporta hallazgos, dificultades, implementación de soluciones encontradas en línea, etc...

La principal dificultad que tuve fue el calcular el cuantil 1 de forma manual. Logré identificar que valores se tenian que promediar para obtener el valor deseado pero no pude convertirlo a función.
