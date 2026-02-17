-- إنشاء جدول العملاء
--CREATE TABLE customers (
  --  id SERIAL PRIMARY KEY,
    --name VARCHAR(100),
    --city VARCHAR(100)
--);

-- إنشاء جدول الطلبات
--CREATE TABLE orders (
  --  id SERIAL PRIMARY KEY,
    --customer_id INT REFERENCES customers(id),
    --amount DECIMAL(10, 2),
    --order_date DATE DEFAULT CURRENT_DATE
--);

-- إضافة العملاء
--INSERT INTO customers (name, city) VALUES 
--('أحمد', 'بغداد'),
--('سارة', 'أربيل'),
--('علي', 'البصرة');

-- إضافة 5 طلبات
--INSERT INTO orders (customer_id, amount, order_date) VALUES 
--(1, 300.00, '2026-02-01'), -- أحمد
--(1, 250.00, '2026-02-05'), -- أحمد (المجموع 550)
--(2, 450.00, '2026-02-10'), -- سارة
--(3, 100.00, '2026-02-12'), -- علي
--(3, 150.00, '2026-02-15'); -- علي (المجموع 250)

--SELECT c.name, SUM(o.amount) AS total_spent
--FROM customers c
--JOIN orders o ON c.id = o.customer_id
--GROUP BY c.name;

--SELECT c.name, SUM(o.amount) AS total_spent
--FROM customers c
--JOIN orders o ON c.id = o.customer_id
--GROUP BY c.name
--HAVING SUM(o.amount) > 500;

SELECT c.name, COUNT(o.id) AS number_of_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;