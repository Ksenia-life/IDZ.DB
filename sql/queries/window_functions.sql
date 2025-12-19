WITH reader_stats AS (
    SELECT 
        r.reader_id,
        r.full_name,
        COUNT(l.loan_id) AS total_loans,
        SUM(CASE WHEN l.status = 'active' THEN 1 ELSE 0 END) AS active_loans
    FROM readers r
    LEFT JOIN loans l ON r.reader_id = l.reader_id
    GROUP BY r.reader_id, r.full_name
)
SELECT 
    reader_id AS "ID читателя",
    full_name AS "ФИО",
    total_loans AS "Всего книг взято",
    active_loans AS "Книг на руках",
    ROW_NUMBER() OVER (ORDER BY total_loans DESC) AS "Место по активности",
    RANK() OVER (ORDER BY total_loans DESC) AS "Ранг",
    AVG(total_loans) OVER () AS "Среднее по всем читателям",
    total_loans - AVG(total_loans) OVER () AS "Отклонение от среднего"
FROM reader_stats
ORDER BY total_loans DESC;