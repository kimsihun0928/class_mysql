-- 샘플 데이터 구축

select * from student;
select * from subject;
select * from enrollment;

-- 1. 학생 테이블
insert into student(student_id, name, grade, major, phone) values
(1001, '김철수', 2, '컴퓨터공학', '010-1234-1234');

insert into student values
(1002, '이영희', 3, '경영학', '010-2222-2222'),
(1003, '박민준', 1, '전자공학', '010-3333-3333'),
(1004, '최지아', 4, '컴퓨터공학', '010-4444-4444'),
(1005, '한수연', 2, '경영학', '010-5555-5555');

-- 2. 과목 테이블
insert into subject(subject_id, subject_name, credit, professor) values
(101, '데이터베이스', 3, '김교수'),
(102, '알고리즘', 3, '이교수'),
(103, '웹프로그래밍', 2, '박교수'),
(104, '운영체제', 3, '최교수');

-- 3. 수강 데이터
desc enrollment;
insert into enrollment(enrollment_id, student_id, subject_id, score, enrolled_at) values
(2, 1001, 101, 88.5, '2026-03-02'),
(3, 1002, 102, 88.5, '2026-03-02'),
(4, 1003, 103, 88.5, '2026-03-02'),
(5, 1004, 104, null, '2026-03-02');

select *
from enrollment
where student_id = 1001;

select *
FROM subject
WHERE subject_id = 101;