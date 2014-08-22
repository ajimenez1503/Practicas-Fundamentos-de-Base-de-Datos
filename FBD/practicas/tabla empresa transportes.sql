-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--crear tabla empresa de transportes
---------------------------------------------
 Create table conductor(
	DNI char(9) primary key,
	Nombre varchar(20) not null,
	Dirección varchar(20) not null,
	Prov varchar(20) not null
);
---------------------------------------------
Create table Vehiculo(
	Matricula char(7) primary key,
	Carga_max float not null default 250 check (carga_max<1000)
	Fecha_compra date default sysdate not null
);
---------------------------------------------
Créate table Ruta(
	Ruta# char(3) primary key,
	Ciudad_sal varchar(20) check(ciudad_sal!>ciudad_lleg) not null,
	Ciudad_lleg varchar(20) not null,
	Km float default 0
);
---------------------------------------------
Create table viaje(
	Viaje# char(3) primary key,
	Dni referneces conductor(DNI),
	Matricula references vehiculo(matricula)
);
---------------------------------------------
Create table prog_viaje(
	Viaje# references viaje (viaje#),
	Ruta# references ruta(ruta#),
	Dia_sem varchar(10) not null check( dia_Sem in ('lunes','miercoles','viernes'),
	Hora_Sal time not null check(hora_sal<hora_lleg and hora_sal between 0 and 24),
	Hora_lleg time not null check (hora_lleg between 0 and 24),
	Primary key(viaje#,ruta#)
);

