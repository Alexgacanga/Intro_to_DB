CREATE DATABASE IF NOT EXISTS alx_book_store
CREATE TABLE alx_book_store.Authors
(
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);
CREATE TABLE alx_book_store.Books(
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    FOREIGN KEY (book_id) REFERENCES Authors(author_id),
    price DOUBLE,
    publication_date DATE
);
CREATE TABLE alx_book_store.Customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);
CREATE TABLE alx_book_store.Orders
(
    order_id INT PRIMARY KEY,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE
);
CREATE TABLE alx_book_store.Order_Details(
    orderdetailid INT PRIMARY KEY,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    quantity DOUBLE
);

CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON alx_book_store.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;