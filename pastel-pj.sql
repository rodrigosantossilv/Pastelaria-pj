CREATE DATABASE Pastelaria;
USE Pastelaria;

CREATE TABLE clientes(
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
CREATE TABLE categoria(
id_categoria int primary key auto_increment,
nome varchar(50)
);

CREATE TABLE forma_pagamentos(
id_forma_pagamento int primary key auto_increment,
nome varchar(100)
);
CREATE TABLE recheio(
id_recheio int primary key auto_increment,
nome varchar(50)
);
CREATE TABLE pedidos(
id_pedido int primary key auto_increment,
data_pedido date default (CURRENT_DATE),
id_cliente int not null,
id_forma_pagamento int  not null,
foreign key(id_forma_pagamento) references forma_pagamentos(id_forma_pagamento),
foreign key(id_cliente) references clientes(id_cliente)
);

CREATE TABLE produto(
id_produto int primary key auto_increment,
nome varchar(50),
preco decimal(8,2),
tamanho varchar(20),
id_categoria int not null,
foreign key (id_categoria)references categoria(id_categoria)
);

CREATE TABLE recheio_produto(
id_recheio_produto int primary key auto_increment,
id_recheio int not null,
id_produto int not null,
foreign key(id_recheio) references recheio(id_recheio),
foreign key(id_produto) references produto(id_produto)
);
CREATE TABLE itens_pedido(
id_item int primary key auto_increment,
id_pedido int not null,
id_produto int not null,
quantidade int not null,
foreign key(id_pedido)references pedidos(id_pedido),
foreign key(id_produto)references produto(id_produto)
);

insert into recheio(nome)
values 
('carne'),
('frango'),
('queijo'),
('palmito'),
('espinafre'),
('camarão'),
('bacalhau'),
('Pastel de Queijo e Cheesecake'),
('Queijo com Goiabada'),
('Queijo e Milho');



 insert into categoria(nome)
values 
('simples'),
('vegano'),
('vegetariano'),
('zero lactose'),
('bebida');

insert into forma_pagamentos(nome)
values 
('dinheiro'),('pix'),('cartão debito'),('cartão credito';




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
    INSERT INTO clientes (nome_completo,nome_preferido,cpf,data_nascimento,telefone,email,bairro,cidade,estado) 
    VALUES (nome_completo,nome_preferido,cpf,data_nascimento,telefone,email,bairro,cidade,estado);
END  //
DELIMITER ;
CALL AdicionarCliente('Rodigo da Silva', 'Rodrigo', '123.456.789-01', '2005-05-09', '123456789', 'rodrigo@email.com', 'humildes', 'FSA', 'BA');
CALL AdicionarCliente('Carlos henrique', 'Carlos', '345.609.456-01', '2003-08-03', '750304859', 'carlos@email.com', 'Aviario', 'FSA', 'BA');
CALL AdicionarCliente('Yasmin nere', 'Yasmin', '503.987.545-01', '2004-03-14', '75395030', 'carlos@email.com', 'feira 7', 'FSA', 'BA');
-- 😎
CALL AdicionarCliente('Lucia Oliveira', 'Lucia', '789.456.123-45', '2008-09-25', '987654321', 'lucia@email.com', 'Centro', 'São Paulo', 'SP');
CALL AdicionarCliente('Pedro Santos', 'Pedro', '987.654.321-01', '2010-03-12', '654321987', 'pedro@email.com', 'Bairro Alegre', 'Rio de Janeiro', 'RJ');
CALL AdicionarCliente('Camila Silva', 'Camila', '234.567.890-12', '2009-08-18', '876543210', 'camila@email.com', 'Nova Cidade', 'Salvador', 'BA');
CALL AdicionarCliente('Mateus Oliveira', 'Mateus', '345.678.901-23', '2011-05-07', '543210987', 'mateus@email.com', 'Centro', 'Florianópolis', 'SC');
CALL AdicionarCliente('Maria da Silva', 'Maria', '789.012.345-67', '1990-02-15', '987654321', 'maria@email.com', 'Centro', 'São Paulo', 'SP');
CALL AdicionarCliente('João Oliveira', 'João', '456.789.012-34', '1985-07-22', '654321987', 'joao@email.com', 'Morada das alvores', 'Velho', 'RJ');
CALL AdicionarCliente('Ana Souza', 'Ana', '890.123.456-78', '1988-11-30', '987123654', 'ana@email.com', 'Barauna', 'Fim de Mundo', 'SC');


select*from clientes;
 
DELIMITER //
CREATE PROCEDURE AdicionarProduto(   
    IN nome VARCHAR(50),
    IN preco DECIMAL(8,2),
    IN tamanho VARCHAR(20),
    IN id_categoria int

)
BEGIN
    INSERT INTO produto (nome, preco, tamanho, id_categoria) 
    VALUES (nome, preco, tamanho, id_categoria);
END //


DELIMITER ;
select*from produto;

CALL AdicionarProduto('Suco de laranja', 2.00, '1L', 5);
CALL AdicionarProduto('Suco de laranja', 5.00, '2L', 5);
CALL AdicionarProduto('Refrigerante de cola', 3.50, '1L', 5);
CALL AdicionarProduto('Refrigerante de guaraná', 4.00, '1L', 5);
CALL AdicionarProduto('Suco de morango', 7.00, '2L', 5);
CALL AdicionarProduto('Suco de limão', 3.50, '1L', 5);
CALL AdicionarProduto('Tubaina', 1.50, '350 ML', 5);
CALL AdicionarProduto('Pastel de carne', 5.00, 'M', 1);
CALL AdicionarProduto('Pastel de frango', 6.00, 'G', 1);
CALL AdicionarProduto('Pastel de queijo', 6.00, 'G', 1);
CALL AdicionarProduto('Pastel de palmito', 3.00, 'P', 2);
CALL AdicionarProduto('Pastel de espinafre', 5.50, 'G', 2);
CALL AdicionarProduto('Pastel de carne seca', 6.50, 'M',4);
CALL AdicionarProduto('Pastel de camarão', 6.50, 'M', 4);
CALL AdicionarProduto('Pastel de bacalhau', 6.50, 'M', 4);

 

select*from categoria;
select*from recheio; 
select*from produto;

delimiter //
CREATE PROCEDURE AdicionaRecheio(
IN id_recheio int,
IN id_produto int
)
begin
 INSERT INTO recheio_produto ( id_produto,id_recheio) 
    VALUES ( id_produto,id_recheio);
END //

DELIMITER ;

CALL AdicionaRecheio(1,1);
CALL AdicionaRecheio(2,2);
CALL AdicionaRecheio(3,3);
CALL AdicionaRecheio(4,4);
CALL AdicionaRecheio(5,5);
CALL AdicionaRecheio(6,6);
CALL AdicionaRecheio(7,7);


START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (1, 1);
SET @id_pedido_rodrigo = LAST_INSERT_ID();

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_rodrigo, 10, 2);  -- Suco de laranja (2 unidades)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_rodrigo, 12, 1);  -- Refrigerante de guaraná (1 unidade)
COMMIT;
START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (1, 1);
SET @id_pedido_1 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_1, 10, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_1, 12, 1);
COMMIT;


