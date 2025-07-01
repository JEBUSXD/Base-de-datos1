--Esto fue resultado del mapeo
--01 tiene 6 tablas
create table cliente(
  clici integer PRIMARY KEY,	--cliCI va a recibir datos de tipo 'int' y es primary key
  clinombre char(30) not null,	--'char(30)' significa que tendra un maximo de 30 caracteres
  clidireccion char(30) not null,--'not null'no puede dejarlo en blanco,es para que el usuario si o si meta su nombre 
  clisexo char(1) not null,		
  clilimitec integer 			--ojo con el ultimo atributo, no se necesita cerrar con 'coma'
  );							--y todo esto en parentesis
--02
create table vendedor(
  vndcodigo integer PRIMARY KEY,
  vndnombre char(30) not null,
  vndcomision integer not null,
  vndsexo char(1) not null   
);
--03
create table notaventa(
  vennumero integer PRIMARY KEY,
  venfecha date not null,
  venmonto integer not null,
  clici integer not null,--mas arriba dijimos que es una PRIMARY KEY (cliente)
  vndcodigo integer not null,--este tambien es PRIMARY KEY (vendedor)
  --entoces lo agarramos y decimos que es una FOREING KEY
  FOREIGN KEY (clici) references cliente(clici),--cliCI (cliente) ahora es FOREING KEY
  FOREIGN KEY (vndcodigo) references vendedor(vndcodigo)
  ON DELETE CASCADE --no especifica bien la ing
  ON UPDATE CASCADE
);
--04
create table unidadmedida(
  uniid integer PRIMARY KEY,
  unidescripcion char(50) not null,
  uniabrev char(3) not null
);
--05
create table producto(
  procodigo integer PRIMARY KEY,
  prodescripcion char(50) not null,
  proprecio integer,
  uniid integer not null,
  FOREIGN KEY (uniid) references unidadmedida(uniid)
  ON DELETE CASCADE
  ON UPDATE CASCADE      
);
--06
create table detalleventa(
  vennumero integer not null,
  procodigo integer not null,
  detcantidad integer not null,
  detprecio integer not null,
  PRIMARY KEY (vennumero,procodigo),--este es de muchos a muchos 
  FOREIGN KEY (vennumero) references notaventa(vennumero),
  FOREIGN KEY (procodigo) references producto(procodigo)
  ON DELETE CASCADE
  ON UPDATE CASCADE   
);
