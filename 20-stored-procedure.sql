USE metro_cdmx;

DELIMITER // 
CREATE PROCEDURE calculate_distance_between_lines (
    IN station_one POINT, 
    IN station_two POINT,
    IN meters BOOLEAN 
)
BEGIN

    IF meters THEN

        SELECT
        ST_Distance_Sphere(station_one, station_two) AS distances;

    ELSE

        SELECT
        ST_Distance_Sphere(station_one,
        station_two) / 1000 AS distances;

    END IF;

END //

DELIMITER ;

CALL calculate_distance_between_lines(POINT(-99.1430819, 19.45520174), POINT(-99.05969739, 19.39821706));

DROP PROCEDURE calculate_distance_between_lines;

CALL calculate_distance_between_lines(POINT(-99.1430819, 19.45520174), POINT(-99.05969739, 19.39821706), false);