<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title> - Home - </title>
	<link rel="stylesheet" href="${path}/resources/css/style.css"> 
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src='https://code.jquery.com/jquery-3.6.0.js'></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<%@include file ="header.jsp" %>
<div class="wrap">
<!--    <div class="swiper mySwiper"> -->
<!--       <div class="swiper-wrapper"> -->
<!--         <div class="swiper-slide"> -->
<!--           <img src="https://swiperjs.com/demos/images/nature-1.jpg" /> -->
<!--         </div> -->
<!--         <div class="swiper-slide"> -->
<!--           <img src="https://swiperjs.com/demos/images/nature-2.jpg" /> -->
<!--         </div> -->
<!--         <div class="swiper-slide"> -->
<!--           <img src="https://swiperjs.com/demos/images/nature-3.jpg" /> -->
<!--         </div> -->
<!--         <div class="swiper-slide"> -->
<!--           <img src="https://swiperjs.com/demos/images/nature-4.jpg" /> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
	<!-- footer 영역-->
</div>

<script>
	$(document)
	.ready(function() {
		let result = '${result}';
		if(result === 'already_login'){
			alert('로그아웃 후에 로그인 가능합니다.');
		}
	})
	var swiper = new Swiper(".mySwiper", {
		spaceBetween : 30,
		effect : "fade",
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
	});
</script>
</body>	
</html>
