CREATE TABLE readers (
    reader_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    year_published INTEGER CHECK (year_published > 0),
    genre VARCHAR(50),
    available_copies INTEGER DEFAULT 1 CHECK (available_copies >= 0)
);

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    birth_year INTEGER
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE book_authors (
    book_id INTEGER REFERENCES books(book_id) ON DELETE CASCADE,
    author_id INTEGER REFERENCES authors(author_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE book_genres (
    book_id INTEGER REFERENCES books(book_id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, genre_id)
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    reader_id INTEGER REFERENCES readers(reader_id),
    book_id INTEGER REFERENCES books(book_id),
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL CHECK (due_date > loan_date),
    return_date DATE,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'returned', 'overdue'))
);

CREATE TABLE fines (
    fine_id SERIAL PRIMARY KEY,
    loan_id INTEGER REFERENCES loans(loan_id),
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    paid BOOLEAN DEFAULT FALSE,
    created_date DATE DEFAULT CURRENT_DATE
);

CREATE INDEX idx_loans_reader ON loans(reader_id);
CREATE INDEX idx_loans_book ON loans(book_id);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_books_author ON books(author);
CREATE INDEX idx_readers_email ON readers(email);
