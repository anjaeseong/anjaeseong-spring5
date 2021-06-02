#### 작업예정.
- 1달간(프론트엔드)은 주로 UI 계속진행(VS code개발환경) 하면서,
- 피곤할때, 자바|스프링(이클립스-egov전자정부프레임워크개발환경) 기본언어실습진행.
- 피곤할때, 오라클DB(SQL디벨러퍼개발환경) Ansi-SQL(표준SQL)기본언어실습진행CRUD.
- 2달째부터(백엔드), 주로 스프링으로 실습이 진행(납품용-이력서포트폴리오용).
- VS code에서 만든 UI를 이클립스에서 JSP로 변경 한 후 스프링웹프로젝트를 진행합니다.

#### 20210603(목) 작업예정
- JUnit테스트: 오라클 연동한 후 회원관리부분CRUD 테스트 진행
- 오라클 CRUD 작업예정

#### 20210602(수) 작업
- 쓰레드:thread, 실행되는 프로그램을 명시 1개 프로그램에는 보통1개 쓰레드가 실행(우리소스는 여기까지) 특이한 경우(http웹네트워크 프로그램인경우-게시물 다운로드버튼 다운로드100G 쓰레드가 실행후 리스트 버튼을 크릭했을때 목록보기 쓰레드가 동시에 실행-안드로이드앱에서필요) 여러개 쓰레드 실행이 필요한상황이 있습니다
- 예외처리: Throwble 오브젝트가 실행시 에러가 발생하면 예외(내용)를 보낼때 사용하는 클래스Throwble클래스
- 스프링앱세서는 예외(에러)정보를 스프링처리합니다
- 자바앱에서는 예외(에러)정보를 개발자가 처리합니다(개발자가 손이 많이갑니다) 지금 실습합니다
- 예외처리: 에러발생시 프로그램이 중지되는것을 방지하고 계속 프로그램을 사용할수 있도록 처리하는 방법=Exception
- 패키지는 관련기능을 한곳에 모아서 개발자 관리하기 편하게 하기 위해서 구분한 이름(폴더명)
- Controller클래스+home/index.jsp(화면) 한쌍 입니다 그래서 컨트롤러크랠스 만든변수를 index.jsp에서 사용가능하게 됩니다
- 안드로이드앱= 액티비티(java) + 레이아웃.xml(화면) 한쌍
- C#닷넷= test.aspx.cs(프로그램) + test.aspx(화면)
- 일반홈페이지(cafe24)-URL직접접근이 가능(보안위험높음)
- MVC웹프로그램 차이점-URL직접접근이 가능X(보안위험낮음)-관공서,대학,은행 주사용
- MVC프로젝트에도 URL직접접근이 가능한  resources폴더 직접접근이 가능-static 콘텐츠(html,css,js)를 모아놓은 폴더 view폴더jsp는 직접접근이 불가능
- views폴더처럼 직접접근이 불가능한 컨텐츠는 Controller(라우터)로 접근하게 됨
- views/home/indexs.jsp 엑박처리 분해는 관리자단 실습후 작업합니다
- 개발순서: ERD제작 -> html제작-> jsp제작(현재:관리자단10기능 작업후 사용자단5단가능
- admin 폴더 만든이후 분해  Junit실습후 작업합니다
- Junit(java Unit Test): 자바 단위 테스트(서비스프로그램만들기전 프로토타입 시제품 제작) - Junit CRUD 작업후 본격 작업시작예정
- 로거의 레벨: DEBUG > INFO > WARN > ERROR > FATAL
- 개발할때: DEBUG 로거레벨을 설정
- 납품할때: WARN 으로 로거레벨을 변경
- admin 부터 프로그램 작업 시작예정
- 4장 패키지와 예외처리 실습 후 오라클CRUD 실습

#### 20210601(화) 작업
- 에러: 404(file not found 경로이상일때), 500(자바프로그램에러)
- 프로젝트의 버전을 올립니다-> 외부라이브러리 부분의 버전을 올림 -메이븐 컴파일러-메뉴사용
- Controller클래스에서 생성한 변수 사용(자바)model객체전송(스프링)returnhome -> home.jsp출력
- 출력하는 방식: 25년전부터 방식EL(Express Language)방식출력-${변수} ,<%=${변수} %>
- 많이사용하는 방식:JSTL방식(*표준) 사용 출력,반복,조건 등등 다양한 방식
- 언어를배우는 순서:주석> 디버그하는방법 > 변수 > 메서드(함수) > 클래스 > MVC모델
- 디버그하는 방법: 자바(system.out 이용해서 콘솔창에 출력)
- 스프링에서는 logger(로거) 를 사용해서 디버그 내용을 출력
- 스프링이 관리하는 클래스(빈)의 종류 3가지 (사용법은 개발자가 만드는 클래스명 상단에 입력)
- 1.@Controller 클래스빈 : 라우터역할 메서드를 만듭니다 (라우터역할의 클래스 기능)
- 2.@Service 클래스빈       : 비지니스로직 메서드를 만듭니다 (개발자위주의 외부클래스 기능)
- 3.@Repository 클래스빈 : Model처리 메서드를 만듭니다 (DB핸들링외부클래스사용)
- 위 3가지의 @를 사용하지 않는 클래스는 DI(객체생성-의존성주입)x, AOP(x), Ioc(제어의 역전- 자동메모리관리)x
- 4장 패키지와 예외처리 실습
- 프런트 개발자가 작업한 결과 백엔드 개발자가 확인
- 일괄바꾸기1. "/home -> "/resources/home
- 일괄바꾸기2. '/home -> '/resources/home

- VS code 작업한html를 이클립스에 배치를합니다(프런트개발자가 작업결과 백엔드개발자가 받아서 배치합니다)
- resources 폴더에 static컨텐츠(html,css,js,font)
- ERD기준으로 게시판UI 수정합니다.-board-write.html 부터 시작
- 오늘부터는 VS code-> 이클립스에서 작업합니다
- 관리자단 AdminLTE적용-스프링시간 선택 후 아래 작업진행예정
- (회원관리CRUD-html, 게시판생성관리CRUD-jsp)
- html을 분해(1개의 페이지를 2개로 분해,1.header.jsp(메뉴공통), 2.footer.jsp(공통))
- 이클립스로 작업한 html 내용을 -> resources 폴더(admin,home,root파일까지)로 배치
- 스프링 작업의 시작


#### 20210531(월) 작업
- 토드(sql디벨러퍼와 비슷한 상용)에서는 버튼으로 포워드엔지니어링이 처리
- 무료sql디벨러퍼에서는 버튼X DDL을 실행해서 포워드엔지니어링을 처리
- 참고 mysql용 워크벤치는 무료이지만 버튼으로 포워드엔지니어링이 가능
- 초기DDL문 : Data Definition Language 데이터 정의 언어 Create table문
- 유지DCL문: Data Control Language 데이터 제어언어      commit, rollback
- 개발DML문: Data Manufactrue Language 데이터 조작언어 CRUD 쿼리
- ERD 그림만든것을 물리 테이블로 forward 엔지니어링
- 데이터 딕셔너리를 모뎀과 동기화: 자료사전(데이터의 데이터)을 DB테이블과 동기화
- 데이터 딕셔너리는 메타 데이터와 동일합니다:콘텐츠X, 구조X, 구성 정보만 존재
- 물리체이블을 ERD 그림으로 만드는것: reverse 엔지니어링(기존DB분석시 사용)
- 스프링시큐리티는 2단계: 구현예정
- 1단계. 로그인인증(ENABLED): AUTHENTICATION (로그인X, 글쓰기 기능X, 괸리자X)
- 2단계. 권한체크(LEVELS): AUTHORITY (관리자-admin URL 접근가능, 일반회원은 사용자홈페이지에서 공지사항은X 갤리리만 사용가능합니다)
- 1:N관계? 게시물1개에 댓글n개 달릴수있음
- E-R다이어그램은 그림일뿐 물리DB(테이블)은 ERD기준으로 생성가능
- PK를 AI(Auto Increment자동증가)로 만들기: 오라클(시퀸스객체로기능구현), Mysql(AI라는 필드속성으로 처리)
- ERD에서 Relation 생성: 게시판타입테이블(부)과 게시물관리테이블(자)의 관계를 생성
- 부자의 관계는 부모의 PK를 기준 자식에게는 FK(Foreign Key)로 관계를 맺습니다
- 게시판타입: notice, gallery 2가지가 존재한다면
- Relation관계가 필요한 이유: 공지사항이나 갤러리 게시판이 아니면 개발자가 예외처리를 하지 않아도 다른 게시판으로 등록하는 상황 발생이 되지 않게 됨
- 데이터 무결성을 유지하는 역할(외래키  관계)
- 필드데이터형3: Timestamp(시간도장) 년월일시분초밀리초, DATE(년월일까지)
- 필드데이터형2: CLOB(CHAR LONG BYTE) 글내용이 많을때 사용한는 데이터 형태
- 필드 데이터형:VARCHAR2(2바이트를1글자-한글), VARCHAR(1바이트1글자-영문전용)
- 테이블구성: 필드(컬럼,열)=테이블의 멤버변수(자바VO클래스의 멤버변수)
- 필드구성: PrimayKey(주키,기본키,고유키)=테이블영역에서 고유한ID를 말함(중복되지 않는 값)
- PK예(개인을 식별할 수 있는값): 로그인id, 개인이메일주소, 주민번호등등, 게시판타입
- RDBMS : RelationDataBaseManagementSystem(관계형데이타베이스 관리시스템)
-오라클: 테이블스페이스(TableSpace) = 스키마(Scheme:Mysql) = 데이터베이스(DB-MSSQL)
- 지난주 금요일 오라클 웹용 관리프로그램에서 XE라는 테이블스페이스를 XE사용자로 추가했음
- EntitRelationDiagram (ERD-객체관계그림): Entity=테이블
- 데이터 모델: Model Object를 형상화 시킨것을 모델이라고 함 데이터베이스를 말함
- MVC 스프링프로젝트에서 M이 Model이고 스프링프로젝트 구성중에 DB를 가리킴
- 참고로 V는 View고 jsp를 말합니다
- 참고로 C는 Controller고 클래스를 말합니다
- 설치시 암호는 apmsetup로 통일합니다


#### 20210528(금) 작업.
- 추상클래스 실습은 오늘, 인터페이스 실습은 스프링에 엄청하시게 됩니다.
- extends관계클래스에서 this.(현재클래스) , super.(부모클래스)
- 다형성? 메서드 @오버라이드(상속), 메서드 오버로드(동일함수명의 파라미터의 개수, 종류틀린메서드) 구현됩니다.
- 오버라이드: 상속받아서 재정의 메서드 @오버라이드 = 다형성구현했다.
- 오라클11g ExpressEditon 설치예정. OracleXE112_Win64.zip
- SQL디벨러퍼를 다운받아서 압축풉니다. - ERD제작할 예정.
- StructuredQueryLanguage: 구조화된 질의 언어(오라클서버) -> 답변
- QueryString: URL에서 전송하는 값(서버에 질의문)을 문장으로 저장한내용 ?로 시작.
- CommendLineInterface : SQL*Plus 터미널화면으로 SQL쿼리 실행 X
- GrapicUserInter: SQL디벨러퍼 윈도우화면 에디터에서 SQL쿼리 실행 O
- SQL Developer 프로그램으로 ERD 다이어그램그림으로 프로그젝트 구조제작예정.
- EntityRelationDiagram: 테이블관계도형(아래) 
- 프로젝트 진행: 발주(클라이언트) -> 수주(개발사) -> 디자인UI(Client-Dev) -> ERD(이사,팀장) -> 코딩시작(ERD보면서+UI소스에 프로그램입히기)
- ERD에서 SQL쿼리가 생성 -> 물리테이블을 생성.
- -------------------------------------------------
- 첨부파일(자식)->게시판테이블(부모)<-댓글테이블(자식)
- 자바앱에서는 객체를 생성후 사용이 끝나면, 메모리에서 삭제하는 명령이 필수.
- 객체를 메모리에서 삭제: Object = null; Object.close();
- 스프링에서는 내장된 가비지컬렉터(garbage쓰레기수집가)가 자동실행 사용하지 않는 객체를 자동으로 지워줌.
- 위와 같이 개발자가 하던 메모리관리를 스프링의 대신 = IoC(Inversion Of Control)제어의 역전. 스프링 특징3가지(IoC, AOP, DI)
- 수업시작전, static메서드와 객체의 멤버매서드 비교설명
- Step2클래스에서 MeberService 클래스에 직접접근해서 메서드를 실행하려면 static으로 변경(컴파일시 실행가능한 상태로됨=메모리에 로딩)해야 함. 
대신, memberServie객체을 이용해서 메서드에 접근할때는 (호출시=런타임시 실행이가능한 상태로됨=메모리에 로딩)
- 클래스와 상속에 대해서 이론 및 실습
- https://github.com/miniplugin/spring5-kimilguk/blob/master/src/test/java/kr/or/test/ClassApp.java


### 20210527(목)작업
-3장 객체와 클래스부터 시작
-스프링에서는 클래스 extends(상속)보다는 인터페이스(implements)를 더 많이 사용합니다
-abstract클래스(추상클래스): 구현내용이없이 메서드명만 있는 클래스
-추상클래스는 메서드명만 있기(구현내용이 없기) 때문에 객체로 만들수 없는 클래스 입니다
-부모로서 자식에게 상속만(메서드이름만)해서 재사용 가능하게 됩니다
-객체로 만들수 없다? 실행가능한 클래스로 사용못하지만 프로그램을 구조화 시킬때 필요
-Step1 aaa = new Step1();//이렇게 생성자로 객체를 만들지 못함
-final클래스: 부모가 될 수 없는 클래스(상속해서 재사용이 불가능한 클래스임)
-접근제어자: public(패키지위치에 접근-제일많이 사용),
-public 클래스 안에서 멤버면수는  private을 제일 많이 사용.(private보안성 갖춤)
-public 클래스 안에서 멤버메서드는 public을 많이 사용(외부다른클래스의 메서드를사용 대신,
변수가 private이기 때문에 직접 수정안됨,실행만 됩니다
-인스턴스(클라우드주로사용)=오브젝트(자바)=객체=실행중인클래스
-클래스 자료형(int, long, string처럼)은 멤버변수, 멤버메서드, 서브클래스 등등
 포함할 수 있습니다=C언어 구조체 자료형
-이클립스에서 커밋 또는 푸시가 안될때 커밋팝업창 하단에 Force 항목을 체크하고 진행

### 20210526(수)작업
-붕어빵: 붕어빵틀(클래스) -> 붕어빵 구워져서 나오면 오브젝트(객체)
-OOP: 자바를 객체지향(클래스 실행가능하게 하는)프로그래밍
-객체= 오브젝트 = 인스턴스 = 실행가능한 클래스
-객체(Object) 와 클래스? 클래스형 자료를 실행가능하게 만든 것을 오브젝트(객체)라고함
-추상화(Abstract): 오프라인 업무 -> 대표 업무만 뽑아낸 클래스 = 추상클래스
-클래스는 멤버변수 + 멤버메서드(실행) + 서브클래스
-변하지 않는 변수=상수=변수명을 대문자(원주율)PI=3.141569....
-보통 상수변수는 클래스의 제일 상단위치합니다
-기본형(정수자료형-소문자 시작): byte<short<int<long 10L(롱타입변수)
-기본형(실수자료형-소수점-소문자 시작):float<doble, 12.34f(실수형숫자)
-기본형(문자형-1개문자-'a'단따옴표 값을 입력해야 에러가 나지않음):char, 1개 문자만 입력
-문자형에서\u숫자 입니다
-기본형(불린형-참,거짓)"boolean,(0|1)
-참조형(대문자로 시작): 참조형 변수의 대표적인 변수 클래스 입니다
-클래스 변수(저장된상태) -> 실행가능하게 되었을때, 인스턴스변수(메모리로드된상태)
-인스턴스라는 말보다는 오브젝트라는 말을 더 많이 사용합니다
-String(문자열 클래스변수): 대문자로 시작
-상수변수를 명시적 만들때: final int MAX = 100;
-for-each 반복문전까지 실습

### 20210525(화) 작업
-자바 기초 실습 함
-자바.java 클래스파일을 컴파일해서.class파일 실행하는 구조
-파이썬/자바스크립트는 인터프리터 방식을 실행
-자바스크립트는 함수구조의 프로그래밍 = Function(함수)
-자바는 객체지향 프로그래밍(Object Oriented Program)
-오브젝트(객체) = 실행가능한 Class(클래스)
-아스키, 유니코드(UnicodeTypeFormat-8)
-아스키코드 IoT에서 데이터 전송시 필수로 확인해야합니다 0,1전송-> 48,49값을 받습니다
-IoT프로램시 하드웨어 값을 주고 받을때 if(var1 == 48 ) {구현내용}
-공유기가 하위 가질수 있는 사설IP는 공유기자기IP + 255개(여유분) = 256개 인터넷이 가능
-영어 인코딩은 아스키코드로 다 표현가능
-단, 한글 인코딩, 영어 인코딩 , 중국어/일본어 인코딩 등등은 아스키 코드로 다 표현못함 그래서, 유니코드 등장UTF-8
-Hex(16진수), Dec(10진수), Char(문자) = 127개 아스키문자의 크기(컴문자-사람문자 1:1매칭)
-Oct(8진수), Bin(2진수)
-아스키코드-7비트(127글자) -> ANSI코드-8비트(256글자) -> Unicode(65536글자)-UTF8
-UTF8mb4 (이모지까지 포함: 이모티콘+이미지)
-자바언어를 한다느 것은 컴파일 후 실행이 된다는 의미
-자바스크립트(파이썬)는 그냥실행해서 프로그램을 만들어 집니다
-스프링MVC프로젝트 : ModelViewController? 약자MVC구조(웹프로그램구조)
-src/test/java폴더 만들었습니다 : 테스트작업은 이 폴더에서 하라는 약속
-src/main/java폴더가 진짜프로그램작업을 하는 폴더
-javac HelloWorld.java -encoding UTF-8 (한글 내용도 컴파일됨)
-위 java컴파일러로 실행한 결과 -> HelloWorld.class 실행파일이 생성됨
-주), 클래스파일은 실행 패키지의 루트(최상위)에서 실행해야함
-kr.or.test패키지 root폴더src/test/java폴더에 실행을 해야함
-java.kr.or.test.HelloWorld 클래스를 실행하게 됨
-이클립스 나오기 전 25년전 javac 컴파일해서 class프로그램을 만들었습니다
-지금은 터미널에서 javac 사용하지 않고 이클립스에서 바로 실행합니다
-javac? 자바앱 컴파일러 -> 클래스 실행파일을 만듬.class (자바환경JVM실행)
-메이븐?Maven : 웹프로그램 컴파일러 -> 웹프로그램(앱) 실행파일을 만듬 .war(톰캣에서 실행)
-메이븐이 컴파일할때 자바소스만 컴파일하는 것이 아니고 외부 라이브러리로 가져와서 바인딩(묶어줌)하게 됨 = 패키징 이라고 합니다 .war(와르)파일로 패키징됨
-메이븐이 관리하는 외부 라이브러리파일(lib) 목록을 저장하는pom.xml 입니다
-pom.xml에서 자바버전을 1.6 -> 1.8 변경 후 메이븐을 업데이트 합니다
-외부 라이브러리 파일을 참조하는 방식을 영어로 = dependency디펜던시
-jar파일? javaARchive = jar 자바클래스를 패키징한 파일입니다