<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title> - Home - </title>
	<link rel="stylesheet" href="${path}/resources/css/style.css"> 
</head>
<body>
<div class="wrap">
	<%@include file ="header.jsp" %>
	<section>
	
		<P>  The time on the server is ${serverTime}. </P>

	</section>
	<!-- footer 영역-->
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function() {
	let result = '${result}';
	if(result === 'already_login'){
		alert('로그아웃 후에 로그인 가능합니다.');
	}
})
</script>
</html>
