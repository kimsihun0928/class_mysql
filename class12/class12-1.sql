
-- DDL

select * from product;
-- product 테이블에 is_deleted 컬럼을 추가 (소프트 삭제용)
alter table product add column is_deleted boolean default false;

select * from orders;
alter table orders add index idx_created_at (created_at);
show index from orders;


-- DML 
select * from member;
select * from member where grade = 'VIP';

select * from orders where status = '배송중';

select * from product;
select * from product where stock < 50;

select * from product where category_id = 4;
select * from category;

-- update 연습 (반드시 실수를 하지말자)

-- 김영희 등급을 GOLD 로 업그레이드
select * from member where name = '김영희';
update member
set grade = 'GOLD'
where name = '김영희';

-- 주문 상태 변경 (결제 대기 --> 결제완료)
select * from orders where id = 6;
update orders
set status = '결제완료'
where id = 6;

-- 상품 재고 감소(구매 시 처리되어야함)
select * from product;

update product
set stock = stock -1
where name like '삼성%';
	
update product
set price = price * (1-0.033)
where name like '삼성 갤럭시%';

-- delete (소프트 삭제)
select * from product;

update product
set is_deleted = true
where id = 1;

-- 삭제되지 않은 상품만 조회
select * from product where is_deleted = false;

insert into member (email, name) 
values ('hong@test.com', '홍길동2');

select * from member;
-- 유니크 키 추가, 안되는 이유 확인, 처리

alter table member add constraint uk_email unique (email) ;

alter table member add unique (email);

-- UNIQUE 위반
delete from member where email = 'hong@test.com';
delete from orders where member_id = 1;

select * from member;
select * from orders;

-- FK 위반
insert into orders (member_id, total_price) values (999, 5000);

--  not null 위반
insert into product (category_id, price, stock) values (1, 500, 10);

select name, price
from product
where price between 100000 and 1500000;

select *
from product
where name like '%삼성%';

select name, email, grade
from member
where grade in('VIP', 'GOLD');

select * from product order by price desc limit 3;

ALTER TABLE product ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;

select name, stock, price
from product
where is_deleted = FALSE 
AND stock >= 30 
AND price >= 50000;

select * from product;

update product
set stock = stock + 10
where category_id = 1
AND stock < 30;

select * from orders;
update orders
set status = '결제완료'
where status = '결제대기';

select * from member;

update member
set grade = 'GOLD'
where email IN('hong@test.com', 'lee@test.com');

-- 재고가 0인 테스트 상품 3개 추가
INSERT INTO product (category_id, name, price, stock, description, is_deleted) VALUES
(2, '단종 청바지',   89000.00, 0, '재고 소진으로 판매 종료 예정', FALSE),
(3, '품절 과자 세트', 15000.00, 0, '일시 품절 상태',              FALSE),
(1, '구형 이어폰',   35000.00, 0, '신모델 출시로 재고 소진',      FALSE);

-- 추가 확인
SELECT name, stock, is_deleted FROM product WHERE stock = 0;

delete from product where stock = 0 AND is_deleted = FALSE;

select * from product where category_id = 4;

update product
set is_deleted = TRUE
where category_id = 4
AND price >= 40000;

select * from product where category_id = 4 AND is_deleted = FALSE;