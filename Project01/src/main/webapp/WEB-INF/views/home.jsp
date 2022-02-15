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
<!-- 	<div class="top_header fixed"> -->
<!-- 		<ul> -->
			
<%-- 			<c:if test="${userid==null}"> --%>
<!-- 				<a href="/membership/login">로그인</a>&nbsp;&nbsp;<a href="/membership/signon">회원가입</a> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${userid!=null}"> --%>
<%-- 				${userid}&nbsp;&nbsp;<a href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a> --%>
<%-- 			</c:if> --%>
<!-- 			<li><a href="#">로그인</a></li> -->
<!-- 			<li><a href="#">회원가입</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	<%@include file ="header.jsp" %>
	<section>
	
		<P>  The time on the server is ${serverTime}. </P>

	</section>
	<!-- footer 영역-->
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
</script>
</html>
