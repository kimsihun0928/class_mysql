-- DML (데이터를 다룬다)

SELECT * FROM student;

-- 데이터 추가 (insert)
INSERT INTO student(student_id, name, grade, major, phone) VALUES
(1001, '김철수', 2, '컴퓨터공학', '010-1234-1234');

INSERT INTO student(student_id, name, grade, major, phone) VALUES
(1002, '이영희', 3, '경영학', '010-2222-3333'),
(1003, '박민준', 1, '전자공학', '010-4444-5555');

-- 데이터 조회 (SELECT)
SELECT * FROM student;
-- 조건절 추가하기
SELECT name 이름, major 전공, grade from student WHERE major like '%공학';

-- 데이터 수정 (UPDATE) (주의 - 조건절이 없으면 전체 수정이됨. 난리남!)
UPDATE student SET grade = 3 WHERE student_id = 1001;

-- 데이터 삭제 (DELETE) (주의 - 조건절 없으면 전체 삭제됨 난리남!)
DELETE FROM student WHERE student_id = 1003;