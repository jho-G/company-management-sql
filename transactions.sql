USE CompanyManagementDB;

START TRANSACTION;

UPDATE EMPLOYEE
SET Salary = Salary + 5000
WHERE ID = 1;

UPDATE COMPANY
SET UnitPrice = UnitPrice - 5000
WHERE Code = (
    SELECT Company_Code
    FROM EMPLOYEE
    WHERE ID = 1
);

COMMIT;
