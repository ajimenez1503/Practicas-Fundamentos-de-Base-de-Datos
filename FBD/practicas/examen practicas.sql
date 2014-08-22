-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--Examen practicas SQL sobre la tabla liba baloncesto:

--------------------------------------------------


--Mostrar el número medio de puntos por equipo y año para los equipos fuera de casa.

select eq2,avg(res2), to_char(fecha,'yy') from Encuentros group by (eq2,to_char(fecha,'yy'));

--------------------------------------------------

--Crear una vista con los nombres y entrenadores de los equipos que ya se han enfrentado y que han ganado en casa.

create view vista as select nombreE,entrenador from Equipos,Encuentros where (Encuentros.eq1=Equipos.codE and fecha<sysdate and res1>res2);

--------------------------------------------------

--Nombre de los entrenadores que han entrenado a todos los equipos de granada

select E1.entrenador from Equipos E1 where ( not exists(
(select E2.codE from Equipos E2 where localidad='Granada')
minus
(select E3.codE from Equipos E3 where E3.codE=E1.codE)
)
);

----------------------------

--Poner a cero las falta de los jugadores para los encuentros que no se hayan jugado aun:

update faltas set num=0 where eq1,eq2 in ( select eq1,eq2 from Encuentros where fecha>sysdate);

o

update faltas set num=0 where exists 
( select * from Encuentros where faltas.eq1=Encuentros.eq1 and faltas.eq2=Encuentos.eq2 and fecha>sysdate);



