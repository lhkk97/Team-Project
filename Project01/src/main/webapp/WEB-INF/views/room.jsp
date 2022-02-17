<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
<title> - Room - </title>
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
.room_top{margin-top:100px;}
.swiper {
	flex-shrink:0;
  	width: 650px;
  	margin-left:0;
    background-size: contain;
    position:relative;
    transition-property:transform;
    
}

.swiper-slide img {
         display: block; 
         width: 100%; 
         height: 100%; 
         object-fit: cover;
         position:relative;
      }
.room_info {
	font-size:1.5rem;
}
.Done {
	border:1px solid black;
	width:500px;
	height:55px;
}
.table1 {
    width:500px;
    height:400px;
}
.table1 td:nth-child(2){
	text-align:right;
}
.text1 {
	margin-left:500px;
    margin-top:200px;
    width:1000px;
    height:500px;
}
.room_title {
	font-size:20px;
	margin-left:300px;
    margin-top:360px;
}
.normal {
	font-size:19px;
	margin-left:500px;
    margin-top:-70px;
}
.normal_list {
	margin-left:500px;
    margin-top:50px;
}
.bath_room {
	font-size:19px;
	margin-left:800px;
	margin-top:-147px;
}
.bath_room_list {
	margin-left:800px;
    margin-top:50px;
}
.etc {
	font-size:19px;
	margin-left:1100px;
	margin-top:-170px;
}
.etc_list {
	margin-left:1100px;
	margin-top:50px;
}
.special {
	font-size:20px;
	margin-left:300px;
    margin-top:200px;
}
.special_service {
	margin-left:500px;
	margin-top:-50px;
}
.information {
	font-size:20px;
	margin-left:300px;
    margin-top:200px;
}
.info_list {
	margin-left:500px;
	margin-top:-40px;
}
</style>
<body>
<%@include file ="header.jsp" %>
<div class="wrap">
</div>
<div class="room_top fixed">
	<div
	      style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff;"
	      class="swiper mySwiper2 room-slide"
	    >
	      <div class="swiper-wrapper">
	        <div class="swiper-slide">
	          <img src="resources/images/deluxe2.jpg" />
	        </div>
	        <div class="swiper-slide">
	          <img src="resources/images/deluxe3.jpg" />
	        </div>
	        <div class="swiper-slide">
	          <img src="resources/images/deluxe4.jpg" />
	        </div>  
			<div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      </div>
	      <div thumbsSlider="" class="swiper mySwiper">
	      <div class="swiper-wrapper">
		        <div class="swiper-slide">
		          <img src="resources/images/deluxe2.jpg" />
		        </div>
		        <div class="swiper-slide">
		          <img src="resources/images/deluxe3.jpg" />
		        </div>
		        <div class="swiper-slide">
		          <img src="resources/images/deluxe4.jpg" />
		        </div>
		      </div>
	     </div>
	</div>
	<div class="room_info_wrap">
		<table align=center class=table1>
		<tr><th class="room_info" colspan="2">Deluxe Room<hr></th></tr>
		<tr><td style='font-weight:bold;'>객실명</td><td>101호</td></tr>
		<tr><td style='font-weight:bold;'>객실종류</td><td>디럭스</td></tr>
		<tr><td style='font-weight:bold;'>최대숙박인원</td><td>2</td></tr>
		<tr><td style='font-weight:bold;'>숙박비</td><td>50,000원</td></tr>
		<tr><td style='font-weight:bold;'>체크인/체크아웃</td><td>15:00/12:00</td></tr>
		</table>
		<table align=center class=table2>
		<tr><td><input type=button id=btnDone name=btnDone value="실시간 예약하기" class="Done"></td></tr>
		</table>
	</div>
</div>
<h2 class="room_title">어메니티</h2>
<div class="normal">일반</div>
<div class="normal_list">
	<p>손전등 / 슬리퍼 /전화기</p>
	<p>티포트 / 금고 /구둣주걱</p>
	<p>구두클리너 / 55" UHD TV</p>	
</div>
<div class="bath_room">욕실</div>
<div class="bath_room_list">
	<p>1회용 칫솔 및 치약/</p>
	<p>면도기 / 목욕 가운/</p>
	<p>비데 / 헤어드라이어/</p>
	<p>욕실용품</p>
</div>
<div class="etc">기타</div>
<div class="etc_list">
	<p>무료 생수 1일 2병 /</p>
	<p>보이스 메일 서비스 /</p>
	<p>커피 및 티 메이커</p>
</div>
<h2 class="special">특별서비스</h2>
<div class="special_service">
	<ul>
		<li>- 맞춤형 베개 제공</li>
		<li>- 전 객실 초고속 무료 인터넷(유선,와이파이)</li>
		<li>- 턴다운 서비스 제공</li>
		<li>- 조식 제공</li>
	</ul>
</div>
<h2 class="information">추가정보</h2>
<div class="info_list">
	<ul>
		<li>※이용하시는 호텔 모든 시설은 전부 금연이오니, 이용에 착오 없으시기 바랍니다.</li>
		<li style='color:gray;'>※추가 인원이 발생 하실 경우, 1인 당 20,000원씩 부과 됩니다.</li>
	</ul>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script>
$(document)
.on('click','#btnDone',function(){
	document.location="/project/book";
	return false;
})
</script>
<script>

var swiper = new Swiper(".mySwiper", {
	  loop: true,
	  spaceBetween: 5,
	  slidesPerView: 4,
	  freeMode: true,
	  watchSlidesProgress: true,
	  navigation: {
		  nextEl: ".swiper-button-next",
		  prevEl: ".swiper-button-prev", 
	  },
	});
	var swiper2 = new Swiper(".mySwiper2", {
	  loop: true,
	  spaceBetween: 5,
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	  thumbs: {
	    swiper: swiper,
	  },
	});
</script>
</html>