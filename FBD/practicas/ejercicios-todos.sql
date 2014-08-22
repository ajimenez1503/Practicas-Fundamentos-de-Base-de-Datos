-- (C) Programmed by:
-- Antonio Jimenez Martínez


--Practica Fundamentos de base de datos.
--Version:0.1

--Todos los ejercicios del cuaderno de practicas:
---------------------------------------------
---------------------------------------------

--Encontrar los nombres de los proveedores q han vendido la pieza p2.

select nompro from proveedor , ventas where proveedor.codpro=ventas.codpro and codpie='P2';

--Para que la salida salga en orden la salida:

select nompro from proveedor , ventas where proveedor.codpro=ventas.codpro and codpie='P2' order by nompro;

---------------------------------------------
--3.1.Muestra las ciudades donde hay un proyecto.

 Select distinct ciudad from proyecto;
--distinct para que no se repitan filas.

-----------------------------------------------
--Ejemplo: 3.2. Muestra la información disponible acerca de los proveedores.

Select * from proveedor;

-----------------------------------------------

--Ejercicio 3.2. Muestra los suministros realizados (tan solo los códigos de los componentes de una venta).

Select codpro from ventas;

-------------------------------------------------

--Ejemplo 3.3 Muestra los códigos de los proveedores que suministran al proyecto 'J1'.

Select codpro from ventas where codpj='J1';

-----------------------------------------------

--Ejercicio 3.3 Muestra las piezas de Madrid que son grises o rojas.

select nompie from pieza where ciudad='Madrid' and color='Gris' or color='Rojo';

-------------------------------------------------

--Ejercicio 3.4 Encontrar todos los suministros cuya cantidad estén entre 200 y 300, ambos inclusive.

select codpro , codpie , codpj from ventas where cantidad between 200 and 300;

-------------------------------------------------


--Ejercicio 3.5 Mostrar las piezas que contengan la palabra tornillo bien en mayúsculas bien en minúsculas.

select nompie from pieza where lower(nompie) like '%tornillo%';

-------------------------------------------------

--Ejercicio 3.12 Mostrar las ternas que son de la misma ciudad pero que hayan realizado alguna venta.

--Ternas que coincidan las 3 ciudades de pieza, proyecto y proovedor

(Select codpro,codpie,codpj from proveedor, proyecto, pieza where proyecto.ciudad=pieza.ciudad and proyecto.ciudad=proveedor.ciudad) intersect
(select codpro,codpie,codpj from ventas);

-------------------------------------------------

--Ejercicio 3.13 Mostrar las piezas vendidas por los proveedores de Madrid.

select DISTINCT pieza.nompie from ventas , pieza , proveedor where (ventas.codpro=proveedor.codpro and ventas.codpie=pieza.codpie and proveedor.ciudad='Madrid');

--------------------------------------------------

--Ejercicio 3.14 Encuentra la ciudad y los códigos de las piezas suministradas a cualquier proyecto. Por un proveedor que este en la misma ciudad donde  este el proyecto.

select DISTINCT pieza.ciudad, pieza.codpie from ventas, pieza, proveedor, proyecto where 
(ventas.codpro=proveedor.codpro and ventas.codpie=pieza.codpie and ventas.codpj=proyecto.codpj and proveedor.ciudad=proyecto.ciudad);

---------------------------------------------------

--Ejercicio 3.8 Encontrar los códigos de aquellos proyectos a los que sólo abastece 'S1'.

(select proyecto.codpj from ventas , proyecto where (ventas.codpj=proyecto.codpj and proyecto.codpj='S1'))
 Minus
(select codpj from ventas where (codpj<> 's1'));

-----------------------------------------------

--Ejercicio 3.19 Mostrar las piezas vendidas por los proveedores de Madrid. (Fragmentando la consulta con ayuda del operador IN.) 

select distinct codpie from ventas where codpro in (select codpro from proveedor where ciudad='Madrid');

-----------------------------------------------


