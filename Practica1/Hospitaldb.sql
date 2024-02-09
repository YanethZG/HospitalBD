create database Hospital
use Hospital

create table Departamentos(
DepartamentoId int identity(1,1) primary key not null,
Nombre varchar(50) not null,
)

create table Personal(
PersonalId int identity(1,1) primary key not null,
DepartamentoId int not null,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Telefono varchar(15) not null,
Dui varchar(10) unique not null,
Cargo varchar(50) not null,
Tipo varchar(50) not null,

constraint Fk_PersonalDepartamento foreign key (DepartamentoId) references Departamentos(DepartamentoId)
)

create table Pacientes(
PacienteId int identity(1,1) primary key not null,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Sexo varchar(1) CHECK (Sexo in ('F', 'M')),
TipoSangre varchar(50) not null,
Telefono varchar(15) not null,
FechaNacimiento date not null,
Direccion varchar(150) not null,
)

create table Consultas(
ConsultaId int identity(1,1) primary key not null,
PacienteId int not null,
PersonalId int not null,
FechaConsulta datetime not null,
Motivo varchar(200) not null,
Notas varchar(100),

constraint Fk_PacienteConsulta foreign key (PacienteId) references Pacientes(PacienteId), 
constraint Fk_PersonalConsulta foreign key (PersonalId) references Personal(PersonalId)
)

create table Procedimientos(
ProcedimientoId int identity(1,1) primary key not null,
PacienteId int not null,
PersonalId int not null,
ProcedimientoFecha datetime not null,
ProcedimientoTipo varchar(75) not null,
Notas varchar(100),

constraint Fk_PacientesProcedimiento foreign key (PacienteId) references Pacientes(PacienteId),
constraint Fk_PersonalProcedimiento foreign key (PersonalId) references Personal(PersonalId)
)

create table Medicamentos(
MedicamentoId int identity(1,1) primary key not null,
Nombre varchar(50) not null,
Marca varchar(50) not null,
Descripcion varchar(100) not null,
FechaExpiracion date,
)

create table Tratamientos(
TratamientoId int identity(1,1) primary key not null,
ConsultaId int not null,
MedicamentoId int not null,
Dosis varchar(30) not null,
Duracion varchar(20) not null,
Notas varchar(100),

constraint Fk_ConsultasTratamientos foreign key (ConsultaId) references Consultas(ConsultaId),
constraint Fk_MedicamentosTratamientos foreign key (MedicamentoId) references Medicamentos(MedicamentoId)
)

create table Diagnosticos(
DiagnosticoId int identity(1,1) primary key not null,
ConsultaId int not null,
Nombre varchar(100) not null,
Descripcion varchar(200) not null,

constraint Fk_ConsultasDiagnosticos foreign key (ConsultaId) references Consultas(ConsultaId)
)

insert into Departamentos (Nombre) values ('Departamento de Emergencias'), ('Departamento de Radiologia')

insert into Pacientes (Nombre, Apellido, Sexo, TipoSangre, Telefono, FechaNacimiento, Direccion) 
	values ('Jonas', 'Garcia', 'M', 'A Positivo', '7725-6663', '1999-08-05', 'San Miguel, San Miguel'),
			('Karla', 'Granados', 'F', 'A Positivo', '72063460', '1999-08-13', 'San Miguel, San Miguel')

insert into Personal (DepartamentoId, Nombre, Apellido, Telefono, Dui, Cargo, Tipo) 
	values (1, 'Maria', 'Lozano', '7890-0987', '05896785-8', 'Doctora', 'Personal Medico'),
			 (1, 'Edinson', 'Jurado', '7765-4321', '04325467-9', 'Enfermero', 'Personal Medico')

insert into Consultas (PacienteId, PersonalId, FechaConsulta, Motivo, Notas) 
	values (1,1, '2024-02-12 04:00:00 ', 'Estornudo Mucho', ''),
			(2,1, '2024-02-23 02:00:00 ', 'Migraña', '')

insert into Diagnosticos (ConsultaId, Nombre, Descripcion) 
	values (1, 'Gripe Viral', 'Presenta moquera'),
			(2, 'Golpe de Calor', 'Fuertes dolores de cabeza por la temperatura')

insert into Medicamentos (Nombre, Marca, Descripcion, FechaExpiracion)
	values ('Acetaminofen', 'Baller', 'Pastillas 8 unidades', '2030-01-03'),
			('Virogrip', 'Baller', '2 Unidades', '2032-03-05')

insert into	Tratamientos (ConsultaId, MedicamentoId, Dosis, Duracion)
	values (1,2, '1 Cada 8 Horas', '1 Semana'),
			(2,2, '1 cada 12 horas', '7 dias')

insert into Procedimientos (PacienteId, PersonalId, ProcedimientoFecha, ProcedimientoTipo, Notas)
	values (1,2, '2024-02-18 01:00:00 ', 'Examen de Sangre', ''),
			(2,1, '2024-02-19 03:00:00 ', 'Radiografia', '')


