<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - Room - </title>
<link rel="stylesheet" href="${path}/resources/css/style.css"> 
</head>
<style>
tr {
 border-collapse:collapse;
 border:1px solid black;
}
</style>
<body>
<div class="wrap">
	<%@include file ="header.jsp" %>
</div>
<div>
<table>
<thead>
<tr>
Room-A<hr>
</tr>
객실명&nbsp;Room-A<br>
객실종류&nbsp;&nbsp;디럭스<br>
최대숙박인원&nbsp;&nbsp;2<br>
숙박비&nbsp;&nbsp;20,000원
<tr><td>객실이미지<br>썸네일1</td>
	<td>객실이미지<br>썸네일2</td>
	<td>객실이미지<br>썸네일3</td>
	<td>객실이미지<br>썸네일4</td>
</tr>
</thead>
</table>
</div>
</body>
</html>