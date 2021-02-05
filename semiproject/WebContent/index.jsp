<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
	<link rel="stylesheet" href="/resources/css/all.css">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
	<%-- 실제 index 정보 보여줄 url로 요청을 재지정 --%>
	<script type="text/javascript">
		location.href="/index.do";
	</script>
</body>
</html>