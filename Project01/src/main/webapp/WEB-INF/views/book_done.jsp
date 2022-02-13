<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- book_done -</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.book_done-list{margin-top:100px; font-size:1.25rem; vertical-align:top;}
	.book_done-list article {box-shadow:2px 7px 20px 8px rgb(0 0 0 / 10%); padding:40px; display:inline-block; vertical-align:top; height:550px;}
	.book_done-list input{font-size:1.25rem; border:none; text-align:right;}
	.book_done-list input[type:"date"]{padding:0; margin:0;}
	.book_done-list ul{overflow:hidden;}
	.book_done-list ul:nth-child(2) li{height:100px;}
	.book_done-list ul li{float:left; border-bottom:1px solid #ccc; height:50px; line-height:50px;}
	.book_done-list li:first-child{width:150px;}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file ="header.jsp" %>
		<section class="book_done-list">
			<article>
				<ul>
					<li>객실종류</li>
					<li>
						<a href="#">객실 종류 선택</a>
						<ul style="display:none;">
						<!-- arraylist 불러오기 -->
							<li>Room-A</li>
							<li>Room-B</li>
							<li>Room-C</li>
						</ul>
					</li>
				</ul>
				<ul>
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="date" id="in_date" name="in_date"></p>
						<p>체크아웃 <input type="date" id="out_date" name="out_date"></p>
					</li>
				</ul>
				<ul>
					<li>숙박인원</li>
					<li><input type="number"></li>
				</ul>
				<table>
					<tr><th>객실명</th></tr>
<%-- 				<c:forEach items="${alEmp}" var="emp"><tr></tr></c:forEach> --%>
				</table>
			</article>
			
			<article>
				<ul>
					<li>예약번호</li>
					<li><input type="text" id="book_id" name="book_id" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="date" id="in_date" name="in_date" readonly></p>
						<p>체크아웃 <input type="date" id="out_date" name="out_date" readonly></p>
					</li>
				</ul>
				<ul>
					<li>객실명</li>
					<li><input type="text" id="room_name" name="room_name" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>객실종류</li>
					<li><input type="text" id="book_id" name="roomid" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>숙박인원</li>
					<li><input type="text" id="book_id" name="roomid" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>예약자명</li>
					<li><input type="text" id="book_id" name="roomid" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>모바일(연락처)</li>
					<li><input type="text" id="book_id" name="roomid" placeholder="자동입력란" readonly></li>
				</ul>
				<ul>
					<li>숙박비</li>
					<li><input type="text" id="book_id" name="roomid" placeholder="자동입력란" readonly></li>
				</ul>
			</article>
		</section>
	</div>
	<script>
		$(document)
		.on('click', '#')
	</script>
</body>
</html>