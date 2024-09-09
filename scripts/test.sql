-- List tables
SELECT
    name AS TableName
FROM
    sys.tables;

-- Get one author
SELECT
    TOP 1 *
FROM
    Authors;

-- Get one book
SELECT
    TOP 1 *
FROM
    Books;

-- Aggregate
SELECT
    a.Name AS AuthorName,
    COUNT(b.BookID) AS NumberOfBooks
FROM
    Authors a
    LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY
    a.Name;
