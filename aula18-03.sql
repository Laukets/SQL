create database ecommerce;

create table produto
(
CodProduto int primary key not null,
DescProduto varchar(50) not null,
QtdEstoque int
);

create table cliente
(
CodCliente int primary key not null,
NomeCliente varchar(50) not null,
DataCadastro date not null,
Contato varchar(50)
);

create table estado
(
CodEstado smallint primary key not null,
NomeEstado varchar(40) not null
);

create table cidade
(
CodCidade smallint primary key not null,
NomeCidade varchar(50) not null,
CodEstado smallint
);



create table tpendereco
(
CodTpEnder smallint primary key not null,
DescrTpEnder varchar(50) not null
);

create table endereco
(
CodLocalidade int primary key not null,
Rua varchar(50),
Bairro varchar(20),
Numero varchar(10),
Complemento varchar(20),
NumCelular int,
CodTpEnder smallint,
CodCidade smallint
);

alter table endereco change NumCelular NumCelular varchar(12);

create table pedido
(
CodPedido int primary key not null,
DataPedido date,
VrTotalPedido decimal(14,2),
CodCliente int
);

create table itempedido
(
QtItemPedido smallint,
VrUnitaItem decimal(8,2),
CodPedido int,
CodProduto int,
primary key (CodPedido, CodProduto)
);

alter table cidade add constraint fkestcid foreign key (CodEstado) references estado (CodEstado);

alter table endereco add constraint fktpeend foreign key (CodTpEnder) references tpendereco (CodTpEnder);

alter table endereco add constraint fkcidend foreign key (CodCidade) references cidade (CodCidade);

alter table itempedido add constraint fkproite foreign key (CodProduto) references produto (CodProduto);

alter table itempedido add constraint fkpedite foreign key (CodPedido) references pedido (CodPedido);

alter table pedido add constraint fkcliped foreign key (CodCliente) references cliente (CodCliente);


insert into produto
(CodProduto, DescProduto, QtdEstoque)
values
(0001, 'parafuso', 5000);

select * from produto;

insert into cliente
(CodCliente, NomeCliente, DataCadastro, Contato)
values
(0001, 'manoel', '2021-03-18', 'manoel@hotmail.com');

select * from cliente;

insert into pedido
(CodPedido, DataPedido, VrTotalPedido, CodCliente)
values
(0001, '2021-03-18', '5000.38', 0001);

select * from pedido;

insert into itempedido
(QtItemPedido, VrUnitaItem, CodPedido, CodProduto)
values
(500, '20.4', 0001, 0001);

select * from itempedido;

insert into produto
(CodProduto, DescProduto, QtdEstoque)
values
(0002, 'camiseta preta', 5000);

insert into cliente
(CodCliente, NomeCliente, DataCadastro, Contato)
values
(0002, 'paula', '2021-03-18', 'paula@hotmail.com');

insert into pedido
(CodPedido, DataPedido, VrTotalPedido, CodCliente)
values
(0002, '2021-03-18', 3000.85, 0002);

insert into itempedido
(QtItemPedido, VrUnitaItem, CodPedido, CodProduto)
values
(100, '5.85', 0002, 0002);