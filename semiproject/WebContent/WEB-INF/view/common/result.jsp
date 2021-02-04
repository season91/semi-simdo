<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<body>

<body>
	<%-- 경고창띄우구 페이지 이동시키는 곳 --%>
	<%-- 모든 예외처리를 할수 없어서 이런 페이지 하나 만들어서 쓰는 것이 좋음. 자바스크립트 el jstl 같이 쓴 작품--%>
	<script type="text/javascript">
		let context = "${context}";
		
		<c:if test="${!empty alertMsg}">
			alert("${alertMsg}");
		</c:if>
		<%-- 뒤로가기는 history.back --%>
		<c:if test="${!empty back}">
			history.back();
		</c:if>
		
		<c:if test="${!empty url}">
			location.href = context + '${url}';
		</c:if>

	</script>
</body>
</body>
</html>