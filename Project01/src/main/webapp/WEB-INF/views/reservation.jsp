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
table {border-collapse:collapse}
th,td {border:1px solid black;}
</style>
<body>
	<!-- <table>
	<thead>
	<tr><th>고객명</th><th>전화번호</th><th>객실명</th><th>객실타입</th><th>인원</th><th>가격</th><th>선택</th></tr>
	</thead> -->
	<tbody>
	<tr>
	<select id=getRezList style='width: 200px;' size=10>
	</select>
		<td><input type=hidden id=book_id name=book_id></td>	
	</tr>
	</tbody>
	</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$.ajax({
		url:'/project/reservation',
	    data:{},
	    datatype:'json',
	    method:'get',
	    beforeSend:function(){
	    },
	    success:function(txt){
	    	console.log(str);
	    	for(i=0; i < txt.length; i++){
	    		let str = "<option value="+book_id+">"+txt[i]['booker']+","+txt[i]['room_id']+"</option>";
	    		$('#getRezList').append(str);
	    	}
	    	
	    }
	})
})
</script>
</html>