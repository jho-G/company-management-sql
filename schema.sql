-- ==========================
-- DATABASE
-- ==========================
CREATE DATABASE IF NOT EXISTS CompanyManagementDB;
USE CompanyManagementDB;

-- ==========================
-- COMPANY TABLE
-- ==========================
CREATE TABLE COMPANY (
    Code INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    UnitPrice DECIMAL(10,2),
    Products VARCHAR(255),
    QualityOfProducts VARCHAR(255),
    Manager_ID INT,
    Manager_StartDate DATE
);

-- ==========================
-- COMPANY LOCATION
-- ==========================
CREATE TABLE COMPANY_LOCATION (
    Company_Code INT,
    Address VARCHAR(255),
    PRIMARY KEY (Company_Code, Address),
    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- EMPLOYEE
-- ==========================
CREATE TABLE EMPLOYEE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    MiddleName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(10,2),
    BankAccount VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
    Supervisor_ID INT,
    Company_Code INT,

    FOREIGN KEY (Supervisor_ID)
        REFERENCES EMPLOYEE(ID)
        ON DELETE SET NULL,

    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- PRODUCT
-- ==========================
CREATE TABLE PRODUCT (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Price DECIMAL(10,2),
    Quality VARCHAR(255),
    Description TEXT,
    Company_Code INT,
    Product_Date DATE,

    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- CUSTOMER
-- ==========================
CREATE TABLE CUSTOMER (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    BankAccount VARCHAR(50),
    Order_Details VARCHAR(255),
    Company_Code INT,

    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- ORDER AND PURCHASE
-- ==========================
CREATE TABLE ORDER_AND_PURCHASE (
    Customer_ID INT,
    Product_ID INT,
    Company_Code INT,
    Order_Date DATE,

    PRIMARY KEY (Customer_ID, Product_ID, Company_Code),

    FOREIGN KEY (Customer_ID)
        REFERENCES CUSTOMER(ID)
        ON DELETE CASCADE,

    FOREIGN KEY (Product_ID)
        REFERENCES PRODUCT(ID)
        ON DELETE CASCADE,

    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- SUPPLIER
-- ==========================
CREATE TABLE SUPPLIER (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Item_Type VARCHAR(255),
    Item_Quality VARCHAR(255),
    Trade_License VARCHAR(50),
    Price DECIMAL(10,2),
    Raw_Material VARCHAR(255),
    Company_Code INT,

    FOREIGN KEY (Company_Code)
        REFERENCES COMPANY(Code)
        ON DELETE CASCADE
);

-- ==========================
-- DEPENDENT
-- ==========================
CREATE TABLE DEPENDENT (
    Name VARCHAR(255),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Relationship VARCHAR(100),
    Employee_ID INT,

    PRIMARY KEY (Name, Employee_ID),

    FOREIGN KEY (Employee_ID)
        REFERENCES EMPLOYEE(ID)
        ON DELETE CASCADE
);
