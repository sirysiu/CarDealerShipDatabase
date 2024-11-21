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







