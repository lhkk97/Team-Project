<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>- 관리자 모드 -</title>
	<link rel="stylesheet" href="${path}/resources/css/reset.css"> 
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css"> 
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
		width:1200px;
		margin:0 auto;
		font-size:1.32rem;
		font-weight:500;
	}
	.box_tab ul{text-align:center;}
	.box_tab ul li {
		margin:100px 5px 0;
		display:inline-block;
		box-sizing: border-box;
	    border: 2px solid #ddd;
	    border-radius: 4px;
	    border-radius:100px;
	}
	
	.box_tab ul li a {
	    color:#333;
	    display:block;
		padding:10px 15px;
	}
	div.wrap {
		padding-top:150px;
	
	}
	.book-list input[type=button]{margin:10px 0; cursor:pointer; width:100%; text-align:center; padding:10px 0;}
</style>
</head>

<body>
	<%@include file ="header.jsp" %>
	<div>
		<div class="box_tab">
			<ul class="fixed">
				<li class="on"><a href="#" id="box_tab01">예약관리</a></li>
				<li><a href="#" id="box_tab02">객실관리</a></li>
				<li><a href="#" id="box_tab03">회원관리</a></li>
			</ul>
		</div>
		<div class="box_wrap">
			<div class="box box_tab01 on"><%@include file = "reservation.jsp" %></div>
			<div class="box box_tab02"><%@include file = "roomInfo.jsp" %></div>
			<div class="box box_tab03"><%@include file = "member.jsp" %></div>
		</div>
	</div>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td class=btn><input type=button id=reserv name=reserv value="예약관리"></td> -->
<!-- 			<td class=btn><input type=button id=room name=room value="Room관리"></td> -->
<!-- 			<td class=btn><input type=button id=member name=member value="회원관리"></td>		 -->
<!-- 		</tr> -->
<!-- 	</table> -->
</body>
<script>
$(document)
.on('click','.box_tab ul li', function(){
   $('.box').removeClass('on');
   $('.box_tab ul li').removeClass('on');
   let str = "." + $(this).children().attr('id');
 
   console.log(str);
   $(this).addClass('on');
   $(str).addClass('on');
});

</script>
</html>