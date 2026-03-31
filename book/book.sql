create database if not exists book_db;
use book_db;

CREATE TABLE books(
	book_id int primary key,
    title varchar(50) not null,
    price decimal(10,2) unique not null,
    stock int default 0,
    lented boolean default FALSE
);

CREATE TABLE customers(
	customer_id int primary key auto_increment,
    name varchar(20) not null,
    email varchar(50) unique not null,
    phone varchar(20) unique default null
);

CREATE TABLE orders(
	id int primary key auto_increment,
	book_id int not null,
	customer_id int not null,
    price decimal(10,2) not null,
    quantity int not null,
    ordered_at DATETIME default current_timestamp,
    foreign key (book_id) references books(book_id),
    foreign key (customer_id) references customers(customer_id),
    foreign key (price) references books(price)
);

insert into books(book_id, title, price, stock)
values (100, '오만과 편견', 8000, 2),
	   (101, '데미안', 9000, 4),
       (200, '괴테는 모든 것을 말했다', 17000, 5);
       
insert into customers(name, email, phone)
values ('융', 'yung@uuu@com','010-5555-5555');

insert into customers(name, email)
values ('프로이트', 'proit@qqq.com');

insert into orders(book_id, customer_id, price, quantity)
values (101, 2, 9000, 2);
-- orders 에서 대출을 했을 때 books 테이블의 lented를 어떻게 true로?

drop table orders;
drop table books;
drop table customers;

select * from books;
select * from customers;
select * from orders;