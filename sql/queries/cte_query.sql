WITH 
book_popularity AS (
    SELECT 
        b.book_id,
        b.title,
        b.author,
        COUNT(l.loan_id) AS times_borrowed
    FROM books b
    LEFT JOIN loans l ON b.book_id = l.book_id
    GROUP BY b.book_id, b.title, b.author
),
ranked_books AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY times_borrowed DESC) AS rank_number
    FROM book_popularity
)
SELECT 
    rank_number AS "Место в рейтинге",
    title AS "Название книги",
    author AS "Автор",
    times_borrowed AS "Количество выдач"
FROM ranked_books
WHERE rank_number <= 5
ORDER BY rank_number;