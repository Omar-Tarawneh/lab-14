/* create another table for the author with two columns id, name */

CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

/* insert the unique names of authors in the table */

INSERT INTO authors(name) SELECT DISTINCT author FROM books;

/* add a columns in the books table author_id */

ALTER TABLE books ADD COLUMN author_id INT;

/* go into each row and check the author name then get the id from authors table and put it in the columns author_id */

UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;


/* delete the columns author from books table */

ALTER TABLE books DROP COLUMN author;

/* change the type of the author_id into as a forgin key that reference to the primary key in author table */

ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);



