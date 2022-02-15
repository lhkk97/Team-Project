<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<style>
#content {
	width: 800px;
	height: 200px;
	font-size: 15px;
	padding: 10px;
}

.a {
 	 display: block; 
 	 margin: 10px 0;
	 font-size: 20px;
}
.div {
	 margin-left:30%;
}
h1 {text-align:center;}
input {
	font-size:20px;
}
#insert {
	font-size: 20px;
	padding: 6px 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	font-weight: 600;
	margin-left:70%;
}
</style>
<body>
<h1>게시판 등록</h1>
<form action="/project/insertBoard" method="post">
    <div class=div>
        <label class=a>제목</label>
        <input name="title">
    </div>
    <div class=div>
        <label class=a>내용</label>
        <textarea rows="5" id="content" name="content"></textarea>
    </div>
    <div class=div>
        <label class=a>글쓴이</label>
        <input name="writer">
    </div>
    <br>
    <button id="insert" class="insert">완료</button>
</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
</script>
</html>