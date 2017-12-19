<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8 , width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  	$(function(){
  		// 지배인 로그인
  		$('#managerBtn').click(function(){
  			$.ajax({
				url:"login",
				type:"POST",
				data:"eId=1&ePw=1",
				success:function(data){
					$(location).attr('href', 'login')
				}
			})
  		})
  		
  		// 프론트 로그인
  		$('#frontBtn').click(function(){
  			$.ajax({
				url:"login",
				type:"POST",
				data:"eId=2&ePw=2",
				success:function(data){
					$(location).attr('href', 'login')
				}
			})
  		})
  		
  		// 청소팀 로그인
  		$('#cleanBtn').click(function(){
  			$.ajax({
				url:"login",
				type:"POST",
				data:"eId=3&ePw=3",
				success:function(data){
					$(location).attr('href', 'login')
				}
			})
  		})
  	})
  </script>
<style>
  body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
  #googleMap {
      width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
  }  
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #2d2d30;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }
  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: red !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
  </style>
<title>불사조 팀 프로젝트</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
	<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#myPage">포트폴리오</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">팀프로젝트 소개</a></li>
        <li><a href="#band">팀원소개</a></li>
        <li><a href="#tour">개발환경 및 프로젝트 들어가기</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">다운로드
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">가이드 문서</a></li>
            <li><a href="#">ERD</a></li>
            <li><a href="#">설계문서</a></li> 
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">    
   <!--  
    Left and right controls
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div> -->

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>숙박 관리 시스템</h3>
  <p><em>어떤 호텔이라도 쉽게 관리할 수 있어요!</em></p>
  <p>객실옵션, 요금, 고객, 예약, 서비스 및 객실을 관리하는 시스템입니다.</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>변지민</strong></p><br>
      <div>
      	<p>객실/프론트</p>
      	<p>청소</p>
      	<p>공지사항</p>
      	<br>
      </div>
      <a href="#demo" data-toggle="collapse">
        <button>상세보기</button>
      </a>
      <div id="demo" class="collapse">
      	<br>
      	<b>객실</b><br>
		객실 타입 조회<br>
		객실 타입 등록<br>
		객실 타입 특징 등록<br>
		객실 타입 특징 삭제<br>
		객실 타입 특징 조회<br>
		객실 조회<br>
		객실 등록<br><br>
		<b>프론트</b><br>	
		층별 객실 조회<br>
		타입별 객실 조회<br>
		상태별 객실 조회<br>
		객실 상세 보기 조회<br>
		객실 상태 전환<br>
		객실 상태 전환 시간 조회<br>
		객실 상태 경과 시간 조회<br><br>
		<b>청소</b><br>
		청소요청 객실 조회<br>
		청소 시작<br>
		청소 종료<br>
		청소 완료 조회<br><br>
		<b>공지</b><br>
		공지사항 등록<br>
		공지사항 조회<br>
		공지사항 수정<br>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>빈그리</strong></p><br>
      <div>
      	<p>팀장/호스팅</p>
      	<p>직원</p>
      	<p>보관품/운송</p>
      	<br>
      </div>
      <a href="#demo2" data-toggle="collapse">
        <button>상세보기</button>
      </a>
      <div id="demo2" class="collapse">
        <br>
      	<b>팀장</b><br>
		회의 진행<br>
		일정 관리<br>
		업무 조율<br><br>
		<b>호스팅</b><br>	
		호스팅 계정관리<br>
		URL 연결 작업<br>
		프로젝트 배포 업무<br><br>
		<b>직원</b><br>
		직원 가입<br><br>
		<b>보관품/운송</b><br>		
		보관품 등록<br>
		보관품 수정<br>
		보관품 조회<br>
		운송 등록<br>
		운송 조회<br>
		운송 수정<br>
		보관품 발송 등록<br>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>황형진</strong></p><br>
      <div>
      	<p>직원/분류</p>
      	<p>서비스</p>
      	<p>예약/행사</p>
      	<br>
      </div>
      <a href="#demo3" data-toggle="collapse">
        <button>상세보기</button>
      </a>
      <div id="demo3" class="collapse">
        <br>
        <b>직원</b><br>
		직원 가입<br>
		직원 조회<br>
		직원 검색<br>
		직원 상세보기<br>
		직원 정보수정<br>
		직원 비밀번호 변경<br>
		직원 로그인<br>
		직원 로그아웃<br><br>
		<b>분류</b><br>		
		분류 등록<br>
		분류 중복검사<br>
		분류 조회<br>
		분류 검색<br><br>
		<b>서비스</b><br>		
		서비스 등록<br>
		서비스 조회<br><br>
		<b>예약</b><br>		
		예약 조회<br>
		예약 검색<br>
		예약 상세보기<br>
		객실 예약 등록<br>
		객실 예약 취소<br>
		서비스 예약 등록<br>
		서비스 예약 취소<br>
		예약 고객 등록<br>
		행사가 적용<br>
		고객 등록<br>
		고객 수정<br>
		고객 조회<br>
		고객 검색<br>
		입퇴실 조회<br>
		결제 등록<br>
		결제 취소<br>
		결제 조회<br>
		결제 검색<br>
		체크인<br>
		체크아웃<br>
		인아웃리스트<br><br>
		<b>행사</b><br>	
		요금증감폭 등록<br>
		요금증감 기간 등록<br>
		요금증감 행사 조회<br>
		요금증감 중복검사<br><br>
		<b>ETC</b><br>
		Intercept 구현<br>
		Tiles 적용<br>
		권한별 메뉴<br>
		지배인 통계<br>
      </div>
    </div>
  </div>
