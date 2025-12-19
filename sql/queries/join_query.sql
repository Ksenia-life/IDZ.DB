SELECT 
    r.reader_id AS "ID читателя",
    r.full_name AS "ФИО читателя",
    r.email AS "Email",
    b.title AS "Книга",
    b.author AS "Автор книги",
    l.loan_date AS "Дата выдачи",
    l.due_date AS "Срок возврата",
    l.status AS "Статус выдачи",
    CASE 
        WHEN l.status = 'active' THEN 'На руках'
        WHEN l.status = 'overdue' THEN 'Просрочена'
        WHEN l.status = 'returned' THEN 'Возвращена'
    END AS "Текущий статус"
FROM readers r
INNER JOIN loans l ON r.reader_id = l.reader_id 
LEFT JOIN books b ON l.book_id = b.book_id       
ORDER BY r.reader_id, l.due_date;