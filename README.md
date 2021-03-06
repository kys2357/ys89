## 특정 고객 거래내역 조회 서비스 개발
### [참조 링크]: http://www.ys89.kr/ysb

* 개발 프레임워크(사용언어)
  * 화면
    * JSP(Java Server Pages)
    * HTML(HyperText Markup Language)
    * 자바스크립트(JavaStript)
    * 화면라이브러리 - jQuery
    
  * 서비스
    * 자바 - 스프링 프레임워크 Spring Boot(Version - STS4)
    * WAS(Web Application Server) - 톰캣(Tomcat 7.0)
    
  * 모델
    * MySQL
    * 마이바티스(MyBatis)
    
  * 서비스 IO방식
    * jsp Ajax를 이용하여 JSON데이터를 통신 -> Controller -> Service -> Mapper -> XML<br>
    -> Service(XML을 JSON으로 Conversion) -> Controller -> jsp(Ajax 콜백) -> HTML에 결괏값 로드

* 문제해결 방법
  * 환경구성
    * Spring boot 기반의 프레임워크를 사용하기 위하여 STS4 설치
    * 모든 입/출력은 JSON 형태로 주고 받도록 처리하기 위해서 통신방식을 Ajax를 이용<br>
    -> jQuery 라이브러리를 사용. POST방식으로 서비스 호출
    * 도메인을 url로 연결하기 위하여 cafe24 호스팅 서비스를 이용하였고 최초 개발 당시에는 DBMS가 오라클(Oracle)이었지만 카페24에서 제공하는 DBMS가 MySQL이기 때문에 Conversion 작업을 처리
    * DB연동은 [src/main/webapp/WEB-INF/spring](https://github.com/kys2357/ys89/tree/master/src/main/webapp/WEB-INF/spring)/root-context.xml에 로컬에서 테스트 할 때는<br>
    로컬에 있는 데이터베이스를 연결해주었고 cafe24를 통하여 호스팅을 연동할 때는 연동 사이트의 주소와<br>
    아이디 비번을 설정하여 연동함
    * JSON형식으로 출력하기 위하여 XML에서 Service로 리턴된 값을 JSON으로 변환 후에 화면으로 리턴함
    
  * API 개발
    * 1)2018, 2019년 각 연도별 합계 금액이 가장 많은 고객을 추출하는 API 개발
    <br>(단, 취소여부가 ‘Y’ 거래는 취소된 거래임, 합계 금액은 거래금액에서 수수료를 차감한 금액임)
      1. 거래내역 데이터에서 취소여부가 N인(거래가 취소되지 않은 거래들만 집계) 거래들만<br>
      합계금액(거래금액 - 수수료)을 계좌와 연도별로 그룹핑처리
      2. 연도에 따라 합계금액이 가장큰 계좌에 대해서 순위를 1번으로 정하고 나머지 계좌들에 대해서는<br>2번으로 치환
      3. 순위가 1번(연도별 합계금액이 가장 많은 계좌)인 값을 추출하였고 계좌정보에 있는 계좌번호와 연결하여 연도, 계좌번호, 계좌명, 합계 금액을
      추출함
    * 2)2018년 또는 2019년에 거래가 없는 고객을 추출하는 API 개발
      1. 거래가 일어난 연도와 (2018,2019) 고객들의 계좌정보에 대해서 크로스 조인을 하여 모든 거래의<br>
      경우의 수를 산출함
      2.  거래내역 데이터에서 취소여부가 N인 고객에 대해서 연도와 계좌별로 그룹핑을 진행하였고<br>
      계좌정보 데이터와 연동함
      3.  a의 계좌와 b의 계좌, a의 연도와 b의 연도를 연결하여(LEFT OUTER JOIN) b의 연도가 없는<br>
      (해당 연도에 거래가 없는 고객) 조건으로 연도별 거래가 없는 고객을 추출함
    
    * 3)연도별 관리점 별 거래금액 합계를 구하고 합계금액이 큰 순서로 출력하는 API 개발.<br>( 취소여부가 ‘Y’ 거래는 취소된 거래임)
      1. 계좌정보 데이터의 관리점 코드와 관리점 정보의 관리점 코드를 연결함
      2. 계좌정보 데이터의 계좌번호와 거래내역 데이터의 계좌번호를 연결함
      3. 거래내역 데이터의 취소여부가 N인(거래가 취소되지 않은 거래들만 집계) 거래들만<br>
      합계금액(거래금액 - 수수료)을 연도별로 그룹핑함
      4. 연결된 관리점정보 데이터의 관리점코드와 관리점명을 추출함
      5. 집계 순서는 연도(오름차순), 합계금액(내림차순)이 큰 순서대로 출력함
    
    * 4)분당점과 판교점을 통폐합하여 판교점으로 관리점 이관을 하였습니다. 지점명을 입력하면 해당지점의 거래금액 합계를 출력하는 API 개발( 취소여부가 ‘Y’ 거래는 취소된 거래임)
      1. 계좌정보 데이터의 관리점 코드와 관리점 정보의 관리점 코드를 연결함
      2. 계좌정보 데이터의 계좌번호와 거래내역 데이터의 계좌번호를 연결함
      3. 거래내역 데이터의 취소여부가 N인(거래가 취소되지 않은 거래들만 집계) 거래들만<br>
      합계금액(거래금액 - 수수료)을 그룹핑함
      4. 관리점 테이블에 이관코드를 생성함
      5. 관리점코드가 B(분당점)에 대해서 이관코드 A를 넣어줌<br>

      관리점코드|관리점명|이관코드|
      ---|---|---|
      A|판교점||
      B|분당점|A|
      C|강남점||
      D|잠실점||
      6. 관리점데이터에 이관코드가 없을 때는 관리점코드와 관리점명을 사용하고 이관코드가 있을 때는<br>
      이관코드에 해당하는 관리점명을 사용하도록 치환함
      7. 검색을 했을 때 판교점을 검색하게 되면 이관된 분당점의 합계금액이 같이 합산되어 나오도록 처리함<br>
      (강남점, 잠실점을 검색했을 때도 정상적으로 합계금액이 나옴. 이관코드가 존재하지 않기 때문에 해당 관리점에 대한 합계금액만 나옴)
      8. 분당점을 입력했을 때는 이관되었기 때문에 아무 값이 나오지않고 "br code not found error" 메세지가<br>
      나옴
      9. 아무 값을 입력하지 않거나 기타 관리점명과 일치하지 않는 검색어를 입력했을 때도 동일한 메세지를 출력하도록 처리함
      
  * 단위 테스트(Unit Test)
    * Api1부터 Api4에 대해서 검증을 처리하였으며 출력이 JSON으로 변환되어 나오는지에 대한 검증을 처리함
    * STS4에서 제공하는 라이브러리로 JUnit을 통해 test 과정을 거침
    * [src/main/java/com/project/api/controller](https://github.com/kys2357/ys89/tree/master/src/main/java/com/project/api/controller)
      /MainControllerTest.java 경로에 있는 파일을 통해 테스트를<br>
      하였으며 리턴된 List<Map<String, Object>>의 데이터가 값이 변하지 않고 json 형식으로 정상적으로<br>
      변환이 되는지 assertSame 함수를 통하여 테스트를 수행함.
      
  
* 빌드 및 실행 방법
  * 화면 최초로드시 화면
    * WAS가 기동되고 나서 경로 [src/main/webapp/WEB-INF](https://github.com/kys2357/ys89/tree/master/src/main/webapp/WEB-INF)
    /web.xml에 <welcome-file-list>에 있는<br>
  </welcome-file> 파일을 호출하게 되는데 [/WEB-INF/views](https://github.com/kys2357/ys89/tree/master/src/main/webapp/WEB-INF/views)/main.jsp 경로에 있는 main.jsp를 로드하도록 설정함
    * 로컬에서 테스트를 할 때는 Kys_project 프로젝트를 톰캣을 통하여 서버를 기동시켜 구현하였고<br>
    cafe24 연동시에는 Kys_project 프로젝트를 확장자 war를 FTP로 배포하여 ./shutdown.sh 과 ./startup.sh 명령을 통하여 was를 기동함

* 주요 소스경로
  * 최초로드시 화면 -> [main.jsp](https://github.com/kys2357/ys89/tree/master/src/main/webapp/WEB-INF/views/main.jsp)
  * Controller -> [MainController.java](https://github.com/kys2357/ys89/tree/master/src/main/java/com/project/api/controller/MainController.java)
  * Service -> [MainService.java](https://github.com/kys2357/ys89/tree/master/src/main/java/com/project/api/service/MainService.java)
  * ServiceImpl -> [MainServiceImpl.java](https://github.com/kys2357/ys89/tree/master/src/main/java/com/project/api/service/impl/MainServiceImpl.java)
  * Mapper -> [MainMapper.java](https://github.com/kys2357/ys89/tree/master/src/main/java/com/project/api/mapper/MainMapper.java)
  * xml -> [MainMapper.xml](https://github.com/kys2357/ys89/blob/master/src/main/resources/sqlmap/MainMapper.xml)
    
