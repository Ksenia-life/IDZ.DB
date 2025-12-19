INSERT INTO readers (full_name, email, phone) VALUES
('Иванов Иван', 'ivanov@mail.ru', '+79161234567'),
('Петрова Мария', 'petrova@mail.ru', '+79162345678'),
('Сидоров Алексей', 'sidorov@mail.ru', '+79163456789'),
('Кузнецова Анна', 'kuznetsova@mail.ru', '+79164567890');

INSERT INTO books (title, author, isbn, year_published, genre, available_copies) VALUES
('Мастер и Маргарита', 'Михаил Булгаков', '978-5-389-12345-6', 1967, 'Роман', 3),
('Преступление и наказание', 'Фёдор Достоевский', '978-5-389-12346-3', 1866, 'Роман', 2),
('1984', 'Джордж Оруэлл', '978-5-389-12347-0', 1949, 'Антиутопия', 1),
('Гарри Поттер и философский камень', 'Дж. К. Роулинг', '978-5-389-12348-7', 1997, 'Фэнтези', 4),
('Война и мир', 'Лев Толстой', '978-5-389-12349-4', 1869, 'Роман', 2);

INSERT INTO authors (full_name, country, birth_year) VALUES
('Михаил Булгаков', 'Россия', 1891),
('Фёдор Достоевский', 'Россия', 1821),
('Джордж Оруэлл', 'Великобритания', 1903);

INSERT INTO genres (genre_name) VALUES
('Роман'),
('Фэнтези'),
('Антиутопия'),
('Детектив');

INSERT INTO loans (reader_id, book_id, loan_date, due_date, status) VALUES
(1, 1, '2025-01-10', '2025-02-10', 'returned'),
(1, 2, '2025-02-15', '2025-03-15', 'active'),
(2, 3, '2025-01-20', '2025-02-20', 'overdue'),
(2, 4, '2025-03-01', '2025-04-01', 'active'),
(3, 5, '2025-02-05', '2025-03-05', 'returned'),
(3, 1, '2025-03-10', '2025-04-10', 'active');

INSERT INTO fines (loan_id, amount, paid) VALUES
(3, 150.00, false);

SELECT * FROM readers;
SELECT * FROM books;
SELECT * FROM loans;