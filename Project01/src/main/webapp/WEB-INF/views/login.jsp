<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>-login-</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
.b {
	margin-left:45%;
}
.a {
	margin-left:45%;
 	margin-top:5%;
 } 
</style>
<body>
<%@include file ="header.jsp" %>
<form method=post action="/project/login_check" id=frmLogin>
	<div class="wrap">
		<ul>
			<li class=a><label for="userid">아이디</label></li>
			<li class=b><input type="text" id="userid" name="userid"></li>
			<li class=b><input type=hidden name=user id=user value="${fail_user}"></li>
		</ul>
		<ul class=b>
			<li><label for="passcode">비밀번호</label></li>
			<li><input type="password" id="passcode" name="passcode"></li>
		</ul>
	</div><br>
	<div class="wrap" align=center>
		<input type="submit" id=login value="로그인">
		<input type="reset" id=reset value="비우기">
		<input type="button" id=cancel value="취소">
	</div><br>
	<div align=center><a href='/project/signon'>회원가입</a></div>
</form>
<c:if test="${fail_user=='fail'}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다. 아이디와 비밀번호를 다시 입력해주세요.");
	</script>
</c:if>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
// 로그인 -> 로그인버튼
.on('click','#login',function() {
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
})
//로그인 -> 비우기 버튼
.on('click','#reset',function() {
	if(confirm("전부 지우시겠습니까?")) {
		$('#userid,#passcode').val('');
		return false;
	}
})
// 로그인 -> 취소버튼
.on('click','#cancel',function() {
	if(confirm("취소하면 홈화면으로 돌아갑니다. 취소하시겠습니까?")) {
		document.location="/project/";
		return false;
	}
})
</script>
</html>