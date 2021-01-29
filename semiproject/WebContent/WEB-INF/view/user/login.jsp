<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<head>
	<link rel="stylesheet" href="/resources/css/all.css">
	<link rel="stylesheet" href="/resources/css/common/reset.css">
	<link rel="stylesheet" href="/resources/css/user/login.css">
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init('b140a5f5d7731e0c477c0a030751f776');
		console.log(Kakao.isInitialized());
	</script>
</head>
<body>
	<header class="header-section">
		<a class="top-logo-text"><img style="width: 20vh; margin-left: 5%" alt="logo" src="/resources/image/logo.png"></a>
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
	
	<section class="content">
		<div class="text-login">Login</div>
		<form class="frm_login">
			<label class="id-login lab_login"><i class="fas fa-user pic-login"></i><input class="input_login" type="email" name="userId" placeholder="username" required="required"></label>
			<label class="pw-login lab_login"><i class="fas fa-key pic-login"></i><input class="input_login" type="password" name="password" placeholder="****" required="required"></label>
			<button class="btn_login">Login</button>
			<div class="link-login">
				<a class="join link" href="/user/join.do">회원가입</a>
				<a class="idpw-search link" href="/user/pwsearch.do">비밀번호 찾기</a>
			</div>
		</form>
		<div class="btn-wrapper">
			<%
				String clientId = "YOUR_CLIENT_ID";//애플리케이션 클라이언트 아이디값";
				String redirectURI = URLEncoder.encode("https://localhost:9898/index.do", "UTF-8");
				SecureRandom random = new SecureRandom();
				String state = new BigInteger(130, random).toString();
				String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				apiURL += "&client_id=" + clientId;
				apiURL += "&redirect_uri=" + redirectURI;
				apiURL += "&state=" + state;
				session.setAttribute("state", state);
			%>
			<a class="btn_naver-login" href="<%=apiURL%>"><img width="100%" height="50" src="/resources/image/naver_login_logo.PNG"/></a>
			<a class="btn_kakao-login" href="javascript:loginWithKakao()">
			  <img
			    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
			    width="100%" height="50"
			  />
			</a>
		</div>
	</section>
	
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
	
	<script type="text/javascript">
		function loginWithKakao() {
		  Kakao.Auth.authorize({
			redirectUri : 'https://localhost:9090'
		  });
		  
		  Kakao.Auth.setAccessToken(USER_ACCESS_TOKEN);
		}
	</script>
</body>
</html>