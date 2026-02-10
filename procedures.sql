USE CompanyManagementDB;

DELIMITER $$

-- Insert employee procedure
CREATE PROCEDURE InsertEmployee(
    IN fName VARCHAR(100),
    IN lName VARCHAR(100),
    IN salary DECIMAL(10,2),
    IN companyCode INT
)
BEGIN
    INSERT INTO EMPLOYEE (FirstName, LastName, Salary, Company_Code)
    VALUES (fName, lName, salary, companyCode);
END$$

-- Get customer orders
CREATE PROCEDURE GetCustomerOrders(IN custID INT)
BEGIN
    SELECT
        PRODUCT.Name,
        ORDER_AND_PURCHASE.Order_Date
    FROM ORDER_AND_PURCHASE
    JOIN PRODUCT
        ON ORDER_AND_PURCHASE.Product_ID = PRODUCT.ID
    WHERE ORDER_AND_PURCHASE.Customer_ID = custID;
END$$

DELIMITER ;
