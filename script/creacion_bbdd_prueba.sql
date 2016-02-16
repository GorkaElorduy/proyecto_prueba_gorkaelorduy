/* Delimitador cambiado a ; */
/* Conectando a 127.0.0.1 por MySQL (TCP/IP), usuario root, usando contraseña: No ... */
SELECT CONNECTION_ID();
/* Conectado. ID de Hilo: 1 */
/* Juego de caracteres: utf8mb4 */
SHOW STATUS;
SHOW VARIABLES;
SHOW DATABASES;
USE `iparsex`;
/* Entrando a la sesión "Unnamed" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='iparsex';
SHOW TABLE STATUS FROM `iparsex`;
SHOW FUNCTION STATUS WHERE `Db`='iparsex';
SHOW PROCEDURE STATUS WHERE `Db`='iparsex';
SHOW TRIGGERS FROM `iparsex`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='information_schema';
SHOW TABLE STATUS FROM `information_schema`;
SHOW FUNCTION STATUS WHERE `Db`='information_schema';
SHOW PROCEDURE STATUS WHERE `Db`='information_schema';
SHOW TRIGGERS FROM `information_schema`;
SHOW EVENTS FROM `information_schema`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='iparsex';
SHOW COLLATION;
SHOW VARIABLES LIKE 'collation_server';
CREATE DATABASE `` /*!40100 COLLATE 'utf8_general_ci' */;
/* Error de SQL (1102): Incorrect database name '' */
CREATE DATABASE `gorka_bbdd` /*!40100 COLLATE 'utf8_general_ci' */;
SHOW DATABASES;
/* Entrando a la sesión "Unnamed" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
USE `gorka_bbdd`;
SHOW ENGINES;
SHOW VARIABLES LIKE 'collation_database';
CREATE TABLE `alumnos` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'clave primaria alumno',
	`nombre` VARCHAR(50) NOT NULL COMMENT 'nombre del candidato',
	`apellido_primero` VARCHAR(50) NOT NULL COMMENT 'primer apellido candidato',
	`dni` CHAR(9) NOT NULL COMMENT 'dni del candidato',
	`nivel_estudios` VARCHAR(50) NULL COMMENT 'nivel de estudios del candidato',
	`edad` INT UNSIGNED NULL COMMENT 'edad del candidato',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
/* Entrando a la sesión "Unnamed" */
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SHOW VARIABLES LIKE 'collation_database';
CREATE TABLE `cursos` (
	`id` INT UNSIGNED NOT NULL COMMENT 'identificador del curso',
	`nombre_curso` VARCHAR(50) NOT NULL COMMENT 'nombre del curso',
	`nivel_requerido` VARCHAR(30) NOT NULL COMMENT 'nivel minimo para el alumno',
	`area` VARCHAR(25) NOT NULL COMMENT 'area del curso ',
	`duracion` INT UNSIGNED NULL COMMENT 'duracion total del curso'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
/* Entrando a la sesión "Unnamed" */
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SELECT * FROM `gorka_bbdd`.`alumnos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
INSERT INTO `gorka_bbdd`.`alumnos` (`nombre`, `apellido_primero`, `dni`, `nivel_estudios`) VALUES ('Oscar', 'Fonticoba', '11.111.111G', 'FP');
SELECT LAST_INSERT_ID();
SELECT `id`, `nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad` FROM `gorka_bbdd`.`alumnos` WHERE  `id`=1;
SELECT CURRENT_TIMESTAMP;
INSERT INTO `gorka_bbdd`.`alumnos` (`nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad`) VALUES ('Iñigo', 'Fernandez', '22.222.222K', 'FP', 27);
SELECT LAST_INSERT_ID();
SELECT `id`, `nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad` FROM `gorka_bbdd`.`alumnos` WHERE  `id`=2;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SELECT * FROM `gorka_bbdd`.`cursos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
ALTER TABLE `cursos`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador del curso' FIRST,
	ADD PRIMARY KEY (`id`);
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
/* Entrando a la sesión "Unnamed" */
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SELECT * FROM `gorka_bbdd`.`cursos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
INSERT INTO `gorka_bbdd`.`cursos` (`nombre_curso`, `nivel_requerido`, `area`, `duracion`) VALUES ('Poo', 'Bachillerato', 'Programacion', 235);
SELECT LAST_INSERT_ID();
SELECT `id`, `nombre_curso`, `nivel_requerido`, `area`, `duracion` FROM `gorka_bbdd`.`cursos` WHERE  `id`=1;
INSERT INTO `gorka_bbdd`.`cursos` (`nombre_curso`, `nivel_requerido`, `area`, `duracion`) VALUES ('Latin', 'ESO', 'Humanidades', 150);
SELECT LAST_INSERT_ID();
SELECT `id`, `nombre_curso`, `nivel_requerido`, `area`, `duracion` FROM `gorka_bbdd`.`cursos` WHERE  `id`=2;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SELECT * FROM `gorka_bbdd`.`alumnos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
ALTER TABLE `alumnos`
	ADD COLUMN `id_curso` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `id`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
/* Entrando a la sesión "Unnamed" */
SELECT * FROM `gorka_bbdd`.`alumnos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SELECT * FROM `gorka_bbdd`.`cursos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
SELECT 1 FROM `cursos` LIMIT 1;
SHOW COLUMNS FROM `cursos`;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
ALTER TABLE `alumnos`
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION) */
SELECT * FROM `gorka_bbdd`.`alumnos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`alumnos`;
ALTER TABLE `alumnos`
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION) */
UPDATE `gorka_bbdd`.`alumnos` SET `id_curso`=3 WHERE  `id`=1;
SELECT `id`, `id_curso`, `nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad` FROM `gorka_bbdd`.`alumnos` WHERE  `id`=1;
UPDATE `gorka_bbdd`.`alumnos` SET `id_curso`=3 WHERE  `id`=2;
SELECT `id`, `id_curso`, `nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad` FROM `gorka_bbdd`.`alumnos` WHERE  `id`=2;
ALTER TABLE `alumnos`
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION) */
ALTER TABLE `alumnos`
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION) */
ALTER TABLE `alumnos`
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)) */
ALTER TABLE `alumnos`
	ALTER `id_curso` DROP DEFAULT;
ALTER TABLE `alumnos`
	CHANGE COLUMN `id_curso` `id_curso` INT(10) UNSIGNED NOT NULL AFTER `id`,
	ADD CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
/* Error de SQL (1452): Cannot add or update a child row: a foreign key constraint fails (`gorka_bbdd`.`#sql-240_1`, CONSTRAINT `FK_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)) */
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
ALTER TABLE `cursos`
	ADD COLUMN `fecha_inicio` DATE NOT NULL COMMENT 'fecha inicio del curso' AFTER `nombre_curso`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
