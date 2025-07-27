CREATE DATABASE prueba;

USE prueba;

DROP DATABASE prueba;

CREATE DATABASE prueba CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

CREATE DATABASE escuela CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

USE escuela;

DROP TABLE IF EXISTS cr_escuela;
CREATE TABLE cr_alumno (
    id_alumno INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nom_alumno VARCHAR(50) NOT NULL,
    des_apellido VARCHAR(50) NOT NULL,
    cod_grado INT NOT NULL,
    des_grupo VARCHAR(20) NOT NULL,
    fec_ingreso DATE DEFAULT '0000-00-00'
) AUTO_INCREMENT = 100000;

SHOW CREATE TABLE cr_alumno;

DESCRIBE cr_alumno;

ALTER TABLE prueba RENAME cr_alumno;

SHOW TABLES;

ALTER TABLE cr_alumno ADD COLUMN num_edad INT NOT NULL;

ALTER TABLE cr_alumno DROP COLUMN num_edad;

CREATE TABLE cr_profesor(
    id_profesor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nom_profesor VARCHAR(50) NOT NULL,
    cod_grado INT NOT NULL,
    fec_ingreso DATE DEFAULT '0000-00-00',
    num_edad INT NOT NULL
) AUTO_INCREMENT = 100000;

DESCRIBE cr_profesor;

DESCRIBE cr_alumno;

ALTER TABLE cr_alumno DROP COLUMN cod_grado;

ALTER TABLE cr_alumno DROP COLUMN des_grupo;

SHOW DATABASES;

USE escuela;

SHOW TABLES;

CREATE TABLE cr_salon (
    id_salon INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cod_grado INT NOT NULL,
    des_grupo VARCHAR(2) NOT NULL
);

USE escuela;

SELECT *
FROM cr_alumno;

ALTER TABLE cr_alumno DROP COLUMN fec_ingreso;

ALTER TABLE cr_alumno ADD COLUMN id_salon INT NOT NULL;

ALTER TABLE cr_alumno DROP COLUMN id_salon;

ALTER TABLE cr_alumno ADD COLUMN id_salon INT NOT NULL AFTER id_alumno;

ALTER TABLE cr_alumno ADD CONSTRAINT fk_alumno_salon FOREIGN KEY (id_salon)
REFERENCES cr_salon(id_salon) ON DELETE CASCADE ON UPDATE CASCADE;

SHOW CREATE TABLE cr_alumno;

SHOW CREATE TABLE cr_salon;

INSERT INTO `cr_salon` (`cod_grado`, `des_grupo`)  
VALUES  
(1, 'A'),  
(2, 'B'),  
(3, 'C'),  
(4, 'D');

SELECT *
FROM cr_salon;

INSERT INTO `cr_alumno` (`id_salon`, `nom_alumno`, `des_apellido`)  
VALUES  
(1, 'Juan', 'Pérez'),  
(2, 'María', 'Gómez'),  
(3, 'Carlos', 'Fernández'),  
(4, 'Ana', 'López');

SELECT *
FROM cr_alumno;

DELETE FROM cr_salon
WHERE id_salon = 4;

USE escuela;

SELECT *
FROM cr_alumno;

SELECT *
FROM cr_salon;

DESCRIBE cr_alumno;

ALTER TABLE cr_alumno DROP CONSTRAINT fk_alumno_salon;

ALTER TABLE cr_alumno ADD CONSTRAINT fk_alumno_salon FOREIGN KEY (id_salon)
REFERENCES cr_salon(id_salon) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO cr_alumno (id_salon, nom_alumno, des_apellido) 
VALUES
 (1, 'Lucía', 'Rodriguez'),
 (3, 'Marco', 'Ruiz');

USE escuela;

SELECT *
FROM cr_salon;

SET foreign_key_checks = 0;

TRUNCATE TABLE cr_salon;

SELECT *
FROM cr_salon;

