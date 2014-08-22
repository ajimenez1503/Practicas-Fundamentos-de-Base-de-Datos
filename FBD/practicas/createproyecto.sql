-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--crear tabla proyecto
---------------------------------------------
create table proyecto(
codpj char(3) constraint codpj_clave_primaria primary key,
nompj varchar2(20) constraint nompj_no_nulo not null,
ciudad varchar2(15));
---------------------------------------------
