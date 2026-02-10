USE CompanyManagementDB;

-- Create users (example only)
CREATE USER 'employeeUser'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'managerUser'@'localhost' IDENTIFIED BY 'password123';

-- Grant permissions
GRANT SELECT
ON CompanyManagementDB.EMPLOYEE
TO 'employeeUser'@'localhost';

GRANT ALL PRIVILEGES
ON CompanyManagementDB.CUSTOMER
TO 'managerUser'@'localhost';

-- Revoke permission
REVOKE UPDATE
ON CompanyManagementDB.EMPLOYEE
FROM 'employeeUser'@'localhost';