SELECT *
FROM cr_alumno;

TRUNCATE TABLE cr_alumno;

INSERT INTO cr_salon(
    cod_grado,
    des_grupo
) 
VALUES
    (1, 'B'),
    (2, 'C'),
    (3, 'D');

INSERT INTO cr_alumno(
    id_salon,
    nom_alumno,
    des_apellido
)
VALUES
    (1, 'Jean', 'Aponte'),
    (2, 'Carlos', 'Guerrero'),
    (3, 'Luis', 'Perez');

UPDATE cr_alumno SET nom_alumno = 'María' 
WHERE 
    id_alumno = 3;

SELECT *
FROM cr_alumno;

UPDATE cr_alumno SET nom_alumno = 'Luis', des_apellido = 'Gutierrez'
WHERE
    id_alumno = 3;

ALTER TABLE cr_alumno ADD COLUMN num_nota INT NOT NULL;

UPDATE cr_alumno SET num_nota = num_nota + 5
WHERE
    id_alumno = 3;

SELECT *
FROM cr_alumno;

UPDATE cr_alumno SET num_nota = REPLACE(num_nota, 0, 3);

SELECT *
FROM cr_alumno;

USE escuela;

SELECT *
FROM cr_alumno;

DELETE FROM cr_alumno
WHERE id_alumno = 2;

DELETE FROM cr_alumno
WHERE num_nota < 4;

DESCRIBE cr_alumno;

INSERT INTO cr_alumno (id_salon, nom_alumno, des_apellido, num_nota)
VALUES 
    (1, 'Jean', 'Pariona', 13),
    (2, 'Lía', 'Aponte', 18),
    (3, 'Daisy', 'Guerrero', 16),
    (1, 'Adrian', 'Aponte', 17),
    (2, 'Juan', 'Pérez', 14);

SELECT *
FROM cr_alumno;

DELETE FROM cr_alumno WHERE id_alumno = 3;

SELECT *
FROM cr_alumno;

TRUNCATE TABLE cr_alumno;

SELECT *
FROM cr_alumno;

SELECT 
    id_salon, 
    nom_alumno
FROM cr_alumno;

SELECT 
    nom_alumno
FROM cr_alumno
WHERE
    id_salon = 3;

SELECT 
    nom_alumno AS alumno,
    num_nota AS nota
FROM cr_alumno
WHERE
    id_salon = 3;

SELECT
    id_salon AS salon,
    AVG(num_nota) AS 'Promedio Nota'
FROM cr_alumno
GROUP BY
    id_salon;

SELECT *
FROM cr_alumno
LIMIT 3;

SELECT *
FROM cr_alumno
LIMIT 3, 2;

SELECT *
FROM cr_alumno
ORDER BY
    num_nota DESC;

SELECT *
FROM cr_alumno
WHERE 
    num_nota IN (13, 14, 18)
    AND id_salon = 2;

SELECT *
FROM cr_alumno
WHERE 
    num_nota != 13
    AND num_nota <> 18;

SELECT *
FROM cr_alumno
WHERE 
    num_nota BETWEEN 13 AND 16;

SELECT *
FROM cr_alumno
WHERE
    nom_alumno LIKE '%an%';

USE escuela;

SELECT *
FROM cr_alumno;

SELECT *
FROM cr_salon;

SELECT 
    a.*,
    b.cod_grado
FROM cr_alumno AS a
INNER JOIN cr_salon AS b
ON a.id_salon = b.id_salon;

DESCRIBE cr_alumno;

CREATE TABLE cr_materia(
    id_materia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_materia VARCHAR(50) NOT NULL
);

DESCRIBE cr_materia;

