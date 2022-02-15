<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- book -</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file ="header.jsp" %>
		<section>
			<article>
				<ul>
					<li>예약번호</li>
					<li><input type="text"></li>
				</ul>
				<ul>
					<li>객실종류</li>
					<li>${roomtype}</li>
				</ul>
				<ul>
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="text" class="get_in_date" name="in_date" placeholder="자동입력란" readonly></p>
						<p>체크아웃 <input type="text" class="get_out_date" name="out_date" placeholder="자동입력란" readonly></p>
					</li>
				</ul>
				<ul>
					<li>객실명</li>
					<li>
						<input type="text" class="get_roomname" name="roomname" placeholder="자동입력란" readonly>
						<input type="hidden" class="get_roomid" name="roomid" readonly>
					</li>
				</ul>

				<ul>
					<li>최대인원</li>
					<li><input type="number" class="get_howmany" name="howmany" placeholder="자동입력란" readonly>명</li>
				</ul>
				<ul>
					<li>예약자명</li>
					<li><input type="text" class="get_booker" name="booker"></li>
				</ul>
				<ul>
					<li>휴대폰번호</li>
					<li><input type="text" class="get_mobile" name="mobile"></li>
				</ul>
				<ul>
					<li>비용</li>
					<li><input type="text" class="get_howmuch" name="howmuch" placeholder="자동입력란" readonly></li>
				</ul>
			</article>
		</section>
	</div>
</body>
</html>