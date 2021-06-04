--19장 사용자추가(CreateWorkSpace)시 오라클데스크탑(고전)X 대신
--웹 프로글램을 사용 (http://127.0.0.1:9000/apex/f?p=4950)
--SQL플러스X
--15장 PK생성시 자동으로 2가 생성 NOT NULL방지(빈값방지) UNIQUE(NO중복)
--제약조건(constraint) 이 자동생성  index(테이블)도 자동생성(검색
--ERD로 게시판테이블-[댓글|첨부파일]Foreign Key(외래키)부자관계생성
--14장 트랜잭션 DB단에서 사용하지 않고 
--스프링단에서 트랜잭션을 사용 @Transactional 인터페이스를 사용
--commit과rollback;(DML문:insert,update,delete)
--12장 테이블 구조생성(create;),변경(alter;),삭제(drop;)
--ERD 관계형 다이어그램으로 물리적 테이블 생성(포워드엔지니어링)
drop table tbl_member_del;
create table TBL_MEMBER_DEL
(
USER_ID VARCHAR(50) PRIMARY KEY
,USER_PW VARCHAR(255)
,USER_NAME VARCHAR(50)
,EMAIL VARCHAR(255)
,point NUMBER(11)
,ENABLED NUMBER(1)
,LEVELS VARCHAR(255)
,REG_DATE TIMESTAMP
,UPDATE_DATE TIMESTAMP
);
--ALTER 테이블로 필드명 변경(아래)
desc tbl_member_del;
alter table tbl_member_del rename column email to user_email;
--DEPT테이블의 deptno 숫자2자리 때문에 에러 -> 4자리 크기를 변경
DESC dept; --단 작은자리 큰자리로 변경 문제없음
ALTER TABLE dept MODIFY(deptno NUMBER(4));
--11장 서브쿼리
--단일행서브쿼리 필드값을 비교할때 비교하는 값인 단일한 
--다중행서브쿼리 테이블값을 select쿼리로 생성(레코드형식)
--10장 테이블 조인 2개 테이블 연결해서 결과를 구하는 예약어
--댓글개수 구할때
--카티시안프러턱트 조인(합집합-게시물10개,댓글100=110개~1000개)
--(인너)조인(교집합) 을 제일많이 사용
--아래조인방식 Oracle방식
select * from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SCOTT';
--표준쿼리(ANSI)방식(아래) inner 키워드 디폴드값임
select d.name, e.* from emp e inner join dept d 
on e.deptno = d.deptno 
where e.ename = 'SCOTT';
--조인과 그룹을 이용해서 댓글카운터도 출력하는 게시판리스트만들기
SELECT bod.bno,title,COUNT(*) AS reply_count
,writer,bod.reg_date,view_count 
FROM tbl_board BOD 
INNER JOIN tbl_reply REP ON bod.bno=REP.bno
GROUP BY bod.bno, title, writer, bod.reg_date, view_count
ORDER BY bod.bno;
--9장 패스(레포트용 함수사용)
--8장 함수(count,upper,lower,to_char,round...) 그룹함수
--having은 group by 의 조건문을 적습니다
--부서별 평균 연봉이 2000 이상인 부서의 번호과 부서별 평균급여
select deptno, round(avg(sal)) from emp 
--where avg(sal) >=2000; --검색조건
group by deptno 
having avg(sal) >= 2000; --그룹조건
--부서별 연봉의 합계를 구해서 제일 급여가 많이 지출되는 부서
-- 자바코딩에서는 소문자로 통일 
--DB셋팅에서 대소문자구분해서 사용할지 구분하지 않을지 셋팅
select * from (
select deptno, sum(sal) as dept_sal from emp group by deptno
) R order by dept_sal desc; --R의 역할은 Alias 별명입니다
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno ORDER BY SUM(sal) DESC;
--라운드함수(반올림) 소수점기준. round(10.05,2) 소수점2째자리 반올림
SELECT ename, round(sal,-3) from emp; --레코드가 여러개
select sum(sal) from emp; --1개의 레코드만 그룹함수라고 함
select round(avg(sal)) from emp; --평균 1개의 레코드로 출력
select count(*) from emp where sal >= (select round(avg(sal)) from emp);
--위 쿼리는 사원중에 평균연봉보다 많이받는 사람의 숫자.error
--위 AVG함수를 where조건에 사용못할때 서브쿼리를 이용합니다
select max(sal), min(sal),max(sal)-min(sal) as  "대표와사원의연봉차" from emp;
--DDL문(create; alter; drop;), DCL문(commit; rollback;)
--DML문(Data Manufacture Language) insert, update,delete
--insert문:테이블에 새로운 레코드(row)를 추가
CREATE TABLE dept02 AS SELECT * FROM dept WHERE 1=0;
--위 쿼리는 테이블을 복제하는 명령
--위처럼 쿼리를 실행 dept테이블과 구조와 내용이 똑같은 테이블생성
--where 조건이 붙으면, 구조는 같으나 내용은 빈 테이블이 생성
INSERT INTO dept02 (
--필드명
deptno, dname, loc
) VALUES(
10, '개발부서', '천안'
--바인딩값
);
insert into dept02 values(20,'디자인부','경기도');
--DCL명령어 인 커밋이 필수입니다
commit; --데이터베이스쿼리 직접입력한 결과는 반드시 커밋을 해주야지만 실제 저장이 됩니다 커밋을 하지않으면 여기만 보이고 다른곳은X
SELECT * FROM dept02 ORDER BY deptno;
--DELETE 는 레코드1줄을 지우는 명령
DELETE FROM dept02; --이렇게 사용하면 모든레코드 삭제됨(주의)
DELETE FROM dept02 where deptno >= 0; --모두삭제 where반드시포함 
--DROP table 테이블명은 테이블 자체를 물리적으로 없애는 명령
DROP TABLE dept02; --드롭테이블 커밋없이 바로 적용가능
CREATE table emp01 as select * from emp; --테이블복제명령
select * from emp01;
--UPDATE 테이블명 SET 필드명 = '바꿀값' where empno='특정ID'
UPDATE emp01 SET ename = '홍길동' where empno = 7839;
rollback; --DCL문롤백은 마지막 커밋 바로전까지 되돌립니다
UPDATE emp01 SET sal = sal*1.1; --모든직원연봉을 10%인상
UPDATE emp01 set hiredate = sysdate;
--머지 표준쿼리 (ANSI)가 아니라서 건너뜀
