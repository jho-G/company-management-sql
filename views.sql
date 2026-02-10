USE CompanyManagementDB;

-- View: High salary employees
CREATE VIEW HighSalaryEmployees AS
SELECT FirstName, LastName, Salary
FROM EMPLOYEE
WHERE Salary > 80000;

-- View: Customer orders
CREATE VIEW CustomerOrdersView AS
SELECT
    CUSTOMER.Name AS CustomerName,
    PRODUCT.Name AS ProductName,
    ORDER_AND_PURCHASE.Order_Date
FROM ORDER_AND_PURCHASE
JOIN CUSTOMER
    ON ORDER_AND_PURCHASE.Customer_ID = CUSTOMER.ID
JOIN PRODUCT
    ON ORDER_AND_PURCHASE.Product_ID = PRODUCT.ID;
