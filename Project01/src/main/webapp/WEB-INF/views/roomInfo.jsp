<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - RoomInformation - </title>
<link rel="stylesheet" href="${path}/resources/css/style.css"> 
</head>
<style>
</style>
<body>
<form action="/project/addRoom" id="frmAddRoom">
<div class="wrap">
<%@include file ="header.jsp" %>
</div>
<table>
<caption>객실정보 보기</caption>
<tr>
<td><select id=roomInfo name=roomInfo size=10 style='width:500px'></select></td>
<td>
            <input type=hidden id=typecode name=typecode>
               <table>
                  <tr>
                     <td align=right>객실명 :</td>
                     <td><input type=text name=name></td>
                  </tr>
                  <tr>
                     <td align=right>룸타입 :</td>
                     <td><select id=type name=type>
                     	<option value=''>-</option>
                     	<c:forEach items="${types}" var="rt">
                     	<option value=${rt.type_code}>${rt.type_name}</option>
						</c:forEach>                     	
                     	 </select></td>
                  </tr>
                  <tr>
                     <td align=right>숙박가능인원 :</td>
                     <td><input type=number name=howmany></td>
                  </tr>
                  <tr>
                     <td align=right>룸가격 :</td>
                     <td><input type=number name=howmuch></td>
                  </tr>
                  <tr>
                     <td colspan=2 align=center>
                     <input type=submit value='추가'>
                     <input type=button id=btnDelete name=btnDelete value=삭제>
                     <input type=reset value=비우기>
                     </td>
</tr>
</table>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#frmAddRoom',function() {
 	if ($('input[name=typecode]').val() == ''
 	 ||	$('input[name=name]').val() == ''
     || $('input[name=type]').val() == ''
     || $('input[name=howmany]').val() == ''
     || $('input[name=howmuch]').val() == '') {
        alert('모든 값이 입력 되어야 합니다.');
         return false;
              }
          return true;
})
.on('click','#btnDelete',function(){
	let url="/project/deleteRoom?typecode="+$('#typecode').val();
	console.log(url);
	document.location=url;
	return false;
})
.on('click','#roomInfo option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#roomcode').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=name]').val($.trim(ar[0]));
	$('input[name=howmany]').val($.trim(ar[2]));
	$('input[name=howmuch]').val($.trim(ar[3]));
	let type=$.trim(ar[1]);
	console.log('type ['+type+']');
	$('#type').val('');
	$('#type option').each(function(){ 
        if($(this).text()==type){
           $(this).prop('selected','selected');
           return false;
        }
     })
	return false;
})
;
</script>
</html>