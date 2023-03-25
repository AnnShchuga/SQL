-- Задание 1

-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, sname, comm
FROM salespeople;

-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT DISTINCT(cname) AS name, rating 
FROM customers; 

-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”) 
SELECT DISTINCT(cname) AS name 
FROM customers;

-- 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
SELECT cname
FROM customers
WHERE cname LIKE 'G%';

-- 4. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt” - сумма)
SELECT *
FROM orders
WHERE amt > 1000;

-- 5. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt)
FROM orders;

-- 6. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT *
FROM customers
WHERE (rating > 100) AND (city != "Rome");



-- Задание 2

create table Employees
(
    Id INT auto_increment primary key,
    FirstName varchar(15) NOT NULL,
    LastName varchar(15) NOT NULL,
    Post varchar(15),
    Seniority INT,
    Salary INT,
    Age TINYINT
);

INSERT INTO Employees 
    (FirstName, LastName, Post, Seniority, Salary, Age)
VALUES
    ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петя', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юра', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
    ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49)
;

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM Employees 
ORDER BY Salary DESC;

SELECT * FROM Employees 
ORDER BY Salary;

-- 2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT * FROM Employees
ORDER BY salary
LIMIT 5;

-- 3. Выполните группировку всех сотрудников по специальности, суммарная зарплата которых превышает 100000
SELECT Post, COUNT(*) AS Post FROM Employees
WHERE Salary > 100000
GROUP BY Post;