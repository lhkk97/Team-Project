<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/style.css"> 
<div class="wrap">
	<%@include file ="header.jsp" %>
</head>
<style>
.btn {

}
</style>

<body>
	<h1 class=top>관리자 모드</h1>
	<table>
		<tr>
			<td class=btn><input type=button id=reserv name=reserv value="예약관리"></td>
			<td class=btn><input type=button id=room name=room value="Room관리"></td>
			<td class=btn><input type=button id=member name=member value="회원관리"></td>		
		</tr>
	</table>
</body>
<script src="https://code.jquery.com/jqeury-3.5.0.js"></script>
<script>
$(document)

</script>
</html>