CREATE TABLE cr_clase (
    id_clase INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_materia INT NOT NULL,
    num_hora TIME NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES cr_alumno(id_alumno)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES cr_materia(id_materia)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE cr_clase;

SHOW CREATE TABLE cr_alumno;

SHOW CREATE TABLE cr_salon;

INSERT INTO cr_salon (cod_grado, des_grupo) VALUES
(1, 'A'),
(1, 'B'),
(2, 'A'),
(2, 'B'),
(3, 'A');

INSERT INTO cr_alumno (id_salon, nom_alumno, des_apellido, num_nota) VALUES
(1, 'Juan', 'Pérez', 15),
(1, 'María', 'Gómez', 17),
(2, 'Luis', 'Rodríguez', 18),
(2, 'Lucía', 'López', 14),
(3, 'Carlos', 'Ramírez', 19),
(3, 'Ana', 'Fernández', 13),
(4, 'Pedro', 'Torres', 16),
(4, 'Paula', 'Ruiz', 20),
(5, 'Miguel', 'Díaz', 12),
(5, 'Laura', 'Morales', 11),
-- continúa hasta llegar a 50
(1, 'José', 'Vega', 14),
(1, 'Sofía', 'Ortega', 16),
(2, 'Diego', 'Medina', 18),
(2, 'Valeria', 'Silva', 17),
(3, 'Andrés', 'Castro', 15),
(3, 'Camila', 'Reyes', 19),
(4, 'Álvaro', 'Núñez', 20),
(4, 'Isabella', 'Cruz', 13),
(5, 'Samuel', 'Mendoza', 12),
(5, 'Antonia', 'Cáceres', 14),
(1, 'Emilio', 'García', 16),
(1, 'Martina', 'Flores', 18),
(2, 'Daniel', 'Sánchez', 13),
(2, 'Renata', 'Jiménez', 15),
(3, 'Matías', 'Herrera', 17),
(3, 'Julia', 'Ríos', 19),
(4, 'Tomás', 'Ibarra', 16),
(4, 'Ariana', 'Peña', 20),
(5, 'Bruno', 'Navarro', 10),
(5, 'Elena', 'Salazar', 12),
(1, 'Cristian', 'Valdez', 13),
(1, 'Carla', 'Paredes', 15),
(2, 'Esteban', 'Vargas', 17),
(2, 'Bárbara', 'Campos', 14),
(3, 'Gonzalo', 'León', 11),
(3, 'Melina', 'Molina', 12),
(4, 'Nicolás', 'Soto', 16),
(4, 'Tatiana', 'Delgado', 15),
(5, 'Héctor', 'Figueroa', 13),
(5, 'Marina', 'Ponce', 17),
(1, 'Axel', 'Zamora', 19),
(1, 'Eva', 'Gallegos', 18),
(2, 'Ramiro', 'Contreras', 14),
(2, 'Josefa', 'Carranza', 15),
(3, 'Iván', 'Barrios', 13),
(3, 'Clara', 'Reynoso', 17),
(4, 'Leandro', 'Espinoza', 12),
(4, 'Agustina', 'Palacios', 19),
(5, 'Darío', 'Correa', 11),
(5, 'Florencia', 'Zúñiga', 14);

INSERT INTO cr_materia (nom_materia) VALUES
('Matemática'),
('Comunicación'),
('Ciencias'),
('Historia'),
('Arte'),
('Educación Física'),
('Computación'),
('Inglés'),
('Religión'),
('Música');

INSERT INTO cr_clase (id_alumno, id_materia, num_hora) VALUES
(1, 1, '08:00:00'),
(2, 2, '09:00:00'),
(3, 3, '10:00:00'),
(4, 4, '11:00:00'),
(5, 5, '12:00:00'),
(6, 6, '08:00:00'),
(7, 7, '09:00:00'),
(8, 8, '10:00:00'),
(9, 9, '11:00:00'),
(10, 10, '12:00:00');

SELECT *
FROM cr_clase;

SELECT *
FROM cr_alumno;

SELECT *
FROM cr_materia;

WITH tmp_materia AS(
    SELECT
        a.id_materia,
        a.nom_materia,
        b.id_alumno
    FROM cr_materia AS a
    LEFT JOIN cr_clase AS b
    ON a.id_materia = b.id_materia
)
SELECT 
    a.id_alumno,
    a.nom_alumno,
    a.des_apellido,
    b.nom_materia
FROM cr_alumno AS a 
LEFT JOIN tmp_materia AS b
ON a.id_alumno = b.id_alumno;

USE escuela;

CREATE VIEW vista_alumno_sin_salon AS
SELECT *
FROM cr_alumno
WHERE
    id_salon = 2;

SELECT *
FROM vista_alumno_sin_salon;

DROP VIEW vista_alumno_sin_salon;

CREATE VIEW vista_alumno_sin_salon AS
SELECT 
    id_alumno,
    nom_alumno,
    des_apellido
FROM cr_alumno
WHERE
    id_salon = 2;

SELECT *
FROM vista_alumno_sin_salon;

ALTER VIEW vista_alumno_sin_salon AS
SELECT 
    id_alumno,
    nom_alumno,
    des_apellido,
    num_nota
FROM cr_alumno
WHERE
    id_salon = 2;

SET @nota_reprobada = 13;
SET @nota_aprobada = 15;
SET @nota_excelente =18;

SELECT *
FROM vista_alumno_sin_salon
WHERE
    num_nota <= @nota_reprobada;

SELECT *
FROM vista_alumno_sin_salon
WHERE
    num_nota >= @nota_aprobada;

SELECT *
FROM vista_alumno_sin_salon
WHERE
    num_nota >= @nota_excelente;

USE escuela;    

SELECT *
FROM cr_alumno;

DELIMITER //

CREATE PROCEDURE alumno_con_letra(IN letra CHAR)
BEGIN
  SELECT *
  FROM cr_alumno
  WHERE nom_alumno LIKE CONCAT('%', letra, '%');
END //

DELIMITER ;

DROP PROCEDURE alumno_con_letra;

CALL alumno_con_letra('a');

DELIMITER //

CREATE FUNCTION numero_letra(letra CHAR)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE numero INT;

    SELECT COUNT(*) INTO numero
    FROM cr_alumno
    WHERE nom_alumno LIKE CONCAT('%', letra, '%');

    RETURN numero;
END//

DELIMITER ;

SELECT numero_letra('j');

DELIMITER //

CREATE PROCEDURE operacion_matematica( IN numero1 INT, IN numero2 INT, OUT res_mul INT, OUT res_sum INT)
BEGIN
	SELECT
		numero1 * numero2,
        numero1 + numero2 INTO res_mul, res_sum;
END//

DELIMITER ;

SET @res_mul = 0;
SET @res_sum = 0;
CALL operacion_matematica(2, 4, @res_mul, @res_sum);
SELECT @res_mul, @res_sum;

USE escuela;

CREATE TABLE cr_accion(
	cod_accion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    des_accion VARCHAR(200) NULL,
    fec_creacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE cr_acciones;

DESCRIBE cr_accion;

DELIMITER //

CREATE TRIGGER log_cr_alumno
AFTER INSERT ON cr_alumno
FOR EACH ROW
BEGIN
    INSERT INTO cr_accion (des_accion)
    VALUES (CONCAT('Se creó un registro en cr_alumno con nombre: ', NEW.nom_alumno, ' y código: ', NEW.id_alumno));
END//

DELIMITER ;

DROP TRIGGER log_cr_alumno;

SELECT *
FROM cr_alumno;

INSERT INTO cr_alumno (id_salon, nom_alumno, des_apellido, num_nota)
VALUES (4, 'Carlos', 'Bermúdez', 18);

SELECT *
FROM cr_alumno
WHERE
	nom_alumno LIKE '%Carlos%';
    
SELECT *
FROM cr_accion;

SELECT *
FROM mysql.USER;