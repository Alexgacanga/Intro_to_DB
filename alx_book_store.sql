CREATE DATABASE IF NOT EXISTS alx_book_store

create table alx_book_store.Authors(
author_id int primary key,
author_name varchar(215));



create table alx_book_store.Books(
book_id int primary key,
title varchar(130),
foreign key (book_id) references Authors(author_id),
price double,
publication_date date);

create table alx_book_store.Customers(
customer_id int primary key,
customer_name varchar(215),
email varchar(215),
address text);

create table alx_book_store.Orders(
order_id int primary key,
foreign key(order_id) references Customers(customer_id),
order_date date);


create table alx_book_store.order_details(
orderdetailid int primary key,
foreign key (orderdetailid) references Orders(order_id),
foreign key (orderdetailid) references Books(book_id),
quantity double);
