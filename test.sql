
SELECT * FROM dealerships;

SELECT v.* 
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE i.dealership_id = 1;

SELECT * FROM vehicles
WHERE vin = 1001;

SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.color = 'Red' AND v.make = 'Honda' AND v.model = 'Civic';

SELECT s.*
FROM sales_contract s
JOIN vehicles v ON s.vin = v.vin
JOIN inventory i ON v.vin = i.vin
WHERE i.dealership_id = 1
  AND s.date BETWEEN '<start_date>' AND '<end_date>';
