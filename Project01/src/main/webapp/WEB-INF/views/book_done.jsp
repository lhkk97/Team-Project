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
	.book_done-list input[type=button]{cursor:pointer;}
	.book_done-list input[type=date]{padding:0; margin:0;}
	.book_done-list ul{}
	.book_done-list ul:nth-child(2) li{height:100px;}
	.book_done-list ul li{float:left; border-bottom:1px solid #ccc; height:50px; line-height:50px; width:300px;}
	.book_done-list li:first-child{width:120px;}
	.book_done-list .option{position:relative; background:#fff; cursor:pointer;}
	.book_done-list .option ul{position:absolute; left:0; right:0; top:100%; border:1px solid #ccc;}
	.book_done-list .option ul li{height:auto; padding:5px 0; background:#fff; width:100%; line-height:1.2; white-space:nowrap; cursor:pointer;}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file ="header.jsp" %>
		<section class="book_done-list">
			<article>
				<ul class="fixed">
					<li>객실종류</li>
					<li class="option">
						<p>객실 종류 선택</p>
						<ul style="display:none;">
						<c:forEach items="${roomtypeList}" var="roomtypeList">
							<li data-value="${roomtypeList.type_code}">${roomtypeList.type_name}</li>
						</c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="fixed">
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="date" id="in_date" name="in_date"></p>
						<p>체크아웃 <input type="date" id="out_date" name="out_date"></p>
					</li>
				</ul>
				<ul class="fixed">
					<li>숙박인원</li>
					<li><input type="number"></li>
				</ul>
				<div>
					<input type="button" id="btnView" value="조회">
				</div>
				<table>
					<tr><th>객실명</th><th>객실타입</th><th>최대인원</th><th>금액</th></tr>
<%-- 					<c:forEach items="${books}" var="books"> --%>
<%-- 					<tr id="${books.id}"><td>${books.name}</td><td>${books.type_name}</td><td>${books.howmany}</td><td>${books.howmuch}</td></tr> --%>
<%-- 					</c:forEach> --%>
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
		let in_date= document.getElementById('in_date');
		let out_date = document.getElementById('out_date');
		let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		let in_date_value = in_date.value;

		in_date.value = todayData;
		in_date.setAttribute('min', todayData);
		
		
		let nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
		console.log('다음날 ' + nextData);
		out_date.value = nextData;
		out_date.setAttribute('min', nextData);
		

		
		$(document)
		.on('change','#in_date', function(){
			if($('#in_date').val() == "") {
				in_date.value = todayData;
			} else if(in_date.value < todayData){
				alert('이전 날짜로 예약할 수 없습니다. 날짜를 다시 선택해주세요.');
				in_date.value = todayData;
			}
// 			console.log(nextData);
// 			$('#out_date').attr('min',nextData);
			
			
// 			if($('#in_date').val() > nextData){
// 				$('#out_date').val(nextData);
// 			}
		})
		.on('click', '.option', function(){
			$('.option > ul').slideToggle();
			return false;
		})
		.on('click',function(e){ //문서 body를 클릭했을때
 			if(e.target.className =="option"){
 				return false;
 			}
 			$('.option > ul').slideUp();
 		})
		.on('click', '.option > ul > li', function(){
			$('.option > p').text($(this).text());
			$('.option > p').attr('data-value',$(this).attr('data-value'));
		})
		.on('click', '#btnView', function(){
			
		})
		;
	</script>
</body>
</html>