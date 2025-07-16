/*
Consulta 1: Indicadores del relleno sanitario
Para el mes de junio 2024 y considerando únicamente servicios completados que llegaron
a relleno sanitario, escribe las consultas necesarias para obtener:
1. Toneladas recibidas
2. Ingreso total por disposición
3. Top 3 tipos de residuo por kg
4. Top 3 clientes por kg
5. Duración promedio de disposición
6. Kg promedio por entrega
7. Promedio de tiradas por cliente
*/

/*
WITH servicios_junio_2024 AS (
  SELECT *
  FROM clientes AS c
  JOIN servicios AS s ON c.id = s.cliente_id
  WHERE EXTRACT(MONTH FROM s.fecha) = 6
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.relleno_sanitario = TRUE
    AND s.status = 'Completado'
)
*/

--1.Toneladas recibidas
/*
SELECT
SUM(kg_recolectados)/1000 AS total_toneladas
FROM servicios_junio_2024;
*/

--2.Ingreso total por disposición
/*
SELECT
SUM(ingreso_disposicion) AS total_ingreso_disposicion
FROM servicios_junio_2024;
*/

--3.Top 3 tipos de residuo por kg
/*
SELECT
tipo_residuo, SUM(kg_recolectados) AS total_kg
FROM servicios_junio_2024
GROUP BY tipo_residuo
ORDER BY total_kg DESC
LIMIT 3
*/

--4.Top 3 clientes por kg
/*
SELECT cliente_id, nombre, SUM(kg_recolectados) AS total_kg
FROM servicios_junio_2024
GROUP BY cliente_id, nombre
ORDER BY total_kg DESC
LIMIT 3
*/


--5.Duración promedio de disposición
/*
SELECT AVG(duracion_disposicion_min) AS duracion_promedio_min
FROM servicios_junio_2024
*/

--6.Kg promedio por entrega
/*
SELECT AVG(kg_recolectados) AS kg_promedio_por_entrega
FROM servicios_junio_2024;
*/


--7. Promedio de tiradas por cliente
WITH servicios_junio_2024 AS (
  SELECT *
  FROM clientes AS c
  JOIN servicios AS s ON c.id = s.cliente_id
  WHERE EXTRACT(MONTH FROM s.fecha) = 6
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.relleno_sanitario = TRUE
    AND s.status = 'Completado'
),
conteo_por_cliente AS (
	SELECT cliente_id, nombre, COUNT(*) AS tiradas_por_cliente
	FROM servicios_junio_2024
	GROUP BY cliente_id, nombre
)
SELECT AVG(tiradas_por_cliente) AS promedio_tiradas_por_cliente
FROM conteo_por_cliente;
