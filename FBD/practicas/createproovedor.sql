-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--crear tabla proveedor
---------------------------------------------
create table proveedor(
codpro char(3) constraint codpro_clave_primaria primary key,
nompro varchar2(30) constraint nompro_no_nulo not null,
status number constraint status_entre_1_y_10 check(status>=1 and status<=10),
ciudad varchar2(15));
---------------------------------------------
