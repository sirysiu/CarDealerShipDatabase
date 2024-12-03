DROP DATABASE IF EXISTS cardealership;

CREATE DATABASE IF NOT EXISTS cardealership;

USE cardealership;

CREATE TABLE `dealerships` (
    dealership_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY(dealership_id)
);

CREATE TABLE `vehicles` (
vin INT,
year INT,
make VARCHAR(50),
model VARCHAR(50),
color VARCHAR(50),
mileage VARCHAR(50),
sold BOOL,
PRIMARY KEY(vin)
);

CREATE TABLE `inventory` (
dealership_id INT,
vin int,
FOREIGN KEY(dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY(vin) REFERENCES vehicles(vin),
PRIMARY KEY(dealership_id, vin) 
);

CREATE TABLE `sales_contract`(
id INT NOT NULL AUTO_INCREMENT,
sales_tax_amount DECIMAL(10,2),
recording_fee DECIMAL(6, 2),
processing_fee DECIMAL(6, 2),
total_price DECIMAL(10,2),
date DATE,
customer_name VARCHAR(50),
customer_email VARCHAR(50),
vin INT,
PRIMARY KEY(id),
FOREIGN KEY(vin) REFERENCES vehicles(vin) 

);
CREATE TABLE `lease_contract` (
    id INT NOT NULL AUTO_INCREMENT,
    lease_amount DECIMAL(10, 2),
    lease_term INT,  -- lease term in months
    start_date DATE,
    end_date DATE,
    customer_name VARCHAR(50),
    customer_email VARCHAR(50),
    vin INT,
    PRIMARY KEY(id),
    FOREIGN KEY(vin) REFERENCES vehicles(vin)  -- foreign key to vehicles
);

INSERT INTO `dealerships` (name, address, phone) 
VALUES 
('Car Max', '123 Main St, Springfield, IL', '217-555-1234'),
('Auto World', '456 Elm St, Springfield, IL', '217-555-5678'),
('Luxury Motors', '789 Oak St, Springfield, IL', '217-555-9012');


INSERT INTO `vehicles` (vin, year, make, model, color, mileage, sold) 
VALUES 
(1001, 2020, 'Toyota', 'Camry', 'Blue', '25000', FALSE),
(1002, 2021, 'Honda', 'Civic', 'Red', '15000', FALSE),
(1003, 2019, 'Ford', 'Mustang', 'Black', '30000', TRUE),
(1004, 2022, 'Chevrolet', 'Tahoe', 'White', '5000', FALSE),
(1005, 2020, 'Tesla', 'Model 3', 'Silver', '10000', TRUE);


INSERT INTO `inventory` (dealership_id, vin) 
VALUES 
(1, 1001),
(1, 1002),
(2, 1003),
(3, 1004),
(3, 1005);

INSERT INTO `sales_contract` (sales_tax_amount, recording_fee, processing_fee, total_price, date, customer_name, customer_email, vin) 
VALUES 
(1500.00, 150.00, 100.00, 25000.00, '2023-07-15', 'John Doe', 'johndoe@example.com', 1003),
(1300.00, 130.00, 90.00, 22000.00, '2023-08-20', 'Jane Smith', 'janesmith@example.com', 1005);

INSERT INTO `lease_contract` (lease_amount, lease_term, start_date, end_date, customer_name, customer_email, vin) 
VALUES 
(400.00, 36, '2023-06-01', '2026-06-01', 'Michael Brown', 'michaelb@example.com', 1001),
(350.00, 48, '2023-07-10', '2027-07-10', 'Sara Lee', 'saralee@example.com', 1002);




