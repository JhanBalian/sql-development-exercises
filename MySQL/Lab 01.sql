CREATE DATABASE primera;

CREATE DATABASE segunda;

SHOW DATABASES;

USE primera;

DROP TABLE IF EXISTS persona;
CREATE TABLE persona(
	nom_persona VARCHAR (15),
    des_apellido VARCHAR(15),
    num_dni INT(12) PRIMARY KEY NOT NULL,
    fec_nacimiento DATE
);

DESCRIBE persona;

SHOW TABLES;

USE segunda;

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente(
	num_dni INT(15) PRIMARY KEY NOT NULL,
    nom_cliente VARCHAR(15),
    des_apellido VARCHAR(15),
    fec_nacimiento DATE,
    des_direccion VARCHAR(50)
);

DESCRIBE cliente;

SHOW TABLES;

USE primera;

INSERT INTO persona (nom_persona, des_apellido, num_dni, fec_nacimiento) 
VALUES
('Luis', 'Guerrero', 71333252, '1988-12-01'),
('Miguel', 'Huari', 71291328, '1998-01-14');

SELECT *
FROM persona;

SELECT
	nom_persona,
    des_apellido,
    num_dni
FROM persona
WHERE
	nom_persona = 'Carlos';

SELECT
	nom_persona,
    des_apellido,
    num_dni
FROM persona
WHERE
	num_dni > 72000000;
    
SHOW COLUMNS FROM persona;

SELECT *
FROM persona;

DELETE FROM persona
WHERE
	num_dni = 71331259;
    
DELETE FROM persona
WHERE
	num_dni <> 71291328;
    
DELETE FROM persona;

USE primera;

SELECT *
FROM primera.persona;

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
	id_usuario INT(12) PRIMARY KEY NOT NULL,
	nom_usuario VARCHAR(20), 
    des_apellido VARCHAR(20)
);

INSERT INTO usuario (id_usuario, nom_usuario, des_apellido) 
VALUES 
    (1, 'Juan', 'Pérez'),
    (2, 'María', 'Gómez'),
    (3, 'Carlos', 'Fernández'),
    (4, 'Ana', 'López'),
    (5, 'Pedro', 'Martínez'),
    (6, 'Luis', 'Fernández'), -- Duplicado de id_usuario 3
    (7, 'Martha', 'Martínez'); -- Duplicado de id_usuario 5
    
SELECT *
FROM usuario
WHERE 1=1
	AND des_apellido LIKE 'Fernández'
    AND id_usuario = 3;

SELECT *
FROM usuario
WHERE 1=1
    AND id_usuario > 4;

SELECT *
FROM usuario
WHERE
	id_usuario BETWEEN 2 AND 5;

SELECT *
FROM usuario
WHERE
	id_usuario NOT BETWEEN 2 AND 5;
    
SELECT *
FROM usuario
WHERE
	id_usuario  IN (2, 5, 6);
    
SELECT *
FROM usuario
WHERE
	id_usuario BETWEEN 4 AND 5
    OR nom_usuario LIKE 'Carlos';

SELECT *
FROM usuario
WHERE
	nom_usuario  LIKE '%c%';
    
SELECT
	SUM(id_usuario) AS num_total
FROM usuario;

SELECT
	COUNT(nom_usuario) AS num_total_ususario
FROM usuario;

SELECT
	MAX(id_usuario) AS num_max
FROM usuario;

SELECT
	MIN(id_usuario) AS num_min
FROM usuario;

SELECT 
	nom_usuario,
    SUM(id_usuario) AS sum_usuario
FROM usuario
GROUP BY
	nom_usuario;
    
SELECT *
FROM usuario;

INSERT INTO usuario (id_usuario, nom_usuario, des_apellido)
VALUES
	(8, 'Ana', 'García'),
    (9, 'Pedro', 'Gutierrez'),
    (10, 'Luis', 'Aponte');
    
SELECT
	nom_usuario,
    COUNT(id_usuario) AS num_usuario
FROM usuario
GROUP BY
	nom_usuario;
    
SELECT 
	nom_usuario,
    SUM(id_usuario) AS sum_usuario
FROM usuario
WHERE 1=1
	AND nom_usuario = 'Ana'
    OR nom_usuario = 'Luis'
GROUP BY
	nom_usuario;
    
SELECT 
	nom_usuario,
    SUM(id_usuario) AS sum_usuario
FROM usuario
GROUP BY
	nom_usuario
HAVING
	sum_usuario > 10;

SELECT 
	nom_usuario,
    COUNT(id_usuario) AS num_usuario
FROM usuario
GROUP BY
	nom_usuario
HAVING
	num_usuario > 1;
    
SELECT 
	*
FROM usuario
WHERE
	id_usuario >= 5
ORDER BY
	id_usuario DESC;
 
