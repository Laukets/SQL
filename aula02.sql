create database vendas2;

create table clientes
(
CodigoCliente int primary key not null,
Nome varchar (50) not null,
Logradouro varchar (50) not null,
Numero varchar (8) not null,
Bairro varchar (50) not null,
CEP char (8) not null,
Cidade varchar (20),
UF char(2),
CNPJ char (14) not null,
IE varchar (20)
);

alter table clientes change Nome NomeCliente varchar (50);

drop table clientes;

create table produtos
(
CodigoProduto int primary key not null,
NomeProduto varchar (50) not null,
PrecoUnitario decimal (10,2) not null,
QuantEstoque int
);

drop table produtos;

create table vendedores
(
CodigoVendedor int primary key not null,
NomeVendedor varchar (50) not null,
SalarioFixo decimal (10,4) not null
);

drop table vendedores;

create table pedidos
(
CodigoPedido int primary key not null,
DataPedido date,
DataEntrega date,
CodigoVendedor int,
CodigoCliente int
);

ALTER TABLE pedidos ADD CONSTRAINT fkclieped FOREIGN KEY (CodigoCliente) REFERENCES clientes (CodigoCliente);

ALTER TABLE pedidos ADD CONSTRAINT fkvendped FOREIGN KEY (CodigoVendedor) REFERENCES vendedores (CodigoVendedor);

create table item_pedidos
(
CodigoProduto int,
CodigoPedido int,
Quantidade int,
primary key (CodigoProduto, CodigoPedido)
);

ALTER TABLE item_pedidos ADD CONSTRAINT fkprodped FOREIGN KEY (CodigoProduto) REFERENCES produtos (CodigoProduto);

alter table item_pedidos drop foreign key fkprodped;

ALTER TABLE item_pedidos ADD CONSTRAINT fkpeditem FOREIGN KEY (CodigoPedido) REFERENCES pedidos (CodigoPedido);

ALTER TABLE item_pedidos ADD CONSTRAINT fkproditem FOREIGN KEY (CodigoProduto) REFERENCES produtos (CodigoProduto);