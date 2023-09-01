show databases;

use oficina;

show tables;

select * from selectClient;

-- #############################################
-- Quantos clientes são pessoa física ?    

select count(*) as PF_num from selectClient
	where ClientType = 'PF';

-- e PJ?
select count(*) as PF_num from selectClient
	where ClientType = 'PJ';

-- ##############################
-- Quantos veículos LMN Enterprises possui? idClientPJ = 3
select * from clientPJ;
select * from clients_vehicles;

select cpj.SocialName, sc.ClientType, sc.idSClient from clientPJ cpj
    inner join selectClient sc on sc.idSClient = cpj.ClientPJ_idSClient
    where cpj.idClientPJ = 3; 
    
-- idSClient = 8 para LMN Enterprises

select count(*) as Vehicles_num from clients_vehicles 
	where client_id = 8;

-- ##########################
-- Serviços por ordem decrescente de valor
select * from services
	order by TotalPrice desc; 

-- ######################
-- Veículos com fabricação posterior a 2018

select * from vehicle 
	having FabricationYear > 2018;

-- #####################
-- Valor total recebido pelos serviços 

select sum(TotalPrice) as Total_serviços from services;
-- ###############
-- Listar veículos e proprietários PF

select v.Model, v.LicensePlate, concat(cpf.Fname, ' ', cpf.Lname) as Name, sc.ClientType from vehicle v
	inner join clients_vehicles cv on cv.vehicle_id = v.idVehicle
    inner join selectClient sc on sc.idSClient = cv.client_id
    inner join clientPF cpf on cpf.ClientPF_idSClient = sc.idSClient;
    
-- ##################
-- Listar veículos e proprietários PJ

select v.Model, v.LicensePlate, cpj.SocialName, sc.ClientType from vehicle v
	inner join clients_vehicles cv on cv.vehicle_id = v.idVehicle
    inner join selectClient sc on sc.idSClient = cv.client_id
    inner join clientPJ cpj on cpj.ClientPJ_idSClient = sc.idSClient;

-- ####################
-- Peças vendidas diretamente de fornecedores terceiros para os clientes
select * from soldParts
	having Origin = 'Fornecedor';    
    
