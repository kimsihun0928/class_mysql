-- 실습용 DB 생성
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 도서 테이블
CREATE TABLE book (
    book_id    INT          PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100) NOT NULL,
    author     VARCHAR(50)  NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    stock      INT          DEFAULT 0,
    published_at DATE,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP
);

-- 회원 테이블
CREATE TABLE customer (
    customer_id INT          PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    phone       VARCHAR(20),
    grade       VARCHAR(10)  DEFAULT '일반'
);

select* from customer;

-- 구매 테이블
CREATE TABLE purchase (
    purchase_id  INT  PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT  NOT NULL,
    book_id      INT  NOT NULL,
    quantity     INT  NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    purchased_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id)     REFERENCES book(book_id)
);

INSERT INTO book (title, author, price, stock, published_at) values
('자바 완전정복', '김자바', 32000, 50, '2023-06-15');

select * from book;

INSERT INTO book (title, author, price, stock, published_at) values
('MySQL입문', '이디비', 28000, 30, '2022-03-10'),
('스프링 부트 실전', '박스프링', 35000, 20, '2023-11-01'),
('파이썬 기초', '최파이', 25000, 100, '2021-08-20');

INSERT INTO customer(name, email) values
('홍길동', 'hong@test.com'),
('김영희', 'kim@test.com');

INSERT INTO purchase(customer_id, book_id, quantity, total_price)
values (1, 1, 2, 32000*2);

select * from purchase;

-- 오류가 발생하는 쿼리
INSERT INTO purchase (customer_id, book_id, quantity, total_price)
VALUES (999, 1, 1, 32000.00);

-- 오류 원인 : 참조 무결성 위반

-- 외래키 customer_id 는 1, 2 밖에 없는데 999를 가져옴 
INSERT INTO purchase (customer_id, book_id, quantity, total_price)
VALUES (999, 1, 1, 32000.00);

