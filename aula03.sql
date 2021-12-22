create database rh;

drop database rh;

create table departamentos
(
CodigoDepartamento smallint primary key not null,
NomeDepartamento varchar (50) not null
);

create table tarefas
(
CodigoTarefa smallint primary key not null,
NomeTarefa varchar (50) not null
);

create table empregados
(
CPFEmpregado bigint primary key not null,
NomeEmpregado varchar (50) not null,
DataNascimento date,
RG char (9) not null,
Rua varchar(60),
Numero varchar (10),
CEP char (8),
Bairro varchar (50),
Cidade varchar (50),
UF char (2),
CodigoDepartamento smallint
);

create table projetos
(
CodigoProjeto int primary key not null,
NomeProjeto varchar (60),
DataInicio date,
DataPrevisaoFim date,
CodigoDepartamento smallint
);

create table alocacao
(
CodigoTarefa smallint not null,
CPFEmpregado bigint not null,
CodigoProjeto int not null,
DataAlocacao date,
DataFimAlocacao date,
primary key (CodigoTarefa, CPFEmpregado, CodigoProjeto)
);

drop table alocacao;

ALTER TABLE empregados ADD CONSTRAINT fkdepemp FOREIGN KEY (CodigoDepartamento) REFERENCES departamentos (CodigoDepartamento);

ALTER TABLE projetos ADD CONSTRAINT fkdeppro FOREIGN KEY (CodigoDepartamento) REFERENCES departamentos (CodigoDepartamento);

ALTER TABLE alocacao ADD CONSTRAINT fktaralo FOREIGN KEY (CodigoTarefa) REFERENCES tarefas (CodigoTarefa);

ALTER TABLE alocacao ADD CONSTRAINT fkempalo FOREIGN KEY (CPFEmpregado) REFERENCES empregados (CPFEmpregado);

ALTER TABLE alocacao ADD CONSTRAINT fkproalo FOREIGN KEY (CodigoProjeto) REFERENCES projetos (CodigoProjeto);