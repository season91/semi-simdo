<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<head>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/movie/nation.css">
<link rel="stylesheet" href="${context}/resources/css/all.css">

</head>
<body>

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
	      	<div class="nation-view">나라별</div>
	        <div class="year-view">연도별</div>
	        <div class="rank-view"><a>심도순</a></div>
	        <div class="new-view"><a>평점순</a></div>
	        <div class="search-view">
					<input type="search" class="input_navi-search" name="search">
	        		<button class="btn_navi-search"><i class="fas fa-search"></i></button>
			</div>
		</div>
      </nav>
   </div>
	
	
	<div class="content">
		 <div class="mv_wrapper">
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://t1.daumcdn.net/movie/b2cde8e92bfc811ebb822d5f95a4a710a48c0a4f"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 결백 </p>
					<p class="mv_info"> 한국 / 아무개 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20200518_153/1589778290753sxMnv_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 매드맥스: 분노의 도로 (Mad Max: Fury Road) </p>
					<p class="mv_info"> 오스트레일리아 / 조지 밀러 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20210106_231/1609898979659CutEz_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> #아이엠히어 </p>
					<p class="mv_info"> 프랑스 / 에릭 라티고 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20210114_78/1610588407942CoL2I_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 세자매 </p>
					<p class="mv_info"> 한국 / 이승원 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://t1.daumcdn.net/movie/b2cde8e92bfc811ebb822d5f95a4a710a48c0a4f"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 결백 </p>
					<p class="mv_info"> 한국 / 아무개 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20200518_153/1589778290753sxMnv_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 매드맥스: 분노의 도로 (Mad Max: Fury Road) </p>
					<p class="mv_info"> 오스트레일리아 / 조지 밀러 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20210106_231/1609898979659CutEz_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> #아이엠히어 </p>
					<p class="mv_info"> 프랑스 / 에릭 라티고 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			<div class="mv_view_list">
				<div class="mv_view_img"><img src="https://movie-phinf.pstatic.net/20210114_78/1610588407942CoL2I_JPEG/movie_image.jpg"></div>
				<div class="mv_view_text">
					<p class="mv_title"> 세자매 </p>
					<p class="mv_info"> 한국 / 이승원 감독</p> <br>
					<a class="mv_readmore"> 더보기</a>
				</div>
			</div>
			
		</div>
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

	<script type="text/javascript" src="${context}/resources/js/movie/movie.js"></script>
</body>
</html>