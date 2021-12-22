create database venda;

drop database venda;

create table cliente
(
CodigoCliente int primary key not null,
Nome varchar(50) not null,
Logradouro varchar(50) not null,
Numero varchar(8) not null,
Bairro varchar(50) not null,
CEP char(8) not null,
Cidade varchar(20),
UF char(2),
CNPJ char(14) not null,
IE varchar(20)
);

ALTER TABLE cliente change Nome NomeCliente varchar(50);

create table produto
(
CodigoProduto int primary key not null,
NomeProduto varchar(50) not null,
PrecoUnitario decimal(8,2),
QuantidadeEstoque int
);

create table vendedor
(
CodigoVendedor int primary key not null,
NomeVendedor varchar(50) not null,
SalarioFixo decimal(7,2)
);

create table pedido
(
CodigoPedido int primary key not null,
DataPedido date,
DataEntrega date,
CodigoVendedor int,
CogidoCliente int
);

ALTER TABLE pedido change CogidoCliente CodigoCliente int;

create table itempedido
(
CodigoProduto int,
CodigoPedido int,
Quantidade int,
primary key (CodigoProduto, CodigoPedido)
);

ALTER TABLE pedido ADD CONSTRAINT fkcliped FOREIGN KEY (CodigoCliente) references cliente (CodigoCliente);

alter table pedido add constraint fkvenped foreign key (CodigoVendedor) references vendedor (CodigoVendedor);

alter table itempedido add constraint fkproite foreign key (CodigoProduto) references produto (CodigoProduto);

alter table  itempedido add constraint fkpedite foreign key (CodigoPedido) references pedido (CodigoPedido);

