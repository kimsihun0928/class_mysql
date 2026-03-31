create database if not exists study_cafe;

use study_cafe;

CREATE TABLE user(
	user_id bigint primary key auto_increment,
    name varchar(50) not null,
    phone varchar(20) unique not null,
    birth date not null
);

CREATE TABLE seat(
	seat_id int primary key auto_increment,
    seat_type enum ('오픈석','칸막이석', '타이핑석'),
);

CREATE TABLE reservation(
	reserve_id int primary key auto_increment,
    user_id bigint not null,
    seat_id int not null,
    seat_tyte varchar(20) not null,
    is_used boolean default false,
    start_at datetime default current_timestamp,
    end_at datetime not null,
    
    foreign key(user_id) references user(user_id),
    foreign key(seat_id) references seat(seat_id),
    foreign key(seat_type) references seat(seat_type)
);

CREATE TABLE review(
	id bigint primary key auto_increment,
    user_id bigint not null,
    title varchar(50) not null,
    content text not null,
    create_at datetime default current_timestamp,
    foreign key(user_id) references user(user_id)
);

-- 누가 결제, 언제 결제, 뭐로 결제, 얼마나 사용, 
CREATE TABLE payment(
	id bigint primary key auto_increment,
    user_id bigint not null,
    use_time int not null,
    pay_tool enum ('체크/신용카드','현금', '계좌이체'),
    paid_time datetime default current_timestamp,
    price decimal(10,2) default 1000,
    foreign key (user_id) references user(user_id)    
);

insert into user(name, phone, birth)
values ('김자바', '010-1234-5678','2001-01-01'),
	   ('김파이썬', '010-4444-4444','2000-02-22'),
       ('김씨쁠', '010-7777-7777','1998-12-25');
       
-- 의자 재고는 어떻게 하지
-- seat_id 는 각각 의자 고유의 id 이고 재고는 전체 재고인데 그러면 재고는 못쓰는건가
-- 

drop table user;
drop table seat;
drop table payment;
drop table reservation;
drop table review;