START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (3, 2);
SET @id_pedido_1 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_1, 15, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_1, 10, 5);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (4, 2);
SET @id_pedido_2 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_2, 11, 3);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_2, 13, 2);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (6, 1);
SET @id_pedido_3 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_3, 7, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_3, 6, 2);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (9, 1);
SET @id_pedido_4 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_4, 10, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_4, 13, 2);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (10, 1);
SET @id_pedido_5 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_5, 12, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_5, 14, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (8, 1);
SET @id_pedido_6 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_6, 11, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_6, 6, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (7, 1);
SET @id_pedido_7 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_7, 14, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_7, 3, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (6, 1);
SET @id_pedido_8 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_8, 10, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_8, 12, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (9, 1);
SET @id_pedido_9 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_9, 13, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_9, 15, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (7, 1);
SET @id_pedido_10 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_10, 11, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_10, 10, 2);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (6, 1);
SET @id_pedido_11 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_11, 12, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_11, 13, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (3, 1);
SET @id_pedido_12 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_12, 14, 2);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_12, 15, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (4, 1);
SET @id_pedido_13 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_13, 10, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_13, 12, 1);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (1, 1);
SET @id_pedido_14 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_14, 13, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_14, 15, 2);
COMMIT;

START TRANSACTION;
INSERT INTO pedidos (id_cliente, id_forma_pagamento) VALUES (3, 1);
SET @id_pedido_15 = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_15, 14, 1);
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (@id_pedido_15, 15, 1);
COMMIT;


select * from pedidos;


SELECT 
cl.id_cliente,
cl.nome_completo,
MONTH(pe.data_pedido) AS mes,
COUNT(pe.id_pedido) AS total_pedidos
FROM clientes cl
JOIN pedidos pe ON cl.id_cliente = pe.id_cliente
WHERE YEAR(pe.data_pedido) = YEAR(CURDATE())
GROUP BY cl.id_cliente, mes
ORDER BY total_pedidos DESC;


-- 4 antes que eu me esqueça
SELECT SUM(preco * quantidade) AS valor_total_venda
FROM produto
JOIN itens_pedido ON produto.id_produto = itens_pedido.id_produto;


-- 6 antes que eu me esqueça
SELECT p.nome AS pastel, COUNT(ip.id_item) AS quantidade_vendas
FROM produto p
JOIN itens_pedido ip ON p.id_produto = ip.id_produto
GROUP BY p.nome
ORDER BY quantidade_vendas ASC;


