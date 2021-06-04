--DBSC: Description 테이블구조를 설명
DESC dept;
--select: 테이블내용 조회, where 조회조건, as(Alias)별칭으로 필드명이 길때
--concat오라클 내장함수는 레포트 작성시
SELECT 
concat(deptno,' 번')as"부서번호"
, dname as"부서명"
, concat(loc,' 시')as"위치"
FROM dept 
WHERE loc = 'NEW YORK';
-- DUAL 가상테이블이름 테이블이없는 내용을 select할때
SELECT concat('안', '재성') from dual;
SELECT 3+5 as "3더하기5은" from dual;
--레코드(row) : 컬럼(필드field)들로 구성
SELECT concat(COUNT(*),'명') as"연봉이 2000인 직원" FROM emp WHERE sal > 2000;
--큰따옴표(필드명), 작은따옴표(문자처리=비교,결합)
SELECT * FROM emp WHERE ename != 'KING'; 
SELECT * FROM emp WHERE hiredate >='1982/01/01';
--OR +(합집합) , AND X(교집합)
SELECT * FROM emp WHERE deptno = 10 OR job = 'MANAGER';
SELECT * FROM emp WHERE sal not BETWEEN 2000 AND 3000;
SELECT * FROM emp WHERE hiredate BETWEEN '1981/01/01' and '1981.12.31';
SELECT * FROM emp WHERE comm not in (300,500,1400);
--LIKE 조회, 와일드카드=% 조회
-- 중)키워드에 괄호가 있으면  함수 upper(), concat(), count()
SELECT * FROM emp WHERE ename LIKE upper('k%');
SELECT * FROM emp WHERE ename LIKE '%N';
-- null널 이 중요한 이유: null값이 있으면 검색이X
-- 그러면 null값이 필드에 있을때 검색은?
SELECT * FROM emp WHERE comm is null;
-- NVL(Null VaLue) 널값을 대치하는 함수
-- 사원중에 커미션을 0원 받은사람은? null사람도 구하려면?
SELECT nvl2(comm,0,100),E.* from emp E WHERE NVL(comm,0) = 0;
-- 오라클은 표준쿼리X, ANSI쿼리 표준입니다
SELECT CASE WHEN comm is null THEN 0 WHEN comm = 0 THEN 100 WHEN comm > 0 THEN 100 END AS "CASE출력문"
,DECODE (comm,null,0,100),NVL2(comm,100,0),E.* from emp E; --WHERE NVL(comm,0) = 0;
-- 연봉 기준으로 정렬 sort = 순서 order by 필드명 오름차순[초기값]|내림차순
-- 중)서브쿼리? select쿼리가 중복되어있는...) 입니다 
SELECT ROWNUM, E.* FROM(--테이블명
SELECT * FROM emp  ORDER BY sal DESC--내림차순
) E WHERE ROWNUM = 1;
-- 위 서브쿼리문장을 해석 할때는 안쪽부터 해석
-- 위 정렬에서 1등만 구할 limit는 Mysql(마리아DB)의 명령어. 오라클X
-- Mysql(마리아DB) AI(AutoIncrement)자동증가값 명령 오라클X
-- 중복레코드를(row)를 제거하는 명령어 distinct
SELECT deptno AS "부서번호" FROM emp; --사원수대로 부서번호가 출력
SELECT DISTINCT deptno AS "부서번호" FROM emp;
-- 중)문자열을 연결할때 concat함수외에 || 파이프라인 2개를 겹쳐서 구현
SELECT ename ||' is a '|| job AS "문자열 연결" FROM emp;
-- 여기까지 select 마무리
-- 이후에는 CRUD중에 Insert, UPdate, Delete 3개의 쿼리로 끝
-- 함수용어 ABS(Absolute절대값), Floor(바닥함수1.5=1) <-> Ceil(천장함수1.5=2)
-- ROUND(반올림), TRUNC(Truncate버리는함수), Mod(나머지구하는함수)
-- Upper(대문자), Lower(소문자), Legth(길이구하는함수)
-- Instr(문자의 위치를 구하는 함수), Substr(매개변수로 입력한 숫자위치만큼 문자열을 추출하는 함수)
-- Lpad(LeftPadding왼쪽여백), Rpad(오른쪽여백), 레포트프로그램에서 출력조정시 사용
-- Trim(왼쪽,오른쪽 문자열을 잘라내는 함수)
-- 날짜 sysdate,systimestamp 로 오라클전용 함수로서 게시물입력시간, 회원등록시간
SELECT to_char(systimestamp, 'yyyy-mm-dd hh24:mi:ss:ff') from dual;
-- 위 to_char(날짜를 문자열로 변환)형 변환함수라고 합니다
SELECT sysdate + 1 from dual;
SELECT sysdate - 1 FROM dual;
--아래는 6개월간 회원정보 수정이 없는 회원에게 메일발송서비스를 처리
SELECT * from TBL_MEMBER WHERE UPDATE_DATE < ADD_MONTHS(SYSDATE,-6);
