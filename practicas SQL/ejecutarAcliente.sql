-- Para adicionar una columna o atributo:
ALTER TABLE cliente ADD COLUMN estado CHAR(30);
-- Para renombrar una columna:
ALTER TABLE cliente RENAME COLUMN estado TO cliestado;
--Para eliminar una columna:
ALTER TABLE cliente DROP COLUMN cliestado;

--metiendo datos a la tabla cliente
INSERT INTO cliente VALUES (111, 'Juan Perez', 'Avenida Bolivar', 'M', 2000);
INSERT INTO cliente VALUES (222, 'Rosa  Mendez','Calle Camacho', 'F', 500);
INSERT INTO cliente VALUES (333, 'Luis Casas', 'Avenida Bolivar', 'M',200 );
INSERT INTO cliente VALUES (444, 'Ana Cosio', 'Calle Peru', 'F',3000 );
SELECT * from cliente --para mostrar

--creando tablas y sus atributos 
create table cliente2(
  clici integer PRIMARY KEY,
  clinombre char(30) not null,
  clidireccion char(30) not null,
  clisexo char(1) not null,
  clilimitec integer   
);
create table cliente3(
  clici integer PRIMARY KEY,
  clinombre char(30) not null,
  clidireccion char(30) not null,
  clisexo char(1) not null,
  clilimitec integer   
);
--este tiene dos tuplas (temporal)(una linea, fila eso es una tupla)
INSERT INTO cliente2 VALUES (111, 'Juan Perezcliente2', 'Avenida Bolivar', 'M', 2000);
INSERT INTO cliente2 VALUES (222, 'Rosa  Mendez','Calle Camacho', 'F', 500);

INSERT INTO cliente3 VALUES (333, 'Luis Casas', 'Avenida Bolivar', 'M',200 );
INSERT INTO cliente3 VALUES (444, 'Ana Cosio', 'Calle Peru', 'F',3000 );

SELECT * from cliente3
--para eliminar la tabla 
drop table cliente2; --este borra la tabla mas contenido
delete from unidadmedida;--este solo borra el contenido 
/*************************************metiendo datos a todas las tablas******************************************/
INSERT INTO cliente VALUES (111, 'Juan Perez', 'Avenida Bolivar', 'M', 2000);
INSERT INTO cliente VALUES (222, 'Rosa  Mendez','Calle Camacho', 'F', 500);
INSERT INTO cliente VALUES (333, 'Luis Casas', 'Avenida Bolivar', 'M',200 );
INSERT INTO cliente VALUES (444, 'Ana Cosio', 'Calle Peru', 'F',3000 );
SELECT * from cliente --para mostrar

iNSERT INTO unidadmedida VALUES(200,'metros', 'mts');
INSERT INTO unidadmedida VALUES(201,'unidad', 'und');
INSERT INTO unidadmedida VALUES(202,'paquete', 'paq');
SELECT * from unidadmedida

INSERT INTO vendedor VALUES(7777,'Pedro Romero',300,'M');
INSERT INTO vendedor VALUES(8888,'Carlos Perez',20,'M');
INSERT INTO vendedor VALUES(3333,'Luis Casas',10,'M');
INSERT INTO vendedor VALUES(9999,'Maria Torrez',200,'F');
INSERT INTO vendedor VALUES(5555,'Fatima  Lopez',150,'F');
select * from vendedor

INSERT INTO notaventa VALUES(1, '2014-02-01', 50, 111, 8888);
INSERT INTO notaventa VALUES(2, '2014-02-01', 60, 333, 7777);
INSERT INTO notaventa VALUES(3, '2014-03-03', 700, 111, 9999);
INSERT INTO notaventa VALUES(4, '2014-08-20', 240, 111, 8888);
INSERT INTO notaventa VALUES(5, '2014-08-20', 1000, 111, 3333);
SELECT * from notaventa

INSERT INTO producto VALUES(1000,'Teclado',90,201);
INSERT INTO producto VALUES(1001,'Mouse',50,201);
INSERT INTO producto VALUES(1002,'Cable UTP Cat-5',5,200);
INSERT INTO producto VALUES(1003,'Case',150,201);
INSERT INTO producto VALUES(1004,'Monitor',800,201);
select * from producto

INSERT INTO detalleventa VALUES(1,1001,1,50);
INSERT INTO detalleventa VALUES(2,1001,1,50);
INSERT INTO detalleventa VALUES(2,1002,2,5);
INSERT INTO detalleventa VALUES(3,1004,1,700);
INSERT INTO detalleventa VALUES(4,1000,1,90);
INSERT INTO detalleventa VALUES(4,1003,1,150);
INSERT INTO detalleventa VALUES(5,1000,1,90);
select * from detalleventa 


/******************************segundo archivo******************************/
-- Otra forma de mostrar todas las tuplas (selecsiona ambas lineas)
SELECT cliente.clici, cliente.clinombre, cliente.clidireccion,cliente.clisexo, cliente.clilimitec
FROM cliente ;
--Renombrar y mostrar (cliente se renombra por  c)( con esto solo se mostrara lo que tu quieres)
SELECT c.clici, c.clinombre
FROM cliente c;
select * from cliente 
--ordenar de forma ascendente 
SELECT *  FROM cliente ORDER BY clici;  --lo ordena de forma ascendente
SELECT clici,clinombre  FROM cliente ORDER BY clinombre DESC;--descendente

--Listar una tupla específica del cliente donde su código es 111 y se quiere mostrar solo su código, nombre y sexo:
SELECT clici, clinombre, clisexo FROM cliente WHERE clici=111
--Borrar una tupla a la tabla cliente:
DELETE FROM cliente WHERE clici=444;
--Listar tuplas especificas de cliente usando condiciones >,<;<=;>=
SELECT * FROM cliente WHERE clici >250 --(solo se mostrara las tuplas mayores a 250)
--Listar todos los clientes que son de sexo Femenino:
SELECT * FROM cliente WHERE clisexo =  'F '
--Listar todos los clientes que son de sexo Masculino y tienen un limite de credito superior a 1000:
SELECT * FROM cliente WHERE clisexo =  'M '  and  clilimitec > 1000;
--Listar todos los productos que comienzan con ‘C’
SELECT * FROM producto WHERE prodescripcion LIKE 'C%'
--Listar todos los productos que contiene el carácter ‘a’
SELECT * FROM producto WHERE prodescripcion LIKE '%a%'
-- Calcular el número total de clientes
SELECT COUNT(*) AS totalcliente FROM cliente
--Mostrar el código, nombre y la unidad de medida del producto:
SELECT procodigo, prodescripcion,unidescripcion
FROM producto, unidadmedida 
WHERE producto.uniid=unidadmedida.uniid;