-- Задание 1: DML

-- 1. Вставка двух новых сотрудников в таблицу Employees.
INSERT INTO Employees (FirstName, LastName, Department, Salary) VALUES
('Ivan', 'Ivanov', 'HR', 50000.00),
('Petr', 'Petrov', 'IT', 85000.00);

-- 2. Выбор всех сотрудников из таблицы Employees.
SELECT * FROM Employees;

-- 3. Выбор только FirstName и LastName сотрудников из отдела 'IT'.
SELECT FirstName, LastName
FROM Employees 
WHERE Department = 'IT';

-- 4. Обновление Salary 'Alice Smith' до 65000.00.
UPDATE Employees
SET Salary = 65000.00
WHERE FirstName = 'Alice' AND LastName  = 'Smith';

-- 5. Удаление сотрудника, чья LastName — 'Prince'.
DELETE FROM EmployeeProjects
WHERE EmployeeID = (SELECT EmployeeID
                                         FROM EmployeeProjects
                                         WHERE EmployeeID = 4);

DELETE FROM Employees 
WHERE LastName = 'Prince';

-- 6. Проверка всех изменений, используя SELECT * FROM Employees;.
SELECT * FROM Employees;

-- Задание 2: DDL

-- 1. Создание новой таблицы с именем Departments со столбцами: DepartmentID (SERIAL PRIMARY KEY), DepartmentName (VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)).
CREATE TABLE Departments (
DepartmentID SERIAL PRIMARY KEY,
DepartmentName VARCHAR(50) UNIQUE NOT NULL,
Location VARCHAR(50));

-- 2. Изменение таблицы Employees, добавление нового столбца с именем Email (VARCHAR(100)).
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

-- 3. Добавление ограничения UNIQUE к столбцу Email в таблице Employees, предварительное заполнение любыми значениями.
INSERT INTO Employees (Email) VALUES
('alicesmith@mail.ru'),
('bobjohnson@mail.ru'),
('charliebrown@mail.ru'),
('evedavis@mail.ru');

ALTER TABLE Employees ADD CONSTRAINT UQ_Email UNIQUE (Email);

-- 4. Переименование столбца Location в таблице Departments в OfficeLocation.
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation;

-- Задание 3: DML

-- Создание нового пользователя PostgreSQL (роль) с именем hr_user и простым паролем.
CREATE USER hr_user WITH PASSWORD 'hr_user';
CREATE ROLE hr_user_select_employees;

--  Предоставление hr_user права SELECT на таблицу Employees.
GRANT SELECT ON Employees TO hr_user_select_employees;
GRANT hr_user_select_employees TO hr_user;

-- Предоставление hr_user права INSERT и UPDATE на таблицу Employees.
CREATE ROLE hr_user_insert_update_employees;
GRANT INSERT, UPDATE ON Employees TO hr_user_insert_update_employees;
GRANT hr_user_insert_update_employees TO hr_user;

-- Выполнение INSERT и UPDATE сотрудника.
UPDATE Employees
SET Salary = 80000.00
WHERE FirstName = 'Alice' AND LastName  = 'Smith';

-- Изменила GRANT, поскольку получала ошибки при применении INSERT по отношению к ID.
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO hr_user;
INSERT INTO Employees (FirstName, LastName, Department, Salary, Email) VALUES
('Johny', 'Depp', 'HR', 100000.00, 'johnydepp@mail.ru');

-- Задание 4: DML\TCL

-- 1. Увеличение Salary всех сотрудников в отделе 'HR' на 10%.
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department  = 'HR';

-- 2. Обновление Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.
UPDATE Employees
SET Department = 'Senior IT'
WHERE Salary > 70000.00;

-- 3. Удаление всех сотрудников, которые не назначены ни на один проект в таблице EmployeeProjects.
DELETE FROM Employees
WHERE NOT EXISTS  (SELECT EmployeeID
                  FROM EmployeeProjects
                  WHERE EmployeeID = Employees.EmployeeID);

-- 4. Вставка нового проекта и назначение на него двух существующих сотрудников с определенным количеством HoursWorked в EmployeeProjects, все это в одном блоке BEGIN/COMMIT.
BEGIN;
INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate) VALUES
	('Innowise BigData Lab', 5000000.00, '2025-08-04', '2025-09-01');
	INSERT INTO EmployeeProjects  (EmployeeID, ProjectID, HoursWorked) VALUES
	(1, 4, 300),
	(2, 4, 300);
COMMIT;

-- Задание 5: Функции и представления

-- 1. Создание функции PostgreSQL с именем CalculateAnnualBonus, которая принимает employee_id и Salary в качестве входных данных и возвращает рассчитанную сумму бонуса (10 % от Salary) для этого сотрудника. Использовано PL/pgSQL для тела функции.
CREATE FUNCTION CalculateAnnualBonus(employee_id INTEGER, Salary NUMERIC)
RETURNS NUMERIC
AS $$
DECLARE bonus NUMERIC;

BEGIN
	bonus := Salary * 0.1;
	RETURN bonus;
END;
$$ LANGUAGE plpgsql;

-- 2. Использование этой функции в операторе SELECT, чтобы увидеть потенциальный бонус для каждого сотрудника.
SELECT CalculateAnnualBonus(1, 71500.00) AS BonusAlice;

-- 3. Создание представления с именем IT_Department_View, которое показывает EmployeeID, FirstName, LastName и Salary только для сотрудников из отдела 'IT'.
CREATE VIEW IT_Department_View AS
SELECT EmployeeID, FirstName, Salary
FROM Employees
WHERE Department = 'IT';

-- 4. Выбор данных из представления IT_Department_View.
SELECT * FROM IT_Department_View;

-- Задание 6: DML (Optional)

-- 1. Поиск ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов.
SELECT ProjectName
FROM Projects INNER JOIN EmployeeProjects ON Projects.ProjectID = EmployeeProjects.ProjectID 
	               INNER JOIN Employees ON Employees.EmployeeID = EmployeeProjects.EmployeeID
WHERE FirstName = 'Bob' AND LastName = 'Johnson' AND HoursWorked > 150;

-- 2. Увеличение Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
UPDATE Projects
SET Budget = Budget * 1.10
WHERE ProjectID IN (SELECT DISTINCT ProjectID
                                        FROM EmployeeProjects INNER JOIN Employees ON EmployeeProjects.EmployeeID = Employees.EmployeeID
                                        WHERE Department = 'IT');

-- 3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установление EndDate на один год позже его StartDate.
UPDATE Projects
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL;

-- 4. Вставка нового сотрудника и немедленное назначение его на проект 'Website Redesign' с 80 отработанными часами, все в рамках одной транзакции. Использовано предложение RETURNING для получения EmployeeID вновь вставленного сотрудника.
DO $$
DECLARE employee_id INT;
	         website_project_id INT;
BEGIN

INSERT INTO Employees (FirstName, LastName, Department, Salary, Email)
VALUES ('Tom', 'Cruse', 'IT', 75000, 'tomcruse@mail.ru')
RETURNING EmployeeID INTO employee_id;

SELECT ProjectID
INTO website_project_id
FROM Projects
WHERE ProjectName = 'Website Redesign';

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (employee_id, website_project_id, 80);

END $$;