--Ejercicio 3.20 Encuentra los proyectos que están en una ciudad donde se fabrica alguna pieza.

select * from proyecto where ciudad in (select ciudad from pieza);

-----------------------------------------------

--Ejercicio 3.21 Encuentra los códigos de aquellos proyectos que no utilizan ninguna pieza roja que esta suministrada por un proveedor de Londres.

select distinct codpj from ventas where (codpie not in 
(select pieza.codpie from pieza,ventas,proveedor where 
(ventas.codpie=pieza.codpie and ventas.codpro=proveedor.codpro and pieza.color='Roja' and proveedor.ciudad='Londres'))); 

-----------------------------------------------

--ejercicio 3.22 muestra el código de las piezas cuyo peso es mayor que cualquier tornillo

select codpie from pieza where peso > all (select peso from pieza where nompie='tornillo');

-----------------------------------------------


--ejercicio 3.23 encuentra las piezas de menor peso

select * from pieza where peso <= all (select peso from pieza);

o

select codpie, min(peso) from pieza;

-----------------------------------------------


--Ejercicio 3.26 Encontrar el número de envíos con más de 1000 unidades.

select count(*) from ventas where cantidad>1000;

-----------------------------------------------

--Ejercicio 3.27 Mostrar el máximo peso.

select max(peso),codpie from pieza;
-----------------------------------------------


--Ejercicio 3.28 Mostrar el código de la pieza de máximo peso. 

select codpie from pieza where peso >= all (select peso from pieza);

----------------------------------------------


--Ventas totales por año

select to_char (fecha, 'yyyy'), sum(cantidad) from ventas group by to_char (fecha, 'yyyy');
-----------------------------------------------

--Ejercicio 3.35 Mostrar los nombres de proveedores tales que el total de sus ventas superen la cantidad de 1000 unidades.

select proveedor.nompro, sum(cantidad) from proveedor, ventas
where proveedor.codpro=ventas.codpro 
group by nompro 
having sum(cantidad) >1000;

----------------------------------------------

--Ejercicio 3.36 Mostrar para cada pieza la máxima cantidad vendida.

select codpie, max(cantidad) from  ventas  group by codpie ;

-----------------------------------------------

--Ejercicio 3.38 Encontrar la media de productos suministrados cada mes.

select avg(cantidad), to_char (fecha, 'mm') from ventas group by to_char (fecha, 'mm');

-----------------------------------------------

--Ejercicio 3.42 Mostrar los códigos de aquellos proveedores que hayan superado las ventas totales realizadas por el proveedor 'S1'.

select codpro,sum(cantidad) from ventas
group by codpro 
having (sum(cantidad)>(select sum(cantidad) from ventas where codpro='S1'));

-----------------------------------------------

--Ejercicio 3.43 Mostrar el mayor proveedores, entendiéndose como los que tienen mayores cantidades totales.

select codpro,sum(cantidad) from ventas 
group by codpro 
having sum(cantidad) >= all (select sum(cantidad) from ventas group by codpro); 

-----------------------------------------------

--Ejercicio 3.45 Encontrar aquellos proveedores que hayan hecho al menos 5 pedidos.

select codpro from ventas group by codpro having count(*)>=5;

-----------------------------------------------

--Ejercicio 3.49 Encontrar la cantidad media de piezas suministrada a aquellos proveedores que venden la pieza P3.

select codpro,avg(cantidad) from ventas  where (codpie='P3') group by codpro;

-----------------------------------------------

--Ejercicio 3.52 Mostrar para cada proveedor la media de productos suministrados cada año.

select codpro,avg(cantidad),to_char(fecha,'yyyy') from ventas 
group by(codpro, to_char(fecha,'yyyy'));

-----------------------------------------------

--Ejercicio 3.53 Encontrar todos los proveedores que venden una pieza roja.(una unica pieza)

select ventas.codpro from ventas,pieza 
where(pieza.color='Rojo' and ventas.codpie=pieza.codpie) 
group by (ventas.codpro) having count(*)=1;


