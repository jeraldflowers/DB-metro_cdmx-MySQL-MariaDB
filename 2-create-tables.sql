-- Create tables

USE metro_cdmx;

CREATE TABLE `lines` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(10) NOT NULL,
    `color` VARCHAR(15) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trains` (

    `serial_number` VARCHAR(10) NOT NULL,

    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `type` TINYINT(4) NOT NULL,
    `year` INT(4) NOT NULL,
    
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(serial_number),
    CONSTRAINT `trains_line_id_foreign`
    FOREIGN KEY(`line_id`) REFERENCES `lines` (`id`)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `stations` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(50) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `locations` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,
    
    `station_id` BIGINT(20) UNSIGNED NOT NULL,
    'location' POINT NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
    CONSTRAINT `locations_station_id_foreign`
    FOREIGN KEY(`station_id`) REFERENCES `stations` (`id`),

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `drivers` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(50) NOT NULL,
    `status boolean` NOT NULL DEFAULT false,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `active_drivers` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,

    `driver_id` BIGINT(20) UNSIGNED NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
    FOREIGN KEY(driver_id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `stations_delete` (

    `id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(50) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;