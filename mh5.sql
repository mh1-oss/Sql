-- 1️⃣ إنشاء الجدول (Schema Design)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

-- 2️⃣ إدخال البيانات (Data Entry)
-- إضافة المدير العام أولاً
INSERT INTO employees (emp_id, name, job_title, salary, manager_id) 
VALUES (101, 'أحمد المدير', 'CEO', 15000, NULL);

-- إضافة الموظفين التابعين له
INSERT INTO employees (emp_id, name, job_title, salary, manager_id) VALUES
(102, 'سارة علي', 'Salesman', 5000, 101),
(103, 'خالد منصور', 'Developer', 8000, 101),
(104, 'ليلى حسن', 'Salesman', 4500, 101),
(105, 'فهد عمر', 'Analyst', 7000, 101);

-- 3️⃣ تحديث رواتب موظفي المبيعات بنسبة 10% (Bulk Update)
UPDATE employees 
SET salary = salary * 1.10 
WHERE job_title = 'Salesman';

---
--- استخراج النتائج النهائية ---
---

-- أ- استعلام الموظف ومديره (Self-Join)
SELECT 
    e1.name AS "Employee Name", 
    e2.name AS "Manager Name"
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.emp_id;

-- ب- استعلام الموظفين ذوي الرواتب الأعلى من المتوسط (Subquery)
SELECT name, job_title, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);