--******preguntas examen con el auxiliar
--1)mostrar el nombre del producto ,nombre de unaidad de medida, y el producto
--de la unidad de ID 1000
select p.prodescripcion, um.unidescripcion
FROM producto p, unidadmedida um
WHERE p.procodigo=1000
and p.uniid=um.uniid

--2)mostrar el numero de ventas, el name del cliente y monto total del cliente que
--gasto mas de 600
select nv.vennumero , c.clinombre,nv.venmonto
FROM notaventa nv,cliente c
where nv.clici=c.clici
and nv.venmonto >'600';

--3)mostrar el name la cliente y vendedor de la fecha 3 marzo(3) 
--2014(tambien mostrar)
SELECT c.clinombre,v.vndnombre, nv.venfecha
from cliente c,vendedor v,notaventa nv
where nv.venfecha='2014-03-03'
and nv.clici=c.clici
and nv.vndcodigo=v.vndcodigo;

--4)mostrar el name del cliente, el prducto que compro, la cantidad y el nombre
--del vendedor
select c.clinombre, p.prodescripcion, dv.detcantidad,v.vndnombre 
from cliente c,detalleventa dv, producto p,vendedor v, notaventa nv
where dv.procodigo=p.procodigo
and dv.vennumero=nv.vennumero;

--5-fotos)mostrar el nombre del vendedor y el numero de venta que atendio
select v.vndnombre,nv.vennumero
from vendedor v,notaventa nv
where v.vndcodigo=nv.vndcodigo

--6)mostrar el nombre de cada producto y su unidad de medida, pero solo si el nombre 
--del productocomieza con "c"
select p.prodescripcion, u.unidescripcion
from producto p, unidadmedida u
where u.uniid=p.uniid
and p.prodescripcion like 'C%';
--7)mostrar el nombre del cliente, el numero de nota de venta y el nombre del 
--vendedor, pero solo si el cliente es de sexo masculino
select c.clinombre, nv.vennumero, v.vndnombre
from cliente c, notaventa nv,vendedor v
where v.vndcodigo=nv.vndcodigo
and c.clici=nv.clici
and c.clisexo='M';
--8)Mostrar el nombre del cliente y la cantidad total de productos que han comprado
SELECT c.clinombre, SUM(dv.detcantidad) AS total_productos
FROM cliente c, notaventa nv, detalleventa dv, producto p
WHERE c.clici = nv.clici
  AND nv.vennumero = dv.vennumero
  AND dv.procodigo = p.procodigo
GROUP BY c.clinombre


--)por si pide crear una tabla abc y hacerle un backup
--)otra clase antes del examen 
--)1 nombre del cliente con sus notas registadas con su monto 
SELECT c.clinombre, nv.vennumero, nv.venmonto 
from cliente c, notaventa nv
where c.clici=nv.clici;
--2)notas de ventas con nombre del cliente y nombre del vendedor, numero de
--venta y su monto
SELECT nv.vennumero, c.clinombre, v.vndnombre, nv.venmonto
from cliente c, notaventa nv, vendedor v
where c.clici=nv.clici
and v.vndcodigo=nv.vndcodigo;
--3) detalle completo de ventas: cliente, producto, unidad de medida y cantidad
SELECT c.clinombre, p.prodescripcion, u.unidescripcion, dv.detcantidad
from notaventa nv, cliente c, producto p, unidadmedida u, detalleventa dv
where u.uniid=p.uniid
and dv.procodigo=p.procodigo
and dv.vennumero=nv.vennumero
and c.clici=nv.clici;
--4)crear 2 tablas de muchos a muchos llamada estudiante y curso, para la tabla
-- estudiantes*******************************************************************
 create table ESTUDIANTE(
  estudiante_ID integer PRIMARY KEY,
  est_nombre char(50) not null  
);
--curso
 create table CURSO(
  curso_ID integer PRIMARY KEY,
  curso_nombre char(50) not null    
);
create table ESTUDIANTE_CURSO(
  estudiante_ID integer not null,
  curso_ID integer not null,
  Fecha_inscripcion integer not null,
  PRIMARY KEY (estudiante_ID,curso_ID),
  FOREIGN KEY (estudiante_ID ) references ESTUDIANTE(estudiante_ID ),
  FOREIGN KEY (curso_ID) references CURSO(curso_ID)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
SELECT*from ESTUDIANTE_CURSO;
drop table CURSO; 
--5)contar cuantos clientes y femeninos hay 
SELECT c.clisexo, count(*) as total 
from cliente c
where c.clisexo='M'
GROUP BY c.clisexo;

--6)mostrar cliente con mas limite de credito
SELECT c.clinombre, c.clilimitec
from cliente c
where c.clilimitec = ( SELECT max(clilimitec)
from cliente);

--7) producto mas barto
SELECT p.prodescripcion, p.proprecio
FROM producto p
WHERE proprecio = (
  SELECT MIN(proprecio)
  FROM producto
);

--para aniadir una nueva columna                                                                                                                                                                              -- Para adicionar una columna o atributo:
ALTER TABLE cliente ADD COLUMN estado CHAR(30);
-- Para renombrar una columna:
ALTER TABLE cliente RENAME COLUMN estado TO cliestado;
--Para eliminar una columna:
ALTER TABLE cliente DROP COLUMN cliestado;

--***********************************************examen Final************************************
--1)
alter TABLE unidadmedida add COLUMN observaciones char(15);
SELECT*from unidadmedida;
--2)
SELECT nv.vennumero,c.clinombre, nv.venfecha, nv.vndcodigo, c.clisexo
from cliente c, notaventa nv
where nv.vennumero='4'
and c.clici=nv.clici;
--3)
SELECT p.procodigo, u.uniabrev, p.prodescripcion
from unidadmedida u, producto p
where u.uniid=p.uniid;
--4)
SELECT dv.detcantidad, nv.venfecha, p.procodigo, p.prodescripcion,nv.vennumero
from producto p, vendedor v,notaventa nv, detalleventa dv
where  nv.vennumero='2'
and dv.vennumero=nv.vennumero
and dv.procodigo=p.procodigo
and v.vndcodigo=nv.vndcodigo