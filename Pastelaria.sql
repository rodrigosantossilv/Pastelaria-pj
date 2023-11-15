create database Pastelaria;
use Pastelaria;

create table cliente(
id_cliente int not null auto_increment,
nome varchar(60) not null,
telefone int (16) not null,
primary key(id_cliente)
);

create table endereco(
id_endereco int not null auto_increment,
cep int (8) not null,
rua varchar(60)not null,
complemento varchar(60) not null,
Numero int(18) not null,
id_cliente int,
primary key(id_endereco),
foreign key(id_cliente) references cliente(id_cliente)
);