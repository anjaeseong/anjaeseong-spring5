package com.edu.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * 이 클래스는 오라클과 연동해서 CRUD를 테스트하는 클래스입니다
 * 과장(이사,팀장) JUnit CRUD까지 만들어서 일반사원들에게 공개 + 회원관리
 * @author 안재성
 *
 */
//RunWith인터페이스 현재클래스가 Junit실행클래스라고 명시
@RunWith(SpringJUnit4ClassRunner.class) 
//경로에서 **(모든폴더명시), *(모든파일명명시)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {
	//디버그용 로그 객체변수생성
	private Logger logger = Logger.getLogger(DataSourceTest.class);
	//dataSource 객체는 데이터베이스객체를 pool로 저장해서 사용할때 DataSource 클래스를 사용(아래)
	@Inject //인젝트는 스프링에서 객체를 만드는 방법, 이전 자바에서는 new 키워드로 객체를 만들었고...
	DataSource dataSource; //Inject로객체의 메모리 관리를 스프링이 대신해줌
	//Inject는 자바8부터 지원 이전자바7에서 @Autowired로 객체를 만들었음
	@Test
	public void oldQueryTest() throws Exception{
		//스프링빈을 사용하지 않을때 예전방식: 코딩테스트에서는 스프링설정을 안쓰고 직접DB 아이디/암호 입력
		Connection connection = null;
		connection = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521/XE","XE2","apmsetup");
		logger.debug("데이터베이스 직접 접속이 성공하였습니다 DB종류는"+connection.getMetaData().getDatabaseProductName());
		//직접쿼리를 날립니다. 날리기전 쿼리문장 객체생성 statement
		Statement stmt = connection.createStatement();
		//위 쿼리문장객체를 만드는 이유? 보안(SQL인젝션공격을 방지)
		//stmt객체가 없으면 개발자가SQL인젝션 방지코딩을 넣어야 합니다
		//insert쿼리문장만듬(아래)
		//예전 방식으로 더미데이터(샘플데이터)를 100개를 입력합니다
		/*
		 * for(int cnt=0;cnt<100;cnt++) {//errror deptno 자리수가 2자리로 고정이 되어서 100는 입력시 에러
		 * stmt.executeQuery("insert into dept02 values("+cnt+",'디자인부','경기도')"); }
		 */
		//인서트 업데이트 삭제시sql디벨러퍼에서는 커밋이 필수지만, 외부java클래스에서는 자동커밋이 됩니다
		//stmt.executeQuery("insert into dept02 values(20,'디자인부','경기도')");
		//테이블에 입력되어 있는 레코드셋를 select 쿼리stmt문장으로 가져옴(아래)
		ResultSet rs = stmt.executeQuery("select * from dept order by deptno"); //20년전 작업방식
		//위에서 저장된 rs객체를 반복문으로 출력합니다(아래)
		while(rs.next()){
			//rs객체의 레코드가 없을때까지 반복
			logger.debug(rs.getString("deptno")+" "+rs.getString("dname")+
					" "+rs.getString("loc"));
		}
		stmt = null; //메모리 반환
		rs = null; //메모리 반환
		connection = null; //메모리 초기화
	}
		
	@Test
	public void dbConnectionTest() {
		//데이터베이스 커넥션 테스트: 설정은 root-context의 빈을이용
			try {
			Connection connection = dataSource.getConnection();
				logger.debug("데이터베이스 접속이 성공하였습니다 DB종류는"+
			connection.getMetaData().getDatabaseProductName());
			}catch (SQLException e) {
				logger.debug("데이터베이스 접속이 실패하였습니다");
			}
			
		}	
	@Test
	public void junitTest() {
		//로거 장점>조건에 따라서 출력을 조정할수있음
		logger.debug("Junit테스트 시작 입니다");
	}
}
