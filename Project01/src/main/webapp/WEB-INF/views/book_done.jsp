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
	.book_done-list li:first-child{width:140px;}
	.book_done-list .option{position:relative; background:#fff; cursor:pointer;}
	.book_done-list .option ul{position:absolute; left:0; right:0; top:100%; border:1px solid #ccc;}
	.book_done-list .option ul li{height:auto; padding:5px 0; background:#fff; width:100%; line-height:1.2; white-space:nowrap; cursor:pointer;}
	.getRoomList{width:100%;}
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
							<li data-value="*">전체 객실</li>
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
					<li><input type="number" id="howmany" name="howmany" min="1" value="1">명</li>
				</ul>
				<div>
					<input type="button" id="btnView" value="조회">
				</div>
				<table class="getRoomList">
					<thead>
						<tr><th>객실명</th><th>객실타입</th><th>최대인원</th><th>금액</th></tr>
					</thead>
					<tbody></tbody>
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
		// 체크인에 오늘 날짜 입력
		let in_date= document.getElementById('in_date');
		let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		in_date.value = todayData;
		// 체크인 최소값 : 오늘 날짜
		in_date.setAttribute('min', todayData);
		// 체크아웃 오늘 + 1일 입력
		let out_date = document.getElementById('out_date');
		let nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
		out_date.value = nextData;
		// 체크아웃 최소값 : 오늘 + 1일
		out_date.setAttribute('min', nextData);
		
		// 체크인 날짜 변경시
		in_date.addEventListener('change',function(){
			if(in_date.value == ""){
			// 날짜 삭제시 오늘 날짜 입력
				in_date.value = todayData;
			} else if (in_date.value < todayData){
			// 이전 날짜 입력시(키보드 입력) alert 후 오늘 날짜 입력
				alert('이전 날짜로 예약할 수 없습니다. 날짜를 다시 선택해주세요.');
				in_date.value = todayData;
			}
			// 체크아웃 날짜가 체크인 당일 포함 이전 날짜일때 체크아웃 날짜를 체크인 다음 날로 변경
			if(out_date.value <= in_date.value){
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
			}
		});
		// 체크아웃 날짜 변경시
		out_date.addEventListener('change',function(){
			console.log('test');
			if(out_date.value == ""){
				// 체크아웃 날짜 삭제시
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
			}
		});
		
		if(typeof(document.getElementById('howmany').value) != Number){
			console.log('연산 기호 못넣게 만들거야!!!');
			console.log(typeof(document.getElementById('howmany').value));
		}
		
		$(document)
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
			$.ajax({
				url : '/project/getBookList',
				data : {
					room_type : $('.option p').attr('data-value'),
					checkin : $('#in_date').val(),
					checkout : $('#out_date').val(),
					howmany : $('#howmany').val()
				},
				datatype : 'json', //서버에 보낸 데이터의 형식(jason vv)
				method : 'get',
				beforeSend:function(){
					$('.getRoomList tbody').empty();
				},
				success : function(txt) { //서버쪽 요청이 성공리에 완료
					for(i = 0; i < data.length; i++){
						let str = '<tr id="'+data[i][id]+'"><td>' + data[i]['name'] + '</td><td>' + data[i]['type_name'] + '</td><td>'
								  + data[i]['howmany'] + "</td><td>"
								  + data[i]['howmuch'] + "</td></tr>";
						$('.getRoomList tbody').append(str);
					}
				},
				error : function() { //서버쪽에 보낸 요청이 실패(오류) 발생경우
				},
				complete : function() { //success/error 실행이 모두 끝난 후, 마무리.
				}
				
// 				let dpId = $('#selJob').val();
// 				$.ajax({
// 					url:"/exercise/getEmp",
// 					data:{dpId:dpId},
// 					method:"GET",
// 					datatype:"Json",
// 					beforeSend:function(){
// 						$('#tblJob').empty();
// 					},
// 					success:function(data){
// 						for(i = 0; i < data.length; i++){
// 							let str = '<tr><td>' + data[i]['employee_id'] + '</td><td>' + data[i]['emp_name'] + '</td><td>'
// 									  + data[i]['phone_number'] + "</td><td>"
// 									  + data[i]['salary'] + "</td></tr>";
// 							$('#tblJob').append(str);
// 						}
// 					}
// 				});
			});
		});
	</script>
</body>
</html>