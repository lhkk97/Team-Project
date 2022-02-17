<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>- book -</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file ="header.jsp" %>
<div class="wrap">
	<%@ include file ="book.jsp" %>
</div>
</body>
</html>