<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 조회</title>
</head>
<style>
<style type="text/css">
	.input_wrap{
		padding: 5px 20px;
	}
	label{
	    display: block;
	    margin: 10px 0;
	    font-size: 20px;	
	}
	input{
		padding: 5px;
	    font-size: 17px;
	}
	textarea{
		width: 800px;
	    height: 200px;
	    font-size: 15px;
	    padding: 10px;
	}
	.btn{
	  	display: inline-block;
	    font-size: 22px;
	    padding: 6px 12px;
	    background-color: #fff;
	    border: 1px solid #ddd;
	    font-weight: 600;
	    width: 140px;
	    height: 41px;
	    line-height: 39px;
	    text-align : center;
	    margin-left : 30px;
	    cursor : pointer;
	}
	.btn_wrap{
		padding-left : 80px;
		margin-top : 50px;
	}
</style>
<body>
	<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${get.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${get.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${get.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${get.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${get.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${get.updateDate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list">목록 페이지</a> 
		<a class="btn" id="update">수정 하기</a>
	</div>
	<form id="infoForm" action="/project/update" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${get.bno}"/>'>
	</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
// $(document)
// .on('click','#list',function() {
// 	document.location="/project/listBoard";
// })
// .on('click','#update',function() {
// 	document.location="/project/update";
// })
</script>
</html>