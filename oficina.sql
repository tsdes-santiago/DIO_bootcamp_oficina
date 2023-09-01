-- show databases;
-- drop database oficina;
-- Criação do banco de dados para o e-commerce

create database oficina;

use oficina;

-- Criando a tabela para escolher cliente PF ou PJ
-- drop table selectClient;
create table selectClient(
	idSClient int auto_increment primary key,
    ClientType enum('PF', 'PJ') not null
    );
    
-- drop table clientPF;    
-- Criando a tabela cliente PF
create table clientPF(
	idClientPF int auto_increment primary key,
    ClientPF_idSClient int,
    Fname varchar(20),
    Mname varchar(20),
    Lname varchar(20),
    CPF char(11) not null,
    contact char(11),
    constraint unique_cpf_client unique (CPF),
	foreign key (ClientPF_idSClient) references selectClient(idSClient)
    );
-- Criando a tabela cliente PJ
create table clientPJ(
	idClientPJ int auto_increment primary key,
    ClientPJ_idSClient int, 
    SocialName varchar(45) not null,
    AbstName varchar(45),
    CNPJ char(15),
    contact char(11) not null,
    constraint unique_cnpj_client unique (CNPJ),
	foreign key (ClientPJ_idSClient) references selectClient(idSClient)
	);

-- Criando a tabela veículo

create table vehicle(
	idVehicle int auto_increment primary key,
    LicensePlate char(7), 
    Model varchar(15) not null,
    Manufacturer varchar(15),
    FabricationYear year(4),
    Vehicle_idSClient int,
    constraint unique_license_place unique (LicensePlate)
    );
    
-- Criando tabela veículos de clientes

create table clients_vehicles(
  client_id int not null,
  vehicle_id int not null,
  primary key (client_id, vehicle_id),
  foreign key (client_id) references selectClient(idSClient),
  foreign key (vehicle_id) references vehicle(idVehicle)
);
 
-- Criando tabela Servicos 

create table services(
	idService int auto_increment primary key,
    ServiceType enum('orçamento', 'revisão', 'manutenção', 'reparo') default 'orçamento',
    VehicleKm int not null,
    TotalPrice float not null default 0.0, 
    BeginDate date not null,
    EndDate date,
    Service_idVehicle int,
    constraint foreign key (Service_idVehicle) references vehicle(idVehicle)
	);
    
-- criando tabela ordem de serviço
create table serviceOrder(
	idSOrder int auto_increment primary key,
    Sector enum('mecânica', 'elétrica', 'funilaria') not null default 'mecânica',
    ServiceDescription varchar(200) not null,
    SOrder_idService int,
    foreign key (SOrder_idService) references services(idService) 
	);

-- criando tabela Peças vendidas
create table soldParts(
	idSoldParts int auto_increment primary key,
    PartName varchar(30) not null,
	Price float not null,
    Origin enum('estoque', 'fornecedor') default 'estoque', 
    SoldPart_idOrder int,
    foreign key (SoldPart_idOrder) references serviceOrder(idSOrder)
	);
    
-- criando tabela Estoque peças
create table partsStock(
	idPartsStock int auto_increment primary key,
    PartName varchar(30) not null,
    Price float default 0.0,
    Quantity int default 1
    );

-- criando tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(45) not null,
    AbstName varchar(45),
    CNPJ char(15),
    contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ)
	);
    
-- criando tabela Peças fornecedor
create table partsSupplier(
	idPartsSupplier int auto_increment primary key,
    PartName varchar(30) not null,
    Price float default 0.0,
    partSupplier_idSupplier int,
    foreign key (partSupplier_idSupplier) references supplier(idSupplier) 
	);
