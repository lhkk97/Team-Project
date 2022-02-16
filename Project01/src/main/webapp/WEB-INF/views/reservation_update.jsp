<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

		<section class="book-list">
			<article>
				<ul class="fixed">
					<li>객실종류</li>
					<li class="option">
						<p data-value=''>객실 종류 선택</p>
						<ul style="display:none;">
						<c:forEach items="${roomtypeList}" var="roomtypeList">
							<li data-value="${roomtypeList.type_code}">${roomtypeList.type_name}</li>
						</c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="fixed">
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="date" id="in_date"></p>
						<p>체크아웃 <input type="date" id="out_date"></p>
					</li>
				</ul>
				<ul class="fixed">
					<li>숙박인원</li>
					<li><input type="number" id="howmany" min="1" value="1">명</li>
				</ul>
				<div>
					<input type="button" id="btnView" value="변경 가능 객실 조회">
				</div>
				<div>
					<table id="getRoomList">
						<thead>
							<tr>
								<th style="width:25%;">객실명</th><th style="width:35%;">객실종류</th>
								<th style="width:20%;">최대인원</th><th style="width:20%;">금액</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</article>
			<article>
				<form action="/project/updateBook" method="POST">
					<ul>
						<li>객실종류</li>
						<li><input type="text" class="get_roomtype" name="roomtype" placeholder="자동입력란" readonly></li>
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
						<li><input type="text" class="get_booker" name="booker" readonly></li>
						<li style="display:none;"><input type="hidden" class="get_bookid" name="bookid" readonly></li>
						<li style="display:none;"><input type="hidden" class="get_bookerId" name="bookerId" readonly></li>
					</ul>
					<ul>
						<li>휴대폰번호</li>
						<li><input type="text" class="get_mobile" name="mobile" readonly></li>
					</ul>
					<ul>
						<li>비용</li>
						<li><input type="text" class="get_howmuch" name="howmuch" placeholder="자동입력란" readonly>원</li>
					</ul>
					<div>
						<input type="submit" value="예약 수정">
					</div>
				</form>
			</article>
		</section>