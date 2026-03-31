CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 저자 테이블 (PK + UNIQUE)
CREATE TABLE author (
    author_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(20)  UNIQUE
);
drop table book;
drop table author;
alter table book 
drop foreign key book_ibfk_1;


-- 도서 테이블 (PK + FK)
CREATE TABLE book (
    book_id    INT           PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100)  NOT NULL,
    author_id  INT           NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    isbn       VARCHAR(20)   UNIQUE,
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 저자 데이터 입력
INSERT INTO author (name, email, phone) VALUES
('김자바',   'java@test.com',   '010-1111-1111'),
('이디비',   'db@test.com',     '010-2222-2222'),
('박스프링', 'spring@test.com', '010-3333-3333');

-- 도서 데이터 입력
INSERT INTO book (title, author_id, price, isbn) VALUES
('자바 완전정복',      1, 32000, 'ISBN-001'),
('MySQL 입문',          2, 28000, 'ISBN-002'),
('스프링 부트 실전',    3, 35000, 'ISBN-003'),
('자바 심화학습',        1, 29000, 'ISBN-004');

insert into author(name, email, phone) values
('정테스트','java@test.com', '010-9999-9999'); -- 김자바와 이메일 동일 (이메일은 유니크임)

INSERT INTO book (title, author_id, price, isbn)
VALUES ('신규 도서', 999, 20000, 'ISBN-005'); -- author_id 999는 존재안함 . fk 제약 위반

-- 시도 1: 중복 ISBN 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('또 다른 책', 1, 15000, 'ISBN-001');
-- 중복은 안됨

-- 시도 2: isbn 에 NULL 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('염리는 책', 2, 18000, NULL);
-- null 은 가능

DELETE FROM author WHERE author_id = 1;
-- book 의 author_id 가 참조중
alter table book
add constraint fk_author_id foreign key(author_id) references author(author_id) on delete cascade;
