<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- book -</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="wrap" id="book" name="book">
		<section>
			<article>
				<ul>
					<li>예약번호</li>
					<li><input type="text" name="book_id" id="book_id"
						style="text-align: right;"></li>
				</ul>
				<ul>
					<li>객실종류</li>
					<li><input type=text name=type_name id="type_name"
						style="text-align: right;"></li>

				</ul>
				<ul>
					<li>체크인</li>
					<li><input type="text" class="get_in_date" name="in_date"
						placeholder="자동입력란" readonly id=in_date style="text-align: right;">
					</li>
					<li>체크아웃</li>
					<li><input type="text" class="get_out_date" name="out_date"
						placeholder="자동입력란" readonly id=out_date
						style="text-align: right;"></li>
				</ul>
				<ul>
					<li>객실명</li>
					<li><input type="text" class="get_roomname" name="name"
						placeholder="자동입력란" readonly id="name" style="text-align: right;">
						<input type="hidden" class="get_roomid" name="roomid" readonly>
					</li>
				</ul>

				<ul>
					<li>최대인원</li>
					<li><input type="number" class="get_howmany" name="howmany"
						placeholder="자동입력란" readonly id=howmany style="text-align: right;">명</li>
				</ul>
				<ul>
					<li>예약자명</li>
					<li><input type="text" class="get_booker" name="booker"
						id=booker style="text-align: right;"></li>
				</ul>
				<ul>
					<li>휴대폰번호</li>
					<li><input type="text" class="get_mobile" name="mobile"
						id=mobile style="text-align: right;"></li>
				</ul>
				<ul>
					<li>비용</li>
					<li><input type="text" class="get_howmuch" name="howmuch"
						placeholder="자동입력란" readonly id=howmuch style="text-align: right;"></li>
				</ul>
				<input type=button id=return name=return value="되돌아가기">
			</article>
		</section>
	</div>
	<script>
		$(document)
		.ready(function() {
			$.ajax({
				url : '/project/getBook_doneList',
				data : {},
				datatype : 'json',
				method : 'GET',
				beforeSend : function() {
				},
				success : function(txt) {
					let book_id = txt[0]['book_id'];
					let type_name = txt[0]['type_name'];
					let in_date = txt[0]['in_date'];
					let out_date = txt[0]['out_date'];
					let name = txt[0]['name'];
					let howmany = txt[0]['howmany'];
					let mobile = txt[0]['mobile'];
					let booker = txt[0]['booker'];
					let howmuch = txt[0]['howmuch'];
	
					$("#book_id").val(book_id);
					$("#type_name").val(type_name);
					$("#in_date").val(in_date);
					$("#out_date").val(out_date);
					$("#name").val(name);
					$("#howmany").val(howmany);
					$("#mobile").val(mobile);
					$("#booker").val(booker);
					$("#howmuch").val(howmuch);
				}
			})
		})
		.on('click','#return',function(){
			document.location="/project/";
			return false;
		});
	</script>
</body>
</html>