-----------------------------------------------

--Ejercicio 3.56 Encontrar el nombre de aquellos proveedores que venden más de una pieza roja.

select  ventas.codpro  from ventas, pieza where (ventas.codpie=pieza.codpie and pieza.color='Rojo')
group by(codpro) having count(*)>1;

-----------------------------------------------

--Ejercicio 3.58  proveedores que solo suministran la pieza P1.

select  distinct codpro  from ventas where (codpie='P1')
minus
select  distinct codpro  from ventas where (codpie<>'P1');

-----------------------------------------------

DIVISION

--piezas vendidas por los mismos proveedores a todos los proyectos.

select codpro,codpie from ventas v1 where not exists (
(select codpj from proyecto)
minus
(select codpj from ventas v2 where 
v1.codpro=v2.codpro and v1.codpie=v2.codpie)
);

-----------------------------------------------


--Ejercicio 3.57 Encontrar todos los proveedores que vendiendo todas las piezas rojas cumplen la condición de que todas sus ventas son de más de 10 unidades.

select codpro from proveedor  where (
not exists(
(select codpie from pieza where color='Rojo')
minus
(select codpie from ventas  where proveedor.codpro=ventas.codpro
and not exists(select * from ventas where proveedor.codpro=ventas.codpro and cantidad>10)) 
)
);

-------------------------------------------------

--Ejercicio 3.55 Encontrar todos los proveedores tales que todas las piezas que venden son rojas. ( no que venda todas las piezas rojas)

select v1.codpro from ventas v1 where (
not exists (select * from ventas v2 where (v2.codpro=v1.codpro and codpie in ( select codpie from pieza where color<>'Rojo'))));


con diferencia:

select   ventas.codpro  from ventas, pieza where (ventas.codpie=pieza.codpie and pieza.color='Rojo')
minus
select   ventas.codpro from ventas, pieza where (ventas.codpie=pieza.codpie and pieza.color<>'Rojo');
-----------------------------------------------

--Ejercicio 3.11 Comprueba cuántas tuplas resultan del producto cartesiano aplicado a ventas y proveedor

Select count(*) from ventas, proveedor where (ventas.codpro=proveedor.codpro);

---------------------------------------------

--Ejercicio 3.15 Encontrar parejas de proveedores que no viven en la misma ciudad.

Select p1.codpro,p2.codpro from proveedor p1,proveedor p2 where (p1.codpro<>p2.codpro and p1.ciudad=p2.ciudad);

-----------------------------------------------

--Ejercicio 3.24 Encontrar los códigos de las piezas suministradas a todos los proyectos localizados en Londres.(DIVISION)

Select distinct v1.codpie from ventas v1 where not exists(
(select codpj from proyecto where ciudad='Londres')
Minus
(select codpj from ventas v2 where v2.codpie=v1.codpie)
);

-------------------------------------------------

--Ejercicio 3.30 Muestra los códigos de proveedores que han hecho más de 3 envíos diferentes. 

Select codpro from ventas group by codpro having count(*)>3;

-----------------------------------------------

--Ejercicio 3.31 Mostrar la media de las cantidades vendidas por cada código de pieza junto con su nombre. 

Select ventas.codpro,proveedor.nompro, avg(cantidad) from ventas,proveedor where (ventas.codpro=proveedor.codpro) group by (ventas.codpro,proveedor.nompro);

-------------------------------------------------

--Ejercicio 3.32 Encontrar la cantidad media de ventas de la pieza 'P1' realizadas por cada proveedor.

Select avg(cantidad),codpro from ventas where (codpie='P1') group by codpro;

-------------------------------------------------

--Ejercicio 3.33 Encontrar la cantidad total de cada pieza enviada a cada proyecto.

Select sum(cantidad), codpie,codpj from ventas group by (codpj,codpie);

-------------------------------------------------

