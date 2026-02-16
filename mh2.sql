--- 1. إنشاء الجداول (Tables Creation) ---

-- حذف الجداول إذا كانت موجودة مسبقاً (للبدء من جديد)
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

-- إنشاء جدول الأصناف
CREATE TABLE categories (
    cat_id SERIAL PRIMARY KEY,
    cat_name VARCHAR(100) NOT NULL
);

-- إنشاء جدول المنتجات
CREATE TABLE products (
    prod_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2),
    cat_id INTEGER REFERENCES categories(cat_id) ON DELETE CASCADE
);

--- 2. إضافة البيانات (Data Entry) ---

-- إضافة الأصناف
INSERT INTO categories (cat_name) 
VALUES ('Laptops'), ('Phones');

-- إضافة المنتجات وربطها بالـ cat_id الصحيح
-- (استخدمنا Subquery لجلب الـ id بناءً على الاسم لضمان الدقة)
INSERT INTO products (title, price, cat_id) VALUES 
('MacBook Pro', 1200.00, (SELECT cat_id FROM categories WHERE cat_name = 'Laptops')),
('Dell XPS', 450.00, (SELECT cat_id FROM categories WHERE cat_name = 'Laptops')),
('iPhone 15', 999.00, (SELECT cat_id FROM categories WHERE cat_name = 'Phones')),
('Samsung S23', 800.00, (SELECT cat_id FROM categories WHERE cat_name = 'Phones'));

--- 3. الربط والاستعلام (JOIN) ---
-- استخراج اسم المنتج وبجانبه اسم الصنف
SELECT 
    p.title AS "Product Name", 
    c.cat_name AS "Category Name"
FROM products p
INNER JOIN categories c ON p.cat_id = c.cat_id;

--- 4. التصفية المتقدمة (Filtering with Join) ---
-- المنتجات التي تنتمي لـ Laptops وسعرها أكبر من 500
SELECT 
    p.title, 
    p.price, 
    c.cat_name
FROM products p
INNER JOIN categories c ON p.cat_id = c.cat_id
WHERE c.cat_name = 'Laptops' AND p.price > 500;

--- 5. الإحصائيات (Group By) ---
-- حساب عدد المنتجات في كل صنف
SELECT 
    c.cat_name, 
    COUNT(p.prod_id) AS "Total Products"
FROM categories c
LEFT JOIN products p ON c.cat_id = p.cat_id
GROUP BY c.cat_name;