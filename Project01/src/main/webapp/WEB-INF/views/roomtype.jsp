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
<body>
<div class="wrap">
	<%@include file ="header.jsp" %>
</div>
<form action="/project/addType" id="frmAddType">
타입코드: <input type=number name=type_code><br>
객실타입명: <input type=text name=type_name><br>
<input type=submit value="추가">
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