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
mileage INT,
price DOUBLE,
sold BOOL,
type VARCHAR(50),
PRIMARY KEY(vin)
);

CREATE TABLE `inventory` (
dealership_id INT,
vin int,
FOREIGN KEY(dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY(vin) REFERENCES vehicles(vin),
PRIMARY KEY(dealership_id, vin) 
);
CREATE TABLE SalesContract (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key to uniquely identify each contract
    salesTaxAmount DECIMAL(10, 2),      -- Store the sales tax amount (using DECIMAL for currency)
    recordingFee DECIMAL(10, 2),        -- Store the recording fee (using DECIMAL for currency)
    processingFee DECIMAL(10, 2),       -- Store the processing fee (using DECIMAL for currency)
    isFinancing BOOLEAN,                -- Store the financing status (TRUE/FALSE)
    monthlyPayment DECIMAL(10, 2)       -- Store the monthly payment amount (using DECIMAL for currency)
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


INSERT INTO `vehicles` (vin, year, make, model, color, mileage, price, sold, type) 
VALUES 
(1001, 2020, 'Toyota', 'Camry', 'Blue', 25000, 150000, FALSE, 'Sedan'),
(1002, 2021, 'Honda', 'Civic', 'Red', 15000, 29999, FALSE, 'Sedan'),
(1003, 2019, 'Ford', 'Mustang', 'Black', 30000, 34444, TRUE, 'Coupe'),
(1004, 2022, 'Chevrolet', 'Tahoe', 'White', 5000, 343434, FALSE, 'SUV'),
(1005, 2020, 'Tesla', 'Model 3', 'Silver', 10000, 1234, TRUE, 'Sedan');


INSERT INTO `inventory` (dealership_id, vin) 
VALUES 
(1, 1001),
(1, 1002),
(2, 1003),
(3, 1004),
(3, 1005);
INSERT INTO SalesContract (salesTaxAmount, recordingFee, processingFee, isFinancing, monthlyPayment)
VALUES
    (150.75, 50.00, 25.00, TRUE, 350.00),   -- Contract 1
    (200.50, 60.00, 30.00, FALSE, 500.00),  -- Contract 2
    (100.00, 45.00, 20.00, TRUE, 400.00),   -- Contract 3
    (175.25, 55.00, 28.50, TRUE, 600.00),   -- Contract 4
    (130.00, 48.00, 22.00, FALSE, 450.00);  -- Contract 5


INSERT INTO `lease_contract` (lease_amount, lease_term, start_date, end_date, customer_name, customer_email, vin) 
VALUES 
(400.00, 36, '2023-06-01', '2026-06-01', 'Michael Brown', 'michaelb@example.com', 1001),
(350.00, 48, '2023-07-10', '2027-07-10', 'Sara Lee', 'saralee@example.com', 1002);




