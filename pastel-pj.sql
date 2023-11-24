
CREATE DATABASE Pastelaria;
USE Pastelaria;

CREATE TABLE cliente(
id_cliente int primary key auto_increment,
nome_completo varchar(100),
nome_preferido varchar(50),
cpf VARCHAR(14) unique,
data_nascimento date,
telefone int(15),
email varchar(100),
bairro varchar(100),
cidade varchar(50),
estado varchar(2)
);
CREATE TABLE pasteis(
id_pastel int primary key auto_increment,
nome varchar(100),
preco decimal(8,2),
tamanho varchar(2),
categoria varchar(20)
);
CREATE TABLE recheio(
id_recheio int primary key auto_increment,
nome varchar(50)
);
CREATE TABLE pedidos(
id_pedido int primary key auto_increment,
data_pedido date,
id_cliente int not null,
forma_pagamento varchar(20),
foreign key(id_cliente) references cliente(id_cliente)
);
CREATE TABLE itens_pedido(
id_item int primary key auto_increment,
id_pedido int not null,
id_produto int not null,
quantidade int not null,
foreign key(id_pedido)references pedidos(id_pedido),
foreign key(id_produto)references produto(id_produto)
);
CREATE TABLE produto(
id_produto int primary key auto_increment,
nome varchar(50),
preco decimal(8,2),
volume varchar(20),
tipo varchar(20)
);


DELIMITER //

CREATE PROCEDURE AdicionarCliente(
    IN nome_completo VARCHAR(100),
    IN nome_preferido VARCHAR(50),
    IN cpf VARCHAR(14),
    IN data_nascimento DATE,
    IN telefone VARCHAR(15),
    IN email VARCHAR(100),
    IN bairro VARCHAR(50),
    IN cidade VARCHAR(50),
    IN estado VARCHAR(2)
)
BEGIN
    INSERT INTO cliente (nome_completo,nome_preferido,cpf,data_nascimento,telefone,email,bairro,cidade,estado) 
    VALUES (nome_completo,nome_preferido,cpf,data_nascimento,telefone,email,bairro,cidade,estado);
END  //
DELIMITER ;
CALL AdicionarCliente('Rodigo da Silva', 'Rodrigo', '123.456.789-01', '2005-05-09', '123456789', 'rodrigo@email.com', 'humildes', 'FSA', 'BA');
CALL AdicionarCliente('Carlos henrique', 'Carlos', '345.609.456-01', '2003-08-03', '750304859', 'carlos@email.com', 'Aviario', 'FSA', 'BA');
CALL AdicionarCliente('Yasmin nere', 'Yasmin', '503.987.545-01', '2004-03-14', '75395030', 'carlos@email.com', 'feira 7', 'FSA', 'BA');
select*from cliente;

DELIMITER //
CREATE PROCEDURE AdicionarPastel(
    IN nome VARCHAR(100),
    IN preco DECIMAL(8,2),
    IN tamanho VARCHAR(2),
    IN categoria VARCHAR(20)
)
BEGIN
    INSERT INTO pasteis (nome, preco, tamanho, categoria) 
    VALUES (nome, preco, tamanho, categoria);
END  //
DELIMITER ;

CALL AdicionarPastel('Pastel de carne', 5.00, 'M', 'normal');
CALL AdicionarPastel('Pastel de frango', 6.00, 'G', 'normal');
CALL AdicionarPastel('Pastel de queijo', 6.00, 'G', 'normal');
CALL AdicionarPastel('Pastel de palmito', 3.00, 'P', 'vegano');
CALL AdicionarPastel('Pastel do popeye', 7.50, 'G', 'vegano');
CALL AdicionarPastel('Pastel de espinafre', 5.50, 'G', 'vegano');
CALL AdicionarPastel('Pastel de carne seca', 6.50, 'M', 'zero lactose');
CALL AdicionarPastel('Pastel de camarão', 6.50, 'M', 'zero lactose');
CALL AdicionarPastel('Pastel de bacalhau', 6.50, 'M', 'zero lactose');

select*from pasteis;

DELIMITER //
CREATE PROCEDURE AdicionarProduto(   
    IN p_nome VARCHAR(50),
    IN p_preco DECIMAL(8,2),
    IN p_volume VARCHAR(20),
    IN p_tipo VARCHAR(20)
)
BEGIN
    INSERT INTO produto (nome, preco, volume, tipo) 
    VALUES (p_nome, p_preco, p_volume, p_tipo);
END //
DELIMITER ;

CALL AdicionarProduto('Suco de laranja', 2.00, '1L', 'bebida');
CALL AdicionarProduto('Suco de laranja', 5.00, '2L', 'bebida');
CALL AdicionarProduto('Refrigerante de cola', 3.50, '1L', 'bebida');
CALL AdicionarProduto('Refrigerante de guaraná', 4.00, '1L', 'bebida');
CALL AdicionarProduto('Suco de morango', 7.00, '2L', 'bebida');
CALL AdicionarProduto('Suco de limão', 3.50, '1L', 'bebida');
CALL AdicionarProduto('Tubaina', 1.50, '350 ML', 'bebida');

select*from produto;