</div>

<!-- Container (TOUR Section) -->
<div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">개발환경</h3>
    <ul class="list-group">
      <li class="list-group-item"><span class="label label-danger">OS</span> Windows7</li>
      <li class="list-group-item"><span class="label label-danger">Web Browser</span> Crome</li> 
      <li class="list-group-item"><span class="label label-danger">WAS</span> apache-tomcat-8.0.47</li> 
      <li class="list-group-item"><span class="label label-danger">DB</span> Mysql</li> 
      <li class="list-group-item"><span class="label label-danger">DB관리툴</span> HeidiSQL8.0</li> 
      <li class="list-group-item"><span class="label label-danger">협업툴</span> GitHub</li> 
      <li class="list-group-item"><span class="label label-danger">java</span> java1.8.0_151</li> 
      <li class="list-group-item"><span class="label label-danger">Framework</span> spring-tool-suite-3.9.1, springframework 4.3.12.RELEASE, spring-webmvc 4.3.9, Maven, mybatis 3.4.1, mybatis-spring 1.3.0, bootstrap</li> 
      <li class="list-group-item"><span class="label label-danger">API</span> jackson-databind 2.9.2, tiles-jsp 3.0.5, tiles-core 3.0.5, commons-dbcp 1.4, spring-jdbc 4.3.8, aspectjrt 1.6.10, mysql-connector-java5.1.41, logback-classic 1.1.3, jcl-over-slf4j 1.7.7, jstl 1.2, gson 2.8.0, maven-compiler-plugin 2.5.1, maven-eclipse-plugin 2.9, exec-maven-plugin 1.2.1, javax.inject 1, log4j 1.2.16, slf4j-log4j12 1.7.6, log4jdbc-remix 0.2.7</li> 
    </ul>
    
    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
			<br>
          <p><strong>지배인</strong></p>
          <p>지배인 권한으로 들어가기</p>
          <button id="managerBtn" class="btn" data-toggle="modal" data-target="#myModal">AMS 바로가기</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail"> 
        	<br>
          <p><strong>프론트</strong></p>
          <p>프론트 권한으로 들어가기</p>
          <button id="frontBtn" class="btn" data-toggle="modal" data-target="#myModal">AMS 바로가기</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
        	<br>
          <p><strong>청소팀</strong></p>
          <p>청소팀 권한으로 들어가기</p>
          <button id="cleanBtn" class="btn" data-toggle="modal" data-target="#myModal">AMS 바로가기</button>
        </div>
      </div>
    </div>
  </div>

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br> 
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>
	
	
</body>
</html>