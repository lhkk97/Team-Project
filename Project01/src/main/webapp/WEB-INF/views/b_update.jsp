<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
	.div { 
		margin-top :170px;
		margin-left:360px;
	}
	.input_wrap{
	  	vertical-align:middle;
		padding: 5px 20px;
	}
	label{
	    margin: 10px 0;
	    font-size: 15px;
	    font-weight:400;	
	}
	input{
		padding: 3px;
	    font-size: 15px;
	}
	textarea{
		width: 700px;
	    height: 150px;
	    font-size: 15px;
	    padding: 10px;
	}
	.btn{
	  	display: inline-block;
	    font-size: 15px;
	    padding: 8px 8px;
	    background-color: #fff;
	    border: 1px solid #000;
	    font-weight:400;
	    width: 100px;
	    height: 20px;
	    text-align : center;
 	    margin-left : 20px;
	    cursor : pointer;
	}
	.btn_wrap{
		margin-top : 20px;
		margin-left:10%;
	}
</style>
<body>
<%@include file ="header.jsp" %>
<div class="div">
	<form id="updateFrm" action="/project/update" method="post">
	<div class="input_wrap">
		<label class=a>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${get.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label class=a>게시판 제목</label>
		<input name="title" value='<c:out value="${get.title}"/>' >
	</div>
	<div class="input_wrap">
		<label class=a>게시판 내용</label><br><br>
		<textarea rows="3" name="content"><c:out value="${get.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label class=a>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${get.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label class=a>게시판 등록일</label>
		<input name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${get.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label class=a>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${get.updateDate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list">목록 페이지</a> 
		<a class="btn" id="done">완료</a>
		<a class="btn" id="delete">삭제</a>
		<a class="btn" id="cancel">취소</a>
	</div>
	</form>
</div>
	<form id="infoForm" action="/project/update" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${get.bno}"/>'>
	</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#list',function() {
	$("#infoForm").find("#bno").remove();
	$("#infoForm").attr("action", "/project/listBoard");
	$("#infoForm").submit();
})
.on('click','#done',function() {
	$('#updateFrm').submit();
})
.on('click','#delete',function() {
	$("#infoForm").attr("action","/project/delete");
	$("#infoForm").attr("method","post");
	$("#infoForm").submit();
})
.on('click','#cancel',function() {
	$("#infoForm").attr("action", "/project/getBoard");
	$("#infoForm").submit();
})
</script>
</html>