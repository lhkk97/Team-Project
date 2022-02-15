<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
</head>
<style>
table {
	border-collapse: collapse
}

th, td {
	border: 1px solid black;
}
</style>
<body>
	<!-- 
 <table>
	<select id=getRezList style='width: 800px;' size=10>
	</select>
	<tr>
		<td><input type=hidden id=book_id name=book_id></td>
	</tr>
</table>
 -->
	<table>
		<thead>
			<tr>
				<th>BOOK_ID</th>
				<th>NAME</th>
				<th>MOBILE</th>
				<th>ROOM_TYPE</th>
				<th>HOWMANY</th>
				<th>HOWMUCH</th>
				<th>IN_DATE</th>
				<th>OUT_DATE</th>
				<th>CHECK_BOX</th>
			</tr>
		</thead>
		<tbody id="getRezList">
		</tbody>
	</table>
	<input type=button value="예약수정" id=btnUpdate>
	<input type=button value="예약취소" id=btnDelete>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function() {
	$.ajax({
		url : '/project/reservation',
		data : {},
		datatype : 'json',
		method : 'get',
		beforeSend : function() {
		},
		success : function(txt) {
			for (i = 0; i < txt.length; i++) {
				let str = "<tr"><td>" + txt[i]['book_id']
					+ "</td><td>" + txt[i]['name']
					+ "</td><td>" + txt[i]['mobile']
					+ "</td><td>" + txt[i]['room_type'] 
					+ "</td><td>" + txt[i]['howmany']
					+ "</td><td>" + txt[i]['howmuch']
					+ "</td><td>" + txt[i]['in_date']
					+ "</td><td>" + txt[i]['out_date']
					+ "</td><td><input type=checkbox></td></tr>";
				$('#getRezList').append(str);
			}
		}
	})
})
// 예약 수정 버튼
.on('click','#btnDelete', function(){
	$.ajax({
		url:"/project/reservation",
		data:{name:$('#name').val(), mobile:$('#mobile').val(), room_type:$('#room_type').val(), room_type:$('#room_type').val(), room_type:$('#room_type').val()},
		method:'get',
		datatype:'json',
		beforeSend:function(){},
		success:function(data){
			
		}
	});
	return false;
});
function LoadRezUp(){
	$.ajax({
		url:"/project/reservation_update",
		data:{name:$('#name').val(), mobile:$('#mobile').val(), room_type:$('#room_type').val(), room_type:$('#room_type').val(), room_type:$('#room_type').val()},
		method:'get',
		datatype:'json',
		beforeSend:function(){},
		success:function(data){
		}
	});
	return false;
}
</script>
</html>