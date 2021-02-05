<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<html>
<head>
	<link rel="stylesheet" href="/resources/css/all.css">
	<link rel="stylesheet" href="/resources/css/common/reset.css">
	<link rel="stylesheet" href="/resources/css/index/index.css">
	<link rel="stylesheet" href="/resources/css/index/slide.css">

</head>

<body style="margin:0">

	  <div class="header-wrapper">
     <header class="header-section">
         <a class="top-logo-text"><img class="top-logo-img" style="width: 20vh; margin-left: 5%" alt="logo" src="/resources/image/logo.png"></a>
         <c:choose>
            <c:when test="${empty sessionScope.user}">
               <%-- 비로그인 상태 --%>
               <div class="top-right" style="width: 20vh">
                  <a class="top_user top_join" href="/user/login.do">로그인</a>
                  <a class="top_user" href="/user/join.do">회원가입</a>
               </div>
            </c:when>
            <c:otherwise>
               <%-- 로그인 상태 --%>
               <div class="top-right" style="width: 40vh">
                  <a class="top_user top_join" href="/mypage/mypage.do">마이페이지</a>
                  <a class="top_user" href="/comm/noticelist.do">커뮤니케이션</a>
                  <a class="top_user" href="/user/logout.do">로그아웃</a>
               </div>
            </c:otherwise>
         </c:choose>
      </header>

      <nav class="navi">
	      <div class="navi-wrapper">
	      

	      	<div class="nation-view" OnClick="location.href ='http://movie/naviview.do" style="cursor:pointer;">나라별</div>
	        <div class="year-view" OnClick="location.href ='http://movie/naviview.do" style="cursor:pointer;">장르별</div>
	        <div class="rank-view" OnClick="location.href ='http://movie/naviview.do" style="cursor:pointer;">심도순</div>
	        <div class="new-view" OnClick="location.href ='http://movie/scoreview.do" style="cursor:pointer;">평점순</div>
	        <div class="search-view">
					<input type="search" class="input_navi-search" name="search">
	        		<button class="btn_navi-search"><i class="fas fa-search"></i></button>
			</div>
		</div>
      </nav>
   </div>
   
  
	<div class="wrapper">
	<h1 class= "title" >나라별영화</h1>
		<ul class="inner">
		 <li class="inner-item bak">
			<img class="inner-item-cover" src="resources/image/결백.jpg">
			<div class="inner-item-contents">
				<h2>결백</h2>
				<p>
				개요:드라마|한국|110분<br>
				개봉:2020.06.10<br>
				평점:8.46<br>
				관객수:89만
				</p>
			</div>
		 </li>	
		 <li class="inner-item mad">
		 	<img class="inner-item-cover" src="resources/image/매드맥스.jpg">
		 	<div class="inner-item-contents">
				<h2>매드맥스:분노의 도로</h2>
				<p>
				개요:액션|오스트레일리아|120분<br>
				개봉:2015.05.14<br>
				평점:8.86<br>
				관객수:391만 
				</p>
			</div>
		 </li>
		 <li class="inner-item three">	
		 	<img class="inner-item-cover" src="resources/image/세자매.jpg">
		 	<div class="inner-item-contents">
				<h2>세자매</h2>
				<p>
				개요:드라마|한국|115분<br>
				개봉:2021.01.27<br>
				평점:8.98<br>
				관객수:4.2만
				</p>
			</div>
		 </li>
		 
		</ul>
	</div>
	
	
	<div class="wrapper">
	<h1 class= "title">장르별 영화</h1>
		<ul class="inner">
		 <li class="inner-item bak">
			<img class="inner-item-cover" src="resources/image/라라랜드.jpg">
			<div class="inner-item-contents">
				<h2>라라랜드</h2>
				<p>
				개요:드라마|미국|120분<br>
				개봉:2016.12.07<br>
				평점:8.91<br>
				관객수:375만명
				</p>
			</div>
		 </li>	
		 <li class="inner-item mad">
		 	<img class="inner-item-cover" src="resources/image/레미제라블.jpg">
		 	<div class="inner-item-contents">
				<h2>레미제라블</h2>
				<p>
				개요:드라마|영국|158분<br>
				개봉:2012.12.19<br>
				평점:9.20<br>
				관객수:593만명 
				</p>
			</div>
		 </li>
		 <li class="inner-item begin">	
		 	<img class="inner-item-cover" src="resources/image/비긴어게인.jpg">
		 	<div class="inner-item-contents">
				<h2>비긴어게인</h2>
				<p>
				개요:드라마|미국|104분<br>
				개봉:2014.08.13<br>
				평점:9.13<br>
				관객수:346만명
				</p>
			</div>
		 </li>
		 
		</ul>
	</div>
	

		
		
		
	
	
	
	
	<footer class="bottom">
		<div class="bottom_main">
			<h2>SIMDO:WM</h2>
		</div>
		<div class="bottom_content">
			<div class="bottom_left">
				<p>상호 주식회사 심도</p>
				<p>사업자 등록번호:123-45-67890</p>
				<p>주소:대한민국 </p>
				<address>TEL:031)111-1212</address>
			</div>
			<div class="bottom_right">
				<a href="/aboutus/">ABOUT US</a><br>
				<a href="/고객페이지/"> 고객페이지</a><br>
				<a href="/마이페이지/"> 마이페이지</a><br>
				<a href="/내정보관리/"> 내정보관리</a><br>
			</div>
		</div>
	</footer>
	

</body>
</html>