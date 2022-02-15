<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - RoomType - </title>
<link rel="stylesheet" href="${path}/resources/css/style.css"> 
</head>
<style>
table {
	text-align:center;
	border:1px solid black;
	border-collapse:collapse;
	text-align:center;
	font-family:serif;
	position:absolute;
    left:50%;
    top:50%;
    margin-left:-190px;
    margin-top:-100px;
}
td {
	border:1px solid black;
}
</style>
<body>
<div class="wrap">
	<%@include file ="header.jsp" %>
</div>
<form action="/project/addType" id="frmAddType">
<table>
<tr>
<td>타입코드:</td><td><input type=number name=type_code></td>
</tr>
<tr>
<td>객실타입명:</td><td><input type=text name=type_name></td>
</tr>
<tr>
<td colspan=2 align=center><input type=submit value="추가"></td>
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmAddType',function(){
   if($('input[name=type_code]').val=='' || $('input[name=type_name]').val()=='' ){
      alert("값을 넣어야 합니다");
      return false;
   }
   return true;
});
</script>
</html>