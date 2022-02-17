<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
.b {margin-left:45%;}
.a {
	margin-left:45%;
	margin-top:5%;
}
</style>
<%@include file ="header.jsp" %>
<body>
	<div>
		<ul>
			<li class=a><label for="name">이름</label></li>
			<li class=b><input type="text" id="name"></li>
		</ul>
		<ul class=b>
			<li><label for="gender">성별</label></li>
			<li>
				<input type="radio" id="gender" name="gender" value="남성">
				<label for="gender">남성</label>
				<input type="radio" id="gender" name="gender" value="여성">
				<label for="gender">여성</label>
			</li>
		</ul>
		<ul class=b>
			<li><label for="mobile">전화번호</label></li>
			<li><input type="number" id="mobile"></li>
		</ul>
		<ul class=b>
			<li><label for="userid">아이디</label></li>
			<li><input type="text" id="userid"></li>
		</ul>
		<ul class=b>
			<li><label for="passcode">비밀번호</label></li>
			<li><input type="password" id="passcode"></li>
		</ul>
		<ul class=b>
			<li><label for="pw_check">비밀번호 확인</label></li>
			<li><input type="password" id="pw_check"></li>
		</ul>
	</div>
	<br>
	<div class=b>
		<input type="submit" id=done value="완료">
		<input type="reset" id=reset value="비우기">
		<input type="button" id=cancel value="취소">
	</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#done',function() {
	if($('#name').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('input[name=gender]:checked').length==0) {
		alert('성별을 입력하세요.');	
		return false;
	}
	if($('#mobile').val()=='') {
		alert('전화번호를 입력하세요.');
		return false;
	}
	if($('#userid').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#pw_check').val()=='') {
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode').val()!=$('#pw_check').val()) {
		alert('비밀번호와 비밀번호확인이 다릅니다.');
		return false;
	}
	
	let oParam={name:$('#name').val(),gender:$('input[name=gender]:checked').val(),
			userid:$('#userid').val(),passcode:$('#passcode').val(),
			mobile:$('#mobile').val()};
	console.log(oParam);
	$.post('/project/signon_check',oParam,function(txt){
		if(txt=="overlap") {
			alert("이미 등록된 아이디입니다.");
		} else if(txt=="ok") {
			alert("회원가입이 완료되었습니다.");
			document.location="/project/login";
		} else {
			alert("회원가입에 실패했습니다. 다시 진행해주세요.");
		}
	},'text');
	return false;
})

//회원가입 -> 비우기 버튼
.on('click','#reset',function() {
	if(confirm("작성한 것을 전부 지우시겠습니까?")) {
		$('#name,#mobile,#userid,#passcode,#pw_check').val('');
		$('input[name=gender]:checked').prop('checked',false);
		return false;
	}
})
//회원가입 -> 취소 버튼
.on('click','#cancel',function() {
	if(confirm("취소하면 로그인화면으로 돌아갑니다. 취소하시겠습니까?")) {
		document.location="/project/login";
		return false;
	}
})
</script>
</html>