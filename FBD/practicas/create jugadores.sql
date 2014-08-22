-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--Crear tabla jugadores Base de datos equipos
---------------------------------------------
-- Creación tabla equipos
CREATE TABLE equipos(
code char(3) PRIMARY KEY,
nombree varchar2(30) NOT NULL UNIQUE,
localidad varchar(30),
entrenador varchar(30) NOT NULL,
fecha_crea date
); 

---------------------------------------------
-- Creación tabla jugadores
CREATE TABLE jugadores(
codj char(3) PRIMARY KEY,
code char(3) REFERENCES equipos(code),
nombrej varchar2(30) NOT NULL
);

---------------------------------------------
-- Creación tabla encuentros
CREATE TABLE encuentros(
eq1 char(3) REFERENCES equipos(code),
eq2 char(3) REFERENCES equipos(code),
fecha DATE NOT NULL,
res1 int DEFAULT 0 CHECK(res1>=0),
res2 int DEFAULT 0 CHECK(res2>=0),
PRIMARY KEY(eq1,eq2),
CHECK(eq1<>eq2)
);

---------------------------------------------
-- Creación tabla faltas
CREATE TABLE faltas(
codj char(3),
eq1 char(3),
eq2 char(3),
num int DEFAULT 0 CHECK(num>=0 and num <=5),
FOREIGN KEY(eq1,eq2) REFERENCES encuentros(eq1,eq2),
PRIMARY KEY(codj,eq1,eq2)
);
---------------------------------------------
