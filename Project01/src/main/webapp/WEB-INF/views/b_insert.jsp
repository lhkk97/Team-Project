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
        <label>Title</label>
        <input name="title">
    </div>
    <div>
        <label>Content</label>
        <textarea rows="5" name="content"></textarea>
    </div>
    <div>
        <label>Writer</label>
        <input name="writer">
    </div>
    <button class="insert">완료</button>
</form>
</body>
</html>