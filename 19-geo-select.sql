USE metro_cdmx;

SELECT 
ST_Distance_Sphere (
    POINT(-99.194511, 19.489367),
    POINT(-99.18894768, 19.47873042)
) AS distance;

--Calculation in kilometers
SELECT 
ST_Distance_Sphere (
    POINT(-99.194511, 19.489367),
    POINT(-99.18894768, 19.47873042)
) / 1000 AS distance;

----Calculation in kilometers with nested queries
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Balderas"
    ),
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Pino Suarez"
    )
) / 1000 AS distance;

SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Lázaro Cárdenas"
    ),
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Balderas"
    )
) / 1000 AS distance;