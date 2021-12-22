insert into cliente
(CodCliente, NomeCliente, DataCadastro, Contato)
values
(3456, 'ludwig mozart', '2017-05-03', 'amazon@hotmail.com');

select * from cliente;

insert into pedido
(CodPedido, DataPedido, VrTotalPedido, CodCliente)
values
(0500, '2019-10-19', '45770.30', 0002);

select * from pedido;

insert into produto
(CodProduto, DescProduto, QtdEstoque)
values
(1020, 'tenis nike', 150);

insert into itempedido
(QtItemPedido, VrUnitaItem, CodPedido, CodProduto)
values
(01, '358.90', 0300, 3010);

select * from produto;

insert into estado
(CodEstado, NomeEstado)
values
(5, 'Goias');

select * from estado;

insert into cidade
(CodCidade, NomeCidade, CodEstado)
values
(5000, 'Santos', 1);

select * from cidade;

insert into tpendereco
(CodTpEnder, DescrTpEnder)
values
(5, 'rodovia');

select * from tpendereco;

insert into endereco
(CodLocalidade, Rua, Bairro, Numero, Complemento, CodTpEnder, CodCidade)
values
(345678, 'duarte de azevedo', 'santana', 05, 'cj 2', 2, 1000);

select * from cidade;

update cliente
set Contato = 'edson@hotmail.com'
where CodCliente = 2345
;

select * from cliente;

update pedido
set DataPedido = '2021-05-10'
where CodPedido = 300
;

select * from pedido;

update estado
set NomeEstado = 'SP'
where CodEstado = 1
;

select * from estado;

update estado
set NomeEstado = 'São Paulo'
where CodEstado = 1
;