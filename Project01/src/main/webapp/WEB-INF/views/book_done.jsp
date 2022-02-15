<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- book -</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.book_done-list{margin-top:100px; font-size:1rem; vertical-align:top;}
	.book_done-list article {width:595px; box-sizing:border-box;border:1px solid #ddd; padding:40px; display:inline-block; vertical-align:top; height:550px;}
	.book_done-list article:first-child{margin-right:6px;}
	.book_done-list input{font-size:1rem; border:none; text-align:right;}
	.book_done-list input[type=button]{margin:10px 0; cursor:pointer; width:100%; text-align:center; padding:10px 0;}
	.book_done-list input[type=submit]{margin-top:10px;cursor:pointer; width:100%; text-align:center; padding:10px 0;}
	.book_done-list input[type=date]{padding:0; margin:0;}
	.book_done-list ul{width:100%;}
	.book_done-list ul:nth-child(2) li{height:100px;}
	.book_done-list ul li{float:left; text-align:right; border-bottom:1px solid #ccc; height:50px; line-height:50px; width:70%;}
	.book_done-list ul li:first-child{width:30%; font-weight:500; text-align:left;}
	.book_done-list .option{position:relative; background:#fff; cursor:pointer;}
	.book_done-list .option ul{position:absolute; left:0; right:0; top:100%; border:1px solid #ccc;}
	.book_done-list .option ul li{font-weight:300; text-align:right;height:auto; padding:5px 0; background:#fff; width:100%; line-height:1.2; white-space:nowrap; cursor:pointer;}
	.getRoomList{width:100%; border-collapse:collapse;}
	.getRoomList th{border:1px solid #ccc;}
	.getRoomList tbody tr{cursor:pointer;}
	.getRoomList tbody tr:hover{background:#f2f2f2;}
	.getRoomList tbody tr td{text-align:center; padding:5px; box-sizing:border-box;}
</style>
</head>
<body>
	<div class="wrap">
		<section>
			<article>
				<ul>
					<li>예약번호</li>
					<li><input type="text"></li>
				</ul>
				<ul>
					<li>객실종류</li>
					<li>${roomtype}</li>
				</ul>
				<ul>
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="text" class="get_in_date" name="in_date" placeholder="자동입력란" readonly></p>
						<p>체크아웃 <input type="text" class="get_out_date" name="out_date" placeholder="자동입력란" readonly></p>
					</li>
				</ul>
				<ul>
					<li>객실명</li>
					<li>
						<input type="text" class="get_roomname" name="roomname" placeholder="자동입력란" readonly>
						<input type="hidden" class="get_roomid" name="roomid" readonly>
					</li>
				</ul>

				<ul>
					<li>최대인원</li>
					<li><input type="number" class="get_howmany" name="howmany" placeholder="자동입력란" readonly>명</li>
				</ul>
				<ul>
					<li>예약자명</li>
					<li><input type="text" class="get_booker" name="booker"></li>
				</ul>
				<ul>
					<li>휴대폰번호</li>
					<li><input type="text" class="get_mobile" name="mobile"></li>
				</ul>
				<ul>
					<li>비용</li>
					<li><input type="text" class="get_howmuch" name="howmuch" placeholder="자동입력란" readonly></li>
				</ul>
				<div>
					<input type="submit" id="btnView" value="예약">
				</div>
			</article>
		</section>
	</div>
</body>
</html>