create database Pastelaria;
use Pastelaria;

create table Clientes(
id_cliente int not null auto_increment,
nome_completo varchar(100) not null,
preferia_por_nome varchar(100) not null,
cpf int(11)  unique,
data_nacimento date,
telefone int(8) unique,
e_mail varchar(100) unique,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado varchar(100) not null,
primary key (id_cliente)
);

create table Pedidos(
id_pedidos int primary key  auto_increment,
id_cliente int not null,
id_pasteis int not null,
quantidade int not null,
data_pedido date,
foreign key (id_cliente) references Clientes(id_cliente),
foreign key(id_pasteis)  references Pasteis(id_pasteis)
);

create table Categorias(
id_categoria int not null auto_increment,
nome_categoria varchar(50) not null,
primary key (id_categoria)
);

create table Recheios(
id_recheios int not null auto_increment,
nome_recheio varchar(100) not null,
id_categoria int not null,
primary key (id_recheios),
foreign key(id_categoria) references Categorias(id_categoria)
);

create table Pasteis(
id_pasteis int not null auto_increment,
nome_pastel varchar(100) not null,
tamanho_pastel varchar(20) not null,
preco decimal(10,2) not null,
id_recheios int not null,
primary key(id_pasteis),
foreign key(id_recheios) references Recheios(id_recheios)
);


create table itens_do_pedidos(
 id_itens_do_pedido int  not null primary key auto_increment,
    id_pedidos int not ,
    id_produto int not ,
	quantidade_itens_pedidos int not null,
     foreign key(id_pedidos) references Pedidos(id_pedidos)
    );


CREATE TABLE Bebidas (
    id_bebida int not null primary key auto_increment,
    nome  varchar(100),
    preco decimal(10,2) not null,
    quantidade int not null default 0,
    id_categoria int not null,
    foreign key(id_categoria) references Categorias(id_categoria)
);

CREATE TABLE FormasPagamento (
    id_forma_pagamento int not null primary key auto_increment,
    nome_forma_pagamento varchar(100),
    id_pedidos int,
    id_itens_do_pedido int,
    foreign key(id_pedidos) references Pedidos(id_pedidos),
    foreign key (id_itens_do_pedido) references itens_do_pedidos(id_itens_do_pedido)

);
yasmin

