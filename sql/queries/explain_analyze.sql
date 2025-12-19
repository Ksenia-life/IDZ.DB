EXPLAIN ANALYZE
SELECT 
    r.reader_id,
    r.full_name,
    b.title,
    l.loan_date,
    l.due_date,
    l.status
FROM readers r
INNER JOIN loans l ON r.reader_id = l.reader_id
LEFT JOIN books b ON l.book_id = b.book_id
WHERE l.status IN ('active', 'overdue')
ORDER BY r.reader_id, l.due_date;
