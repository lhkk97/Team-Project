<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="top_header fixed">
		<form name="frm" action="/project/logout" method="POST">
			<input type="hidden" name="userid" value="${userid}">
		</form>
		<ul>
			<c:if test="${userid==null}">
				<a href="/project/login">로그인</a>&nbsp;&nbsp;<a href="/project/signon">회원가입</a>
			</c:if>
			<c:if test="${userid!=null}">
				${userid}&nbsp;&nbsp;<a href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a>
			</c:if>
		</ul>
	</div>
	<div class="header">
		<h1 class="logo"><a href="#">LOGO</a></h1>
		<ul class="fixed">
			<li><a href="#">객실소개</a></li>
			<li><a href="#">예약안내</a></li>
			<li>
				<a href="#">커뮤니티</a>
				<!-- 게시판 구현시 사용 -->
				<!-- 
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">QnA</a></li>
					<li><a href="#">이용후기</a></li>
				</ul>
				 -->
			</li>
			<li><a href="#">실시간예약</a></li>
		</ul>
	</div>