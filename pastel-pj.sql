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
id_cliente int,
id_pasteis int,
quantidade int ,
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
id_categoria int,
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
);como colocar o github em portugues 
