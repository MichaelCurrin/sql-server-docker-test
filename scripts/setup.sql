-- Drop Books table if it exists
IF OBJECT_ID('dbo.Books', 'U') IS NOT NULL BEGIN DROP TABLE dbo.Books;

END;

-- Drop Authors table if it exists
IF OBJECT_ID('dbo.Authors', 'U') IS NOT NULL BEGIN DROP TABLE dbo.Authors;

END;

-- Create Authors table
CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY IDENTITY(1, 1),
  -- Auto-incrementing ID
  Name NVARCHAR(100) NOT NULL,
  BirthYear INT
);

-- Create Books table
CREATE TABLE Books (
  BookID INT PRIMARY KEY IDENTITY(1, 1),
  -- Auto-incrementing ID
  Title NVARCHAR(100) NOT NULL,
  AuthorID INT,
  PublishedYear INT,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) -- Establishing foreign key relationship
);

-- Insert Authors
INSERT INTO
  Authors (Name, BirthYear)
VALUES
  ('J.K. Rowling', 1965);

INSERT INTO
  Authors (Name, BirthYear)
VALUES
  ('George R.R. Martin', 1948);

INSERT INTO
  Authors (Name, BirthYear)
VALUES
  ('J.R.R. Tolkien', 1892);

-- Insert Books
INSERT INTO
  Books (Title, AuthorID, PublishedYear)
VALUES
  (
    'Harry Potter and the Sorcerer''s Stone',
    1,
    1997
  );

INSERT INTO
  Books (Title, AuthorID, PublishedYear)
VALUES
  ('A Game of Thrones', 2, 1996);

INSERT INTO
  Books (Title, AuthorID, PublishedYear)
VALUES
  ('The Hobbit', 3, 1937);

INSERT INTO
  Books (Title, AuthorID, PublishedYear)
VALUES
  (
    'Harry Potter and the Chamber of Secrets',
    1,
    1998
  );
