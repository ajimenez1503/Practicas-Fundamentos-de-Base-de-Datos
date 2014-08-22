-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--crear tabla liba baloncesto
---------------------------------------------
 Create table Equipos(
	codE char(3) primary key,
	nombreE varchar(20) unique,
	localidad varchar(20) not null,
	entrenador varchar(20) not null,
	fecha_crea date not null
);
---------------------------------------------
Create table Equipos(
	codj char(3) primary key,
	codE referneces Equipos (code),
nombreJ varchar(20) not null	
);
---------------------------------------------
Créate table Encuentros(
	Eq1 referneces Equipos (code),
	Eq2 referneces Equipos (code),
	fecha date not null,
	res1 number default 0 check (res1>=0)not null, 
	res2 number default 0 check (res2>=0) not null,
	primary key (eq1,eq2)
);
---------------------------------------------
Create table Faltas(
	codj references Jugadores (codJ),
	Eq1 referneces encuentros (eq1),
	Eq2 referneces encuentros (eq2),
	Num number default 0 check (num>=0 and num<=5)not null,
	--tambien podemos poner : foreign key (eq1, eq2) references encuentros( eq1, eq2),
	primary key (codj,eq1,eq2)

);
---------------------------------------------
INSERT INTO Equipos select * from xp989292.Equipos;  
INSERT INTO Jugadores select * from xp989292.Jugadores;
INSERT INTO Encuentros select * from xp989292.Encuentros;
INSERT INTO Faltas select * from xp989292.Faltas;

