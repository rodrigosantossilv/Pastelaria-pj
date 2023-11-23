
CREATE DATABASE Pastelaria;
USE Pastelaria;

CREATE TABLE categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE recheios (
    id_recheios INT NOT NULL AUTO_INCREMENT,
    nome_recheio VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_recheios),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pasteis (
    id_pastel INT NOT NULL AUTO_INCREMENT,
    nome_pastel VARCHAR(100) NOT NULL,
    quant_estoque VARCHAR(100) NOT NULL, 
    tamanho_pastel VARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_recheios INT NOT NULL,
    PRIMARY KEY(id_pastel),
    FOREIGN KEY(id_recheios) REFERENCES recheios(id_recheios)
);

CREATE TABLE bebidas (
    id_bebida INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    volume DECIMAL(10,2) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quant_estoque INT NOT NULL DEFAULT 0,
    id_categoria INT NOT NULL,
    PRIMARY KEY(id_bebida),
    FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    preferia_por_nome VARCHAR(100) NOT NULL,
    cpf INT(11) UNIQUE,
    data_nacimento DATE,
    telefone INT(8) UNIQUE,
    e_mail VARCHAR(100) UNIQUE,
    PRIMARY KEY(id_cliente)
);

CREATE TABLE endereco (
    id_endereco INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    bairro VARCHAR(50),
    numero VARCHAR(10),
    cep VARCHAR(8),
    municipio VARCHAR(50),
    uf CHAR(2),
    PRIMARY KEY(id_endereco),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pedidos (
    id_pedidos INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_pastel INT NOT NULL,
    id_bebidas INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE,
    PRIMARY KEY(id_pedidos),
    FOREIGN KEY(id_bebidas) REFERENCES bebidas(id_bebida),
    FOREIGN KEY(id_pastel) REFERENCES pasteis(id_pastel),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE tamanho (
    id_tamanho INT NOT NULL AUTO_INCREMENT,
    id_pastel INT NOT NULL,
    PRIMARY KEY(id_tamanho),
    FOREIGN KEY(id_pastel) REFERENCES pasteis(id_pastel)
);

CREATE TABLE itens_do_pedidos (
    id_itens_do_pedido INT NOT NULL AUTO_INCREMENT,
    id_pedidos INT NOT NULL,
    quantidade_itens_pedidos INT NOT NULL,
    PRIMARY KEY(id_itens_do_pedido),
    FOREIGN KEY(id_pedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE formasPagamento (
    id_forma_pagamento INT NOT NULL AUTO_INCREMENT,
    nome_forma_pagamento VARCHAR(100),
    id_pedidos INT,
    id_itens_do_pedido INT,
    PRIMARY KEY(id_forma_pagamento),
    FOREIGN KEY(id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY(id_itens_do_pedido) REFERENCES itens_do_pedidos(id_itens_do_pedido)
);

DELIMITER $$

CREATE PROCEDURE cadastrar_cliente(
    IN nome_completo VARCHAR(100),
    IN preferia_por_nome VARCHAR(100),
    IN data_nacimento DATE,
    IN e_mail VARCHAR(100),
    IN telefone VARCHAR(15),
    IN cpf CHAR(14),
    IN bairro VARCHAR(50),
    IN numero VARCHAR(10),
    IN cep VARCHAR(8),
    IN municipio VARCHAR(50),
    IN uf CHAR(2)
)
BEGIN
    DECLARE id_cliente INT;

    START TRANSACTION;


    INSERT INTO Clientes(nome_completo, preferia_por_nome, data_nacimento, e_mail, telefone, cpf)
    VALUES (nome_completo, preferia_por_nome, data_nacimento, e_mail, telefone, cpf);


    SET id_cliente = LAST_INSERT_ID();

    INSERT INTO Endereco(id_cliente, bairro, numero, cep, municipio, uf)
    VALUES (id_cliente, bairro, numero, cep, municipio, uf);

    COMMIT;
END $$

DELIMITER ;


-- foram adionandos apenas 3 clientes no momento
CALL cadastrar_cliente('Nathaly campos', 'naty', '1993-06-09', 'nathaly@gmail.com', '75956489', '76749334', 'Sim', '135', '467-000', 'FSA', 'BA');


select*from clientes;
select*from endereco;
