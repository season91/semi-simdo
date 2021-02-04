<<<<<<< HEAD
=======
<%@page import="com.kh.simdo.common.code.ConfigCode"%>
>>>>>>> 9f62b99ea28cbd38c51617ba3de9a7dafb44d13e
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<body>
<<<<<<< HEAD
	<h1>반갑습니다. ${param.userEmail} 님</h1>
	<h1>Simdo:wm에 가입하신 것을 환영합니다!</h1>
	<h1>회원가입을 마무리하기 위해 인증 번호를 입력해주세요.</h1>
	<h2>인증 번호 : ${param.authNum}</h2>
=======
<h1>반갑습니다. ${param.userId}님!</h1>
<h1>toy-project 사이트에 가입하신 것을 환영합니다!</h1>
<h1>회원 가입을 마무리 하기 위해 아래의 링크를 클릭해주세요.</h1>
<a href="<%= ConfigCode.DOMAIN%>/member/joinimpl.do">회원가입 완료</a>
>>>>>>> 9f62b99ea28cbd38c51617ba3de9a7dafb44d13e
</body>
</html>