CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    published_year INTEGER,
    price NUMERIC(10, 2)
);

INSERT INTO books (title, author, published_year, price) 
VALUES 
('Deep Work', 'Cal Newport', 2016, 15.00),
('The Alchemist', 'Paulo Coelho', 1988, 12.50),
('Atomic Habits', 'James Clear', 2018, 20.00);

SELECT * FROM books 
WHERE published_year > 2010;

UPDATE books 
SET price = 25.50 
WHERE book_id = 1;

SELECT * FROM books 
ORDER BY price ASC;
