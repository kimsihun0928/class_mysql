-- DCL(Data Control Language) - 권한을 관리한다alter

-- 사용자 생성 (사람, 시스템에게 줄 수 있다)
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 조회 권한 부여
GRANT SELECT ON school.student TO 'user1'@'localhost';

-- 권한 회수
REVOKE SELECT ON school.student FROM 'user1'@'localhost';


-- 도전 문제
-- 외부사용자가 사용할 계정을 생성하고 조회 권한만 주고 접속 확인(계정을 받은 사람)
CREATE USER 'user2'@'192.168.7.245' IDENTIFIED BY '1234';

GRANT SELECT ON school.student TO 'user2'@'192.168.7.245';

-- 풀이

-- 1. 로컬 접속 계정과 별개로 외부 접속용 계정 모두 만들어줘야한다. 필요없다면 로컬은 생성 안해도됨
CREATE USER 'tenco'@'localhost' IDENTIFIED BY 'asd1234!';
CREATE USER 'tenco'@'%' IDENTIFIED BY 'asd1234!'; -- 모든 IP 허용alter

-- 2. 권한 부여 select, insert .. 추가 가능. 모든 권한 부여 (ALL PREVILEGES)
GRANT ALL PRIVILEGES ON school.* TO 'tenco'@'localhost';			-- *.* RDBMS 안에 모든 db 모든 테이블
GRANT ALL PRIVILEGES ON school.* TO 'tenco'@'%';

-- 권한 확인
SHOW GRANTS FOR 'tenco'@'localhost';
SHOW GRANTS FOR 'tenco'@'%';

-- 참고. 추가된 권한이 바로 적용 안될수도 있음
FLUSH PRIVILEGES; -- 바로 적용

-- 3. 권한 회수
REVOKE ALL privileges ON school.* FROM 'tenco'@'localhost';
REVOKE ALL privileges ON school.* FROM 'tenco'@'%';

-- 3. 권한 회수1