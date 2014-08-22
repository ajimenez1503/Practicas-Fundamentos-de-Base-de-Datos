-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--crear tabla lista de bodas
---------------------------------------------
 Create table Lista_boda(
	Ref# char(3) primary key,
	Descripcion varchar(20),
	Precio float not null
);
---------------------------------------------
Create table Invitaciones(
	Nombre varchar(10) primary key,
	Direccion varchar(20) not null,
	Ciudad varchar(10) not null check (ciudad in ('Granada','Almeria')
);
---------------------------------------------
Create table confirmacion(
	Nombre references invitaciones(nombre),
	Numero number default 1 check (numero between 1 and 5),
	Primary key(nombre)
);
---------------------------------------------
Create table Reserva_regalo(
	Nombre references invitaciones(nombre),
	Ref# reference lita_boda(ref#),
	Fecha date,
	Primary key(nombre,ref#)
);
---------------------------------------------
