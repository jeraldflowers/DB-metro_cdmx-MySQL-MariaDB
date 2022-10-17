USE metro_cdmx;

--select all
SELECT * FROM `lines`;

--columns filter
SELECT id, name, color FROM `lines`;

--Math operations with select
SELECT (2 + 2);

SELECT (2 + 2) AS resultado;

SELECT AVG(year) FROM `trains`;

SELECT AVG(year) AS year_avg FROM `trains`;

--Join tables
SELECT
`lines`. `name`,
`trains`. `serial_number`
FROM `lines`
INNER JOIN `trains`
ON `lines`. `id` = `trains`. `line_id`;
