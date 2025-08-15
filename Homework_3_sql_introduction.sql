-- Часть 1: WHERE
-- Задача 1
-- Все клиенты из страны 'USA', которым больше 25 лет.

SELECT  first_name, last_name, age, country
FROM  Customers
WHERE country = 'USA' AND age > 25;

-- Задача 2
-- Все заказы, у которых сумма (amount) больше 1000.

SELECT  order_id, item, amount, customer_id
FROM Orders
WHERE amount > 1000;

-- Часть 2: JOIN
-- Задача 1
-- Список заказов вместе с именем клиента, который сделал заказ.

SELECT  first_name, last_name, item, amount
FROM Customers INNER JOIN Orders ON Customers.customer_id = orders.customer_id;

-- Задача 2
-- Список доставок со статусом и именем клиента.

SELECT status, first_name, last_name
FROM Shippings INNER JOIN Customers ON Shippings.shipping_id = Customers.customer_id;

-- Часть 3: GROUP BY
-- Задача 1
--Количество клиентов в каждой стране.

SELECT  country, COUNT(*)
FROM Customers
GROUP BY country;

-- Задача 2
-- Общее количество заказов и средняя сумма по каждому товару.

SELECT  item, COUNT(*), ROUND(AVG(amount), 2)
FROM Orders
GROUP BY item;

-- Часть 4: ORDER BY
-- Задача 1
-- Список клиентов, отсортированный по возрасту по убыванию.

SELECT first_name, age
FROM Customers
ORDER BY  age DESC;

-- Часть 5: SUBQUERIES
-- Задача 1
-- Все клиенты, которые сделали заказ с максимальной суммой.

SELECT first_name, last_name, amount
FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE  amount = (SELECT MAX(amount)
                                   FROM Orders);

-- Часть 6: WINDOW FUNCTIONS
-- Задача 1
--Для каждого заказа добавлена колонка с суммой всех заказов клиента.

SELECT order_id, customers.customer_id, item, amount,
             SUM(amount) OVER (PARTITION BY customers.customer_id) AS total_by_customer
FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
ORDER BY order_id;

-- Часть 7: (Опционально)
-- Клиенты, которые сделали хотя бы 2 заказа и имеют хоты бы одну доставку со статусом ' Delivered'.

SELECT CONCAT(first_name ,' ', last_name), country, COUNT(*) AS total_orders, SUM(amount) AS total_amount
FROM Orders INNER JOIN Customers ON Orders.customer_id = Customers.customer_id INNER JOIN Shippings ON Shippings.shipping_id  = Customers.customer_id
WHERE  status = 'Delivered'
GROUP BY CONCAT(first_name, ' ', last_name), country
HAVING COUNT(amount) >= 2;