--Ejercicio 3.41 Muestra todos tus objetos creados en el sistema. 

Select * from USER_OBJECTS;

-------------------------------------------------

--Ejercicio 3.46 Encontrar aquellos proveedores que venden todas las piezas suministradas por S1.

Select distinct  v1.codpro from ventas v1 where ( not exists (
(select codpie from ventas v3 where v3.codpro='S1')
Minus
(select codpie from ventas v2 where v2.codpro=v1.codpro)
)
); 

-------------------------------------------------

--Ejercicio 3.47 Encontrar la cantidad total de piezas que ha vendido cada proveedor que cumple la condición de vender todas las piezas suministradas por S1.

Select sum(v4.cantidad),v4.codpro from ventas v4 group by codpro having codpro in (
Select  v1.codpro from ventas v1 where ( not exists (
(select codpie from ventas v3 where v3.codpro='S1')
minus
(select codpie from ventas v2 where v2.codpro=v1.codpro)
)
)
);

-------------------------------------------------

--Ejercicio 3.48 Encontrar qué proyectos están suministrados por todos los proveedores que suministran la pieza P3.

Select  v1.codpj from ventas v1 where ( not exists (
(select codpro from ventas v3 where v3.codpie='P3')
minus
(select codpro from ventas v2 where v2.codpj=v1.codpj)
)
); 


------------------------------------------------

--Ejemplo 3.31 Muestra la información disponible acerca de los encuentros de liga.
select * from Encuentros;

-----------------------------------------------


--Ejemplo 3.32 Muestra los jugadores ordenados alfabéticamente y por equipos.

select * from Equipos,Jugadores where Equipos.codE=Jugadores.codE order by Equipos.nombreE;

-----------------------------------------------

--Ejemplo 3.33 Muestra los jugadores que no tienen ninguna falta.

select * from Jugadores where not exists (select  * from Faltas where Faltas.codJ=Jugadores.codJ);

-----------------------------------------------

--Ejemplo 3.34 Muestra los compañeros de equipo del jugador que tiene por código E52

select * from Jugadores where codE in (select codE from Jugadores where Jugadores.codJ='E52');

-----------------------------------------------

--Ejemplo 3.35 jugadores y localidad donde juegan (la de sus equipos)

select Jugadores.codJ , Equipos.localidad from Equipos,Jugadores whrere Equipos.codE=Jugadores.codE;


-----------------------------------------------
--Equipos que han jugado en casa con todos los equipos de Madrid.

select distinct E1.eq1 from Encuentros E1 where not exists
(
(Select codE from Equipos where localidad='Madrid')
minus
(select E2.eq2 from Encuentros E2 where (E2.eq1=E1.eq1))
);

-----------------------------------------------

--Jugadores que han jugado en todos los equipos entrenados por Manuel Gomez.


Select distinct codJ from Jugadores,Encuentros E1 where ( E1.eq1=jugadores.codE and not exists(
(select codE from Equipos where entrenador='Manuel Gomez')
Minus
(select eq2 from Encuentros E2 where (E2.eq1=E1.eq1))
)
);

---------------------------------------------

--Ejercicio 2.7 Módifica el esquema de la tabla ventas añadiendo un nuevo atributo llamado fechabaja de tipo date.

Alter table ventas add(fechabaja date);

---------------------------------------------

--Ejemplo 3.37 Muestra los equipos que han ganado algún encuentro en casa.

Select distinct eq1 from Encuentros where(res1>res2);
-------------------------------------------------

--Ejemplo 3.38 Muestra los equipos que han ganado algún encuentro.

Select eq1 from Encuentros where(res1>res2)
Union
Select eq2 from Encuentros where(res2>res1);

-------------------------------------------------

--Ejemplo 3.39 Muestra los equipos que han ganado todos los encuentros en casa.

select E1.eq1 from Encuentros E1 where( not exists (
(select codE from Equipos)
minus
(select E2.eq2 from Encuentros E2 where (E2.eq1=E1.eq1 and E2.res1>E2.res2))
)
);

