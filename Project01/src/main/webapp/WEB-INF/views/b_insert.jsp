<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<body>
<h1>게시판 등록</h1>
<form action="/project/insertBoard" method="post">
    <div>
        <label>제목</label>
        <input name="title">
    </div>
    <div>
        <label>내용</label>
        <textarea rows="5" name="content"></textarea>
    </div>
    <div>
        <label>글쓴이</label>
        <input name="writer">
    </div>
    <button id="insert" class="insert">완료</button>
</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
</script>
</html>