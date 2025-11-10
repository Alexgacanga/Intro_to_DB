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
CREATE TABLE alx_book_store.order_details(
    orderdetailid INT PRIMARY KEY,
    FOREIGN KEY (orderdetailid) REFERENCES Orders(order_id),
    FOREIGN KEY (orderdetailid) REFERENCES Books(book_id),
    quantity DOUBLE
);