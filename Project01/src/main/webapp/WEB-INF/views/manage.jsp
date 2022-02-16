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
.box {
	display:none;
}
.box.on {
	display:block;
}
.top {
	font-size:20px;
	font-weight:bold;
	margin-left:700px;
	margin-top:50px;
}
.box_tab {
	margin-left:700px;
		
}
.book-list input[type=button]{margin:10px 0; cursor:pointer; width:100%; text-align:center; padding:10px 0;}
</style>
<body>
	<h1 class=top>관리자 모드</h1>
	<div class="box_tab">
		<ul>
			<li><a href="#" id="box_tab01">예약관리</a></li>
			<li><a href="#" id="box_tab02">룸관리</a></li>
			<li><a href="#" id="box_tab03">회원관리</a></li>
		</ul>
	</div>
	<div class="box_wrap">
		<div class="box box_tab01 on"><%@include file = "book.jsp" %></div>
		<div class="box box_tab02"><%@include file = "roomInfo.jsp" %></div>
		<div class="box box_tab03"><%@include file = "signon.jsp" %></div>
	</div>
	<table>
		<tr>
			<td class=btn><input type=button id=reserv name=reserv value="예약관리"></td>
			<td class=btn><input type=button id=room name=room value="Room관리"></td>
			<td class=btn><input type=button id=member name=member value="회원관리"></td>		
		</tr>
	</table>
</body>
<script>
$(document)
.on('click','.box_tab ul li a', function(){
	$('.box').removeClass('on');
	let str = "." + $(this).attr('id');
	console.log(str);
	
	$(str).addClass('on');
});

</script>
</html>