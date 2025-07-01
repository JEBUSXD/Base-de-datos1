--01 de 03
create table Universidad(
	Nun_matricula integer PRIMARY KEY 
	Nombre char(30) not null,
	Direccion char(30) not null,
	Anio_creacion integer
);

create table Facultad(
	Nun_matricula integer,
	ID_facultad integer,
	nombre char(30) not null,
	ubicacion char(30) not null,
	Num_estudiante integer
	Fecha_creacion date not null,
	PRIMARY KEY (Nun_matricula,ID_facultad),
	FOREIGN KEY (Nun_matricula) references Universidad(Nun_matricula),
	ON DELETE CASCADE
    ON UPDATE CASCADE  
);

create table Especialidades(
	Nun_matricula integer,
	ID_facultad integer,
	ID_especialidad char(30) not null,
	nombre char(30) not null,
	Tiempo_duracion char(30) not null,
	Fecha_creacion date not null,
	PRIMARY KEY (Nun_matricula,ID_facultad,ID_especialidad),
	FOREIGN KEY (Nun_matricula,ID_facultad) references Facultad(Nun_matricula,ID_facultad),
	ON DELETE CASCADE
    ON UPDATE CASCADE
);