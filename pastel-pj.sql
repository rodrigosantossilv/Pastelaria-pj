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
select* from pedidos
