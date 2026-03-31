use shop;

-- member 회원가입
-- orders 테이블에 1번 회원이 주문한 목록의 데이터가 있다고 가정 
-- 두 테이블이 FK 관계일 때 member 테이블에 접근해서 1번 회원을 삭제할 수 있을까

select * from member;

select * from orders;

insert into orders(member_id, total_price) values (4, 10000);

-- FK 위반 why? orders 테이블에서 member_id 1번 데이터가 존재하기 때문에
-- member 테이블에 1번 회원을 삭제하면 orders 테이블에 member_id 1 은 무의미한 데이터가됨
delete from member where id = 1;

delete from member where id = 2;

-- 결론 orders 테이블에 존재하는 member_id 의 값 1을 먼저 삭제하고 member 테이블에 pk인 1번 회원을 삭제할수있다.
-- orders 테이블에 데이터 삭제
delete from orders where member_id = 1;

-- --------------------------------
-- [1단계] 현재 orders 테이블에 걸린 정확한 FK 이름을 확인 (명령문, GUI 확인)
show create table orders; -- orders 테이블 만들때 사용한 구조 

-- 기존 제약 조건을 삭제함.
alter table orders drop foreign key orders_ibfk_1;

-- [2단계] CASCADE 옵션을 추가하여 제약 조건을 추후 새로 정의할 수 있습니다.
-- 기존에는 테이블 생성 시 키 제약을 추가 했다면 테이블 생성 후에도 키를 변경, 수정, 삭제 가능합니다.
alter table orders
add constraint fk_orders_member
foreign key(member_id) references member(id)
on delete cascade
on update cascade;




-- 테스트
select * from member;
select * from orders;

-- 연쇄 수정 확인
update member set id = 99 where id = 4;

-- 연쇄 삭제 확인
delete from member where id = 99;