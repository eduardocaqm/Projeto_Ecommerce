-- Criação de database para ecommerce

create database ecommerce;

use ecomerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Rua varchar(25),
    Bairro varchar(25),
    Cidade varchar(25),
    NumCasa char(7),
    constraint unique_cpf_client unique(CPF)
);
-- criar tabela pagamento
create table payments(
	idClients int,
    idPayments int,
    CName varchar(20),
    DataValid varchar(5),
    Bandeira varchar(10),
    primary key (idClient, idPayments)
    
);
-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    Classification varchar(20) not null,
    Category char(11) not null,
    Description varchar(15),
    constraint unique_cpf_client unique(CPF)
);
-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClients int,
    Ordersstatus enum('confirmado', 'Em processo', 'Cancelado') default 'Processando',
    OrdersDescription varchar(15),
    OrdersValue float default 10,
    Payments int,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClients),
	constraint fk_payments foreign key (Payments) references payments(idPayments)
);

-- criando tabela estoque
create table storege(
	idStorage int auto_increment primary key,
    Qtd int(10) default 0,
    SLocal varchar(20) not null,
);

-- criando tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    CNPJ char(15),
    SocialName varchar(30),
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ) 
);

create table productseller(
	idPSeller int,
    idProduct int,
    ProdQtd int default 0,
    primary key (idSeller, idProdutc),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table storagelocation(
	idLProduct int,
    idLStorage int,
    Location varchar (20),
    primary key (idLProduct, idLStorage),
    constraint fk_product_seller foreign key (idLProduct) references product(idProduct),
    constraint fk_product_product foreign key (idLStorage) references storege(idStorage)
);
create table productOrder(
	idPOProduct int,
    idPOOrder int,
    POQtd varchar (20),
    primary key (idPOProduct, idPOOrder),
    constraint fk_product_seller foreign key (idPOProduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOOrder) references orders(idOrder)
);