/* Entrando a la sesión "Unnamed" */
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
ALTER TABLE `cursos`
	ADD COLUMN `fecha_fin` DATE NOT NULL COMMENT 'fecha fin del curso' AFTER `fecha_inicio`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='gorka_bbdd';
SHOW TABLE STATUS FROM `gorka_bbdd`;
SHOW FUNCTION STATUS WHERE `Db`='gorka_bbdd';
SHOW PROCEDURE STATUS WHERE `Db`='gorka_bbdd';
SHOW TRIGGERS FROM `gorka_bbdd`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='gorka_bbdd';
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
/* Entrando a la sesión "Unnamed" */
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
SELECT * FROM `gorka_bbdd`.`cursos` LIMIT 1000;
SHOW CREATE TABLE `gorka_bbdd`.`cursos`;
UPDATE `gorka_bbdd`.`cursos` SET `fecha_inicio`='2016-05-12' WHERE  `id`=1;
SELECT `id`, `nombre_curso`, `fecha_inicio`, `fecha_fin`, `nivel_requerido`, `area`, `duracion` FROM `gorka_bbdd`.`cursos` WHERE  `id`=1;
UPDATE `gorka_bbdd`.`cursos` SET `fecha_inicio`='2017-05-01' WHERE  `id`=2;
SELECT `id`, `nombre_curso`, `fecha_inicio`, `fecha_fin`, `nivel_requerido`, `area`, `duracion` FROM `gorka_bbdd`.`cursos` WHERE  `id`=2;