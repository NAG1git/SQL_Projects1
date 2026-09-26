;WITH Numbers AS
(
SELECT TOP (1000)
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS id
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
)
INSERT INTO aadhaar_details
(
aadhaar_number,
full_name,
gender,
date_of_birth,
mobile_number,
email,
address,
state,
pincode
)
SELECT
100000000000 + id,
'Citizen_' + CAST(id AS VARCHAR(10)),
CASE
WHEN id % 2 = 0 THEN 'Male'
ELSE 'Female'
END,
DATEADD(DAY, id % 10000, '1985-01-01'),
'9' + RIGHT('000000000' + CAST(id AS VARCHAR(9)), 9),
'citizen' + CAST(id AS VARCHAR(10)) + '@gmail.com',
'Address_' + CAST(id AS VARCHAR(10)),
CASE
WHEN id % 5 = 0 THEN 'Tamil Nadu'
WHEN id % 5 = 1 THEN 'Karnataka'
WHEN id % 5 = 2 THEN 'Telangana'
WHEN id % 5 = 3 THEN 'Maharashtra'
ELSE 'Kerala'
END,
CAST(600000 + (id % 1000) AS VARCHAR(6))
FROM Numbers;