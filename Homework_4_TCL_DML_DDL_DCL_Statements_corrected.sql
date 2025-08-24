Задание 2: DDL

-- 3. Добавление ограничения UNIQUE к столбцу Email в таблице Employees, предварительное заполнение любыми значениями.
UPDATE Employees
SET Email = CONCAT(LOWER(FirstName), LOWER(LastName), '@gmail.com');

ALTER TABLE Employees ADD CONSTRAINT UQ_Email UNIQUE (Email);

Задание 4: DML\TCL

-- 4. Вставка нового проекта и назначение на него двух существующих сотрудников с определенным количеством HoursWorked в EmployeeProjects, все это в одном блоке BEGIN/COMMIT.
DO $$
DECLARE
NewProjectID INTEGER;
EmployeeID1 INTEGER := 1;
EmployeeID2 INTEGER := 2;
BEGIN

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate)
VALUES ('Production', 120000.00, '2025-08-04', '2025-09-01');

SELECT currval('Projects_ProjectID_seq') INTO NewProjectId;

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (EmployeeID1, NewProjectID, 150);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (EmployeeID2, NewProjectID, 170);

COMMIT;

END $$;

Задание 5: Функции и представления

-- 1. Создание функции PostgreSQL с именем CalculateAnnualBonus, которая принимает employee_id и Salary в качестве входных данных и возвращает рассчитанную сумму бонуса (10 % от Salary) для этого сотрудника. Использовано PL/pgSQL для тела функции.
CREATE FUNCTION CalculateAnnualBonus(EmployeeID INTEGER, Salary NUMERIC)
RETURNS NUMERIC
AS $$
DECLARE bonus NUMERIC;

BEGIN
	bonus := Salary * 0.1;
	RETURN bonus;
END;
$$ LANGUAGE plpgsql;

-- 2. Использование этой функции в операторе SELECT, чтобы увидеть потенциальный бонус для каждого сотрудника.
SELECT EmployeeID, FirstName, LastName, Department, Salary, CalculateAnnualBonus(EmployeeID, Salary) AS Bonus
FROM Employees;
