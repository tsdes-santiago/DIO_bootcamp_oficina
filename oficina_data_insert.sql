-- populate database com dados aleatórios gerados pelo google Bard
use oficina;

show tables;
-- adicionando clientes PF
INSERT INTO selectClient (ClientType) values 
	('PF'),
    ('PF'),
    ('PF'),
    ('PF'),
    ('PF');
    
INSERT INTO clientPF (ClientPF_idSClient, Fname, Mname, Lname, CPF, Contact) VALUES
(1, 'John', 'Doe', 'Smith', '12345678901', '1234567890'),
(2, 'Jane', 'Doe', 'Williams', '98765432101', '9876543210'),
(3, 'Peter', 'Smith', 'Brown', '23456789012', '2345678901'),
(4, 'Mary', 'Johnson', 'Williams', '34567890123', '3456789012'),
(5, 'Michael', 'Brown', 'Miller', '45678901234', '4567890123');

-- adicionando clientes PJ
INSERT INTO selectClient (ClientType) values 
	('PJ'),
    ('PJ'),
    ('PJ');

INSERT INTO clientPJ (ClientPJ_idSClient, SocialName, AbstName, CNPJ, Contact) VALUES
(6, 'Acme Corporation', 'John Doe', '12345678900123', '1234567890'),
(7, 'XYZ Company', 'Jane Doe', '98765432100123', '9876543210'),
(8, 'LMN Enterprises', 'Peter Smith', '23456789001234', '2345678901');

select * from clientPJ;

-- Adicionando Veículos
select * from selectClient;
INSERT INTO vehicle (LicensePlate, Model, Manufacturer, FabricationYear) VALUES
('AAA0001', 'Fiat Uno', 'Fiat', 2010),
('BBB0002', 'Volkswagen Gol', 'Volkswagen', 2012),
('CCC0003', 'Chevrolet Celta', 'Chevrolet', 2014),
('DDD0004', 'Ford Ka', 'Ford', 2016),
('EEE0005', 'Hyundai HB20', 'Hyundai', 2018),
('FFF0006', 'Kia Picanto', 'Kia', 2020),
('GGG0007', 'Renault Sandero', 'Renault', 2022),
('HHH0008', 'Peugeot 208', 'Peugeot', 2021),
('III0009', 'Citroën C3', 'Citroën', 2020),
('JJJ0010', 'Toyota Corolla', 'Toyota', 2019),
('KKK0011', 'Honda Civic', 'Honda', 2018),
('LLL0012', 'Volkswagen Golf', 'Volkswagen', 2017),
('MMM0013', 'Chevrolet Cruze', 'Chevrolet', 2016),
('NNN0014', 'Fiat Argo', 'Fiat', 2015),
('OOO0015', 'Renault Logan', 'Renault', 2014);

select * from vehicle;

insert into clients_vehicles (client_id, vehicle_id) values
	(1,1),
	(2,2), 
    (3,3),
	(4,4),
    (5,5),
	(6,6),
    (6,7),
	(7,8),
    (7,9),
	(7,10),
    (8,11),
	(8,12),
    (8,13),
	(8,14),
    (8,15);
    
select * from clients_vehicles;

INSERT INTO services (ServiceType, VehicleKm, TotalPrice, BeginDate, EndDate, Service_idVehicle) VALUES
('orçamento', 10000, 0, '2023-09-01', '2023-09-15', 1),
('revisão', 20000, 1000, '2023-09-02', '2023-09-16', 2),
('manutenção', 30000, 1500, '2023-09-03', '2023-09-17', 3),
('reparo', 40000, 2000, '2023-09-04', '2023-09-18', 4),
('orçamento', 50000, 0, '2023-09-05', '2023-09-19', 5),
('revisão', 60000, 3000, '2023-09-06', '2023-09-20', 6),
('manutenção', 70000, 3500, '2023-09-07', '2023-09-21', 7),
('reparo', 80000, 4000, '2023-09-08', '2023-09-22', 8),
('orçamento', 90000, 0, '2023-09-09', '2023-09-23', 9),
('revisão', 100000, 5000, '2023-09-10', '2023-09-24', 10),
('manutenção', 110000, 5500, '2023-09-11', '2023-09-25', 11),
('reparo', 120000, 6000, '2023-09-12', '2023-09-26', 12);

INSERT INTO serviceOrder (Sector, ServiceDescription, SOrder_idService) VALUES
('mecânica', 'Windshield Wiper Belts Replacement', 12),
('elétrica', 'Air Filter Replacement', 2),
('mecânica', 'Brake Pads Replacement', 3),
('funilaria', 'Car Dent Repair', 4),
('mecânica', 'Engine Oil Change', 11),
('elétrica', 'Headlight Bulb Replacement', 6),
('mecânica', 'Tire Rotation', 7),
('funilaria', 'Car Scratch Repair', 8),
('mecânica', 'Spark Plugs Replacement', 3),
('elétrica', 'Battery Replacement', 10);

INSERT INTO soldParts (PartName, Price, Origin, SoldPart_idOrder) VALUES
('Windshield Wiper Belts', 50, 'estoque', 1),
('Air Filter', 30, 'estoque', 2),
('Brake Pads', 100, 'estoque', 3),
('Car Dent Repair', 200, 'fornecedor', 4),
('Engine Oil', 40, 'estoque', 5),
('Headlight Bulb', 20, 'estoque', 6),
('Tire Rotation', 30, 'estoque', 7),
('Car Scratch Repair', 150, 'fornecedor', 8),
('Spark Plugs', 10, 'estoque', 9),
('Battery', 60, 'estoque', 10);

INSERT INTO partsStock (PartName, Price, Quantity) VALUES
('Brake Pads', 100, 10),
('Tire', 200, 5),
('Windshield Wiper', 50, 20),
('Engine Oil', 40, 15),
('Air Filter', 30, 10),
('Cabin Filter', 20, 25),
('Spark Plugs', 10, 5),
('Battery', 60, 10),
('Belts', 50, 20),
('Light Bulbs', 40, 15),
('Brake Rotors', 70, 10),
('Brake Calipers', 80, 25),
('Brake Discs', 90, 15),
('Struts', 100, 10),
('Shock Absorbers', 110, 20),
('Power Steering Pump', 120, 15),
('Water Pump', 130, 10),
('Alternator', 140, 25),
('Radiator', 150, 15),
('Fan Belt', 160, 10),
('Timing Belt', 170, 25);

INSERT INTO supplier (SocialName, AbstName, CNPJ, contact) VALUES
('Acme Corporation', 'John Doe', '12345678900123', '1234567890'),
('XYZ Company', 'Jane Doe', '98765432100123', '9876543210'),
('LMN Enterprises', 'Peter Smith', '23456789001234', '2345678901'),
('VW Parts', 'Maria Silva', '89765432100123', '8976543210');

INSERT INTO partsSupplier (PartName, Price, partSupplier_idSupplier) VALUES
('Brake Pads', 100, 1),
('Tire', 200, 2),
('Windshield Wiper', 50, 3),
('Engine Oil', 40, 4),
('Air Filter', 30, 1),
('Cabin Filter', 20, 2),
('Spark Plugs', 10, 3),
('Battery', 60, 4),
('Belts', 50, 1),
('Light Bulbs', 40, 2),
('Brake Rotors', 70, 3),
('Brake Calipers', 80, 4);
