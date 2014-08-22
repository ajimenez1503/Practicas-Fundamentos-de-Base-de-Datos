-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--Rellenar tabla jugadores Base de datos equipos

---------------------------------------------
-- Rellenar equipos
INSERT INTO equipos VALUES ('E1','Real Madrid de Baloncesto','Madrid','Pablo Laso','22/03/1931');
INSERT INTO equipos VALUES ('E2','FC Barcelona','Barcelona','Xavi Pascual','24/10/1926');
INSERT INTO equipos VALUES ('E3','Club Baloncesto Granada','Granada','Miguel Ángel Zapata','28/06/1994');
INSERT INTO equipos VALUES ('E4','Valencia Basket','Valencia','Velimir Perasovic',04/02/1986);
INSERT INTO equipos VALUES ('E5','Unicaja Málaga','Málaga','Joan Plaza','20/03/1992'); 
COMMIT;

---------------------------------------------
-- Rellenar jugadores
INSERT INTO jugadores VALUES ('J1','E1','Pepe')
INSERT INTO jugadores VALUES ('J2','E1','Juan')
INSERT INTO jugadores VALUES ('J3','E1','Evaristo')

INSERT INTO jugadores VALUES ('J4','E2','Torcuato')
INSERT INTO jugadores VALUES ('J5','E2','Baldomero')
INSERT INTO jugadores VALUES ('J6','E2','Ermenegildo')

INSERT INTO jugadores VALUES ('J7','E3','Mariano')
INSERT INTO jugadores VALUES ('J8','E3','Andres')
INSERT INTO jugadores VALUES ('J9','E3','Antonio')

COMMIT;
---------------------------------------------
