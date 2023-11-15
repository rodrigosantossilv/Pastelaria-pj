create database Pastelaria;
use  Pastelaria;


create table Clientes(
id_cliente int(11) not null auto_increment primary key,
nome varchar (100)not null,
telefone varchar (15) not null
);

create table Enderecos(
id_endereco int not null primary key auto_increment,
bairro varchar(50) not null,
ceep varchar(8)null,
logradouro varchar (50)not null,
numero varchar(10)not null,
id_cliente int not null
);
create table pedidos(
id_pedido int (11) not null primary key auto_increment,
id_cliente int not null
);

 create table itens_do_pedidos(
 id_itens_do_pedido int (11) not null primary key auto_increment,
    id_pedido int not null,
    id_produto int not null
    );
    
    
    create table produtos(
     id_produto int (11) not null primary key auto_increment,
     id_bebidas int not null
     );
     
     
     
     create table bebidas(
     id_bebida int (11) not null primary key auto_increment,
     preco float(11)  not null,
     nome varchar(100)
    );
    create table pasteis(
    id_pasteis int (11) not null primary key auto_increment,
    preco float(11)  not null,
    nome varchar(100),
    id_bebida  int not null
    );
    
   
    
    
    CREATE TABLE categoria (
    id_categoria int (11) not null primary key auto_increment,
    comum VARCHAR(100) NOT NULL,
    vegano VARCHAR(100) NOT NULL
    

    );
     create table ingredientes(
     id_grediente int (11) not null primary key auto_increment,
     nome VARCHAR(100) NOT NULL
     );


     //agora fazer os relacionamento
