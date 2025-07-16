--Consulta 2: Retención y pérdida de clientes

--1.Total de clientes activos en mayo
/*
SELECT *
FROM clientes AS c
JOIN servicios AS s ON c.id = s.cliente_id
WHERE EXTRACT(MONTH FROM s.fecha) = 5
AND EXTRACT(YEAR FROM s.fecha) = 2024
AND s.status = 'Completado';
*/

--2.Total de clientes activos en junio
/*
SELECT *
FROM clientes AS c
JOIN servicios AS s ON c.id = s.cliente_id
WHERE EXTRACT(MONTH FROM s.fecha) = 5
AND EXTRACT(YEAR FROM s.fecha) = 2024
AND s.status = 'Completado';
*/

--3.Clientes perdidos
/*
WITH clientes_mayo AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 5
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
),
clientes_junio AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 6
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
)
SELECT COUNT(*) AS clientes_perdidos_de_mayo_a_junio
FROM clientes_mayo
LEFT JOIN clientes_junio ON clientes_mayo.cliente_id = clientes_junio.cliente_id
WHERE clientes_junio.cliente_id IS NULL;
*/

--4.Tasa de retención
/*
WITH clientes_mayo AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 5
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
),
clientes_junio AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 6
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
)
SELECT (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM clientes_mayo)) AS tasa_retencion
FROM clientes_mayo
JOIN clientes_junio ON clientes_mayo.cliente_id = clientes_junio.cliente_id;
*/

--5.Tasa de churn
WITH clientes_mayo AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 5
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
),
clientes_junio AS (
  SELECT DISTINCT s.cliente_id
  FROM servicios s
  WHERE EXTRACT(MONTH FROM s.fecha) = 6
    AND EXTRACT(YEAR FROM s.fecha) = 2024
    AND s.status = 'Completado'
)
SELECT 1 - (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM clientes_mayo)) AS tasa_churn_de_mayo_junio
FROM clientes_mayo
JOIN clientes_junio ON clientes_mayo.cliente_id = clientes_junio.cliente_id;