DROP TABLE IF EXISTS individuo;
CREATE TABLE individuo (
	num_dni INT(15) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nom_individuo VARCHAR(20),
    des_apellido VARCHAR(20)
);

INSERT INTO individuo (nom_individuo, des_apellido)
VALUES
	('Jean', 'Aponte'),
    ('Yzavho', 'Bermudez'),
    ('Luis', 'Espinoza');
    
SELECT *
FROM individuo;

DESCRIBE individuo;

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
	num_dni INT(15) NOT NULL PRIMARY KEY,
    des_direccion VARCHAR(50),
    CONSTRAINT fk_cliente_individuo FOREIGN KEY (num_dni)
    REFERENCES individuo(num_dni)
);

SELECT *
FROM cliente;

DESCRIBE cliente;

INSERT INTO cliente (num_dni, des_direccion)
VALUES
(7, 'Av Micaela'),
(9, 'Av San Andres');

USE primera;

SHOW TABLES;

ALTER TABLE ususario1 RENAME usuario;

ALTER TABLE usuario DROP COLUMN nom_ususario;

SELECT *
FROM usuario;

ALTER TABLE usuario ADD COLUMN nom_usuario VARCHAR(20) AFTER id_usuario;

DESCRIBE usuario;

ALTER TABLE usuario ADD COLUMN des_alias VARCHAR(20) AFTER des_apellido;

ALTER TABLE usuario ADD COLUMN des_test VARCHAR(20) FIRST;

ALTER TABLE usuario CHANGE des_test des_prueba VARCHAR(20);

ALTER TABLE cliente DROP FOREIGN KEY fk_cliente_individuo;

DESCRIBE cliente;

ALTER TABLE individuo DROP PRIMARY KEY;

DROP TABLE IF EXISTS producto;
CREATE TABLE producto (
    id_producto INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    des_descripcion VARCHAR(30)
) AUTO_INCREMENT = 100000;

DESCRIBE producto;

INSERT INTO producto (des_descripcion)
VALUES
    ('sdfsdfsdfsdf'),
    ('banana'),
    ('jamonada');

SELECT *
FROM producto;

TRUNCATE TABLE producto;

DELETE FROM producto;

CREATE TABLE documento (
    id_documento INT(15) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    des_documento VARCHAR(30),
    des_autor VARCHAR(30)
 ) AUTO_INCREMENT = 100000;

DESCRIBE documento;

INSERT INTO documento (des_documento, des_autor)
VALUES
    ('El arte de la guerra', 'Sun Tzu'),
    ('Cien años de soledad', 'Gabriel García Márquez'),
    ('1984', 'George Orwell'),
    ('Don Quijote de la Mancha', 'Miguel de Cervantes'),
    ('La Odisea', 'Homero'),
    ('Crimen y castigo', 'Fiódor Dostoyevski'),
    ('Orgullo y prejuicio', 'Jane Austen'),
    ('El principito', 'Antoine de Saint-Exupéry'),
    ('Moby Dick', 'Herman Melville'),
    ('La Divina Comedia', 'Dante Alighieri');

SELECT *
FROM documento;

ALTER TABLE documento CHANGE COLUMN des_documento des_titulo VARCHAR(30);

SELECT *
FROM documento
WHERE
    des_autor REGEXP 'an';

SELECT *
FROM documento
WHERE
    des_autor NOT REGEXP 'an';

SELECT *
FROM documento
WHERE
    des_autor NOT REGEXP '[mr]';

SELECT *
FROM documento
WHERE
    des_autor REGEXP '[a-c]';

SELECT *
FROM documento
WHERE
    des_autor REGEXP '^a';

SELECT *
FROM documento
WHERE
    des_autor REGEXP 'o$';

SELECT *
FROM documento
WHERE
    des_autor REGEXP 'm. .z';

CREATE TABLE salario (
    nom_empleado VARCHAR(30) NOT NULL PRIMARY KEY,
    mnt_salario INT(10),
    mnt_venta INT(20)
);

DESCRIBE salario;

INSERT INTO salario (nom_empleado, mnt_salario, mnt_venta)
VALUES
    ('Juan Pérez', 3500, 50000),
    ('María López', 4200, 60000),
    ('Carlos Gómez', 3900, 55000),
    ('Ana Ramírez', 4100, 62000),
    ('Pedro Torres', 3700, 53000),
    ('Lucía Fernández', 4500, 68000),
    ('Miguel Soto', 3600, 49000),
    ('Elena Rojas', 4000, 58000),
    ('Ricardo Díaz', 4300, 65000),
    ('Sofía Herrera', 3800, 52000);

SELECT *
FROM salario;

SELECT 
    nom_empleado,
    mnt_salario,
    mnt_salario + (500 * mnt_venta) AS mnt_bono
FROM salario;

SELECT *
FROM documento;