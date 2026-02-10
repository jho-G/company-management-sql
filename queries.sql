USE CompanyManagementDB;

-- Employees with high salary
SELECT *
FROM EMPLOYEE
WHERE Salary > 50000;

-- Number of employees per company
SELECT Company_Code, COUNT(*) AS Employee_Count
FROM EMPLOYEE
GROUP BY Company_Code;

-- Top 5 expensive products
SELECT *
FROM PRODUCT
ORDER BY Price DESC
LIMIT 5;

-- Products from companies with high quality
SELECT *
FROM PRODUCT
WHERE Company_Code IN (
    SELECT Code
    FROM COMPANY
    WHERE QualityOfProducts = 'High'
);

-- Customers and their companies
SELECT
    CUSTOMER.Name AS CustomerName,
    COMPANY.Name AS CompanyName
FROM CUSTOMER
JOIN COMPANY
ON CUSTOMER.Company_Code = COMPANY.Code;

-- Products priced above average
SELECT *
FROM PRODUCT
WHERE Price > (
    SELECT AVG(Price)
    FROM PRODUCT
);