-------------------------------------------------

--Ejemplo 3.40 Muestra los encuentros que faltan para terminar la liga.

Select eq1,eq2 from Encuentros where fecha>SYSDATE;

-------------------------------------------------
--Ejemplo 3.42 Para cada equipo muestra el número de encuentros de ida realizados.

Select count(*),eq1 from Encuentros group by eq1;

-------------------------------------------------	

--Ejemplo 3.43 Muestra los encuentros en los que se alcanzó mayor diferencia.

Select eq1,eq2, max(res1-res2) from Encuentros group by (eq1,eq2) having max(res1-res2) >= all 
(Select max(res1-res2) from Encuentros group by (eq1,eq2));


-------------------------------------------------

--Ejemplo 3.44 Muestra los jugadores que no han superado 10 faltas acumuladas.

Select codJ from Faltas group by codJ having sum(num)<10;

-------------------------------------------------




--Ejemplo 3.46 Muestra las victorias de cada equipo, tanto de ida como de vuelta.

Select eq1,res1,res2 from Encuentros where(res1>res2)
union
Select eq2,res2,res1 from Encuentros where(res2>res1);


-----------------------------------------------

-- 3.9 	Ciudades de la base de datos con UNION


(SELECT ciudad FROM proyecto) UNION (SELECT ciudad FROM proveedor) UNION (SELECT ciudad FROM pieza);


-----------------------------------------------

-- 3.10 Ciudades de la base de datos con UNION ALL

(SELECT ciudad FROM proyecto) UNION ALL (SELECT ciudad FROM proveedor) UNION ALL (SELECT ciudad FROM pieza);


-----------------------------------------------

-- 3.50 Nombres de tus indices y sobre qué tablas están montados. Además indicar el propietario

SELECT index_name,table_name,table_owner FROM USER_INDEXES;

-----------------------------------------------


-- 3.51 Implementar el comendo describe para tu tabla ventas a través de las consultas del catálogo

SELECT column_name,nullable,data_type,data_length FROM USER_TAB_COLUMNS WHERE table_name='VENTAS';

-----------------------------------------------

-- 4.1 	Crear una vista con los proveedores de Londres. ¿Qué sucede si insertamos en dicha vista la tupla  ('S7','Jose Suarez',3,'Granada')?.	

CREATE VIEW prov_londres AS (SELECT * FROM proveedor WHERE ciudad='Londres');

INSERT INTO prov_londres VALUES('S7','Jose Suarez',3,'Granada');
	-- Nos inserta la fila en la tabla proveedor, pues la estructura coincide con la de la tabla. Si hubiesemos creado la
	
-----------------------------------------------
-- 4.2 	Crear una vista con los nombres de los proveedores y sus ciudades. Inserta sobre ella una fila y explica
--	cuál es el problema que se plantea. ¿Habría problemas de actualización?

CREATE VIEW prov_ciu AS (SELECT nompro,ciudad FROM proveedor);

INSERT INTO prov_ciu VALUES('S8','Mariano Palomo',3,'Granada');

-----------------------------------------------

-- 4.3 	Crear una vista donde aparezcan el código de proveedor, el nombre de proveedor y el código del proyecto tales que la pieza sumistrada sea gris. Sobre esta vista realiza alguna consulta y enumera todos los motivos por los que sería imposible realizar una inserción.

CREATE VIEW prov_pj_piegris AS SELECT ventas.codpro,proveedor.nompro,ventas.codpj FROM proveedor,pieza,ventas 
WHERE(proveedor.codpro=ventas.codpro and pieza.codpie=ventas.codpie and pieza.color='Gris');

-------------------------------------------------
Ejemplo 3.49 Muestra el equipo con mayor número de canastas en total de los encuentros jugados.

Select eq1,max(res1) from encuentros group by (eq1) having max(res1) >= all (select max(res1) from encuentros group by (eq1));

-------------------------------------------------

