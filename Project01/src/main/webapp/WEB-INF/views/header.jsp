<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="top_header fixed">
		<form name="frm" action="/project/logout" method="POST">
			<input type="hidden" name="userid" value="${userid}">
		</form>
		<ul>
			<c:if test="${userid==null}">
				<li><a href="/project/login">로그인</a></li><li><a href="/project/signon">회원가입</a></li>
			</c:if>
			<c:if test="${userid!=null}">
				<c:if test="${m_type=='관리자'}">
					<li><a href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a></li>
					<li><a href="/project/manage">[관리자페이지]</a></li>
					<li>${userid}</li>	
				</c:if>
				<c:if test="${m_type!='관리자'}">
					<li><a href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a></li>
					<li>${userid}</li>
				</c:if>
			</c:if>		
		</ul>
	</div>
	<div class="header">
		<h1 class="logo"><a href="/project">LOGO</a></h1>
		<ul class="fixed">
			<li>
				<a href="/project/room">객실소개</a>
<!-- 				<ul class="sub_nav"> -->
<!-- 					<li><a href="#">roomA</a></li> -->
<!-- 					<li><a href="#">roomB</a></li> -->
<!-- 					<li><a href="#">roomC</a></li> -->
<!-- 					<li><a href="#">roomD</a></li> -->
<!-- 				</ul> -->
			</li>
			<li><a href="#">예약안내</a></li>
			<li>
				<a id="listBoard" href="/project/listBoard">커뮤니티</a>
				<!-- 게시판 구현시 사용 -->
				<!-- 
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">QnA</a></li>
					<li><a href="#">이용후기</a></li>
				</ul>
				 -->
			</li>
			<li><a id="sub_4" href="/project/sub04">실시간예약</a></li>
		</ul>
	</div>
	<script>
		$(document)
		.on('click','#sub_4', function() {
			let result = '${result}';
			if(result === 'do_login'){
				alert('로그인 후 이용 가능합니다.');
			}
		});
	</script>