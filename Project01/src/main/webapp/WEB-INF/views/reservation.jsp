<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	<div>
		<div>
			<table class="booking-list">
				<thead>
					<tr>
						<th></th><th>예약번호</th><th>아이디</th>
						<th>고객이름</th><th>연락처</th><th>객실명</th>
						<th>객실종류</th><th>인원</th><th>가격</th>
						<th>체크인</th><th>체크아웃</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${getReservation}" var="getList">
						<tr>
							<td onclick="event.cancelBubble=true"><input type="checkbox" name="check" value="${getList.id}"></td><td>${getList.id}</td><td>${getList.booker}</td>
							<td>${getList.name}</td><td>${getList.mobile}</td><td>${getList.roomname}</td>
							<td>${getList.type_name}</td><td>${getList.howmany}</td><td>${getList.howmuch}</td>
							<td>${getList.in_date}</td><td>${getList.out_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="booking-list_btn"><input type="button" id="deleteBookBtn" value="선택삭제"></div>
		</div>
		<div id="dlgRU" style="display:none;">
			<%@ include file ="reservation_update.jsp" %>
		</div>
	</div>
	<script>
		// 체크인에 오늘 날짜 입력
		let in_date= document.getElementById('in_date');
		let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		in_date.value = todayData;
		// 체크인 최소값 : 오늘 날짜
		in_date.setAttribute('min', todayData);
		// 체크아웃 오늘 + 1일 입력
		let out_date = document.getElementById('out_date');
		let nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
		out_date.value = nextData;
		// 체크아웃 최소값 : 오늘 + 1일
		out_date.setAttribute('min', nextData);
		
		// 체크인 날짜 변경시
		in_date.addEventListener('change',function(){
			if(in_date.value == ""){
			// 날짜 삭제시 오늘 날짜 입력
				in_date.value = todayData;
			} else if (in_date.value < todayData){
			// 이전 날짜 입력시(키보드 입력) alert 후 오늘 날짜 입력
				alert('이전 날짜로 예약할 수 없습니다. 날짜를 다시 선택해주세요.');
				in_date.value = todayData;
			}
			// 체크아웃 날짜가 체크인 당일 포함 이전 날짜일때 체크아웃 날짜를 체크인 다음 날로 변경
			if(out_date.value <= in_date.value){
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
				out_date.setAttribute('min', nextData);
			}
		});
		// 체크아웃 날짜 변경시
		out_date.addEventListener('change',function(){
			if(out_date.value == ""){
				// 체크아웃 날짜 삭제시
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
			}
		});
		$(document)
		.on('click', '.booking-list > tbody > tr', function(){
			let arLine = [];
			for(i = 2; i < $('td',this).length + 1; i++){
				arLine.push($('td:nth-child('+ i +')', this).text());
			}
			console.log(arLine);
// 			let title = $('td:nth-child(2)', this).text();
// 			let username = $('td:nth-child(4)', this).text();
// 			let phone = $('td:nth-child(5)', this).text();
// 			let roomtype = $('td:nth-child(7)', this).text();
			let title = arLine[0];
			let username = arLine[2];
			let phone = arLine[3];
			let roomtype = arLine[5];
			
			$('#dlgRU').dialog({
				title:"예약번호 " + title,
				width:1250,
				modal:true,
				open:function(){
					$('#getRoomList tbody').empty();
					$('.get_bookid').val(title);
					$('.get_bookerId').val(arLine[1]);
					$('.get_booker').val(arLine[2]);
					$('.get_mobile').val(arLine[3]);
// 					$('.option p').text(roomtype);
					$('#howmany').val(arLine[6]);
					$('#in_date').val(arLine[8]);
					$('#out_date').val(arLine[9]);
					console.log(arLine[9]);
				},
				close:function(){
					$('#getRoomList tbody').empty();
					$('.option p').text('객실 종류 선택');
					$('.option p').attr('data-value', '');
					return false;
// 					console.log("["+$('.option p').attr('data-value')+"]");
				}
			})
			.on('click', '#btnView', function(){
				$('#getRoomList tbody').empty();
				console.log("["+$('.option p').attr('data-value')+"]");
				if($('.option p').attr('data-value') == ''){
					alert('객실 종류를 선택해주세요.');
					return false;
				}
				loadList(title);
				loadMyList(title);
			})
			return false;
		})

		.on('click', '.option', function(){
			$('.option > ul').slideToggle();
			return false;
		})
		.on('click',function(e){ //문서 body를 클릭했을때
				if(e.target.className =="option"){
					return false;
				}
				$('.option > ul').slideUp();
		})
		.on('click', '.option > ul > li', function(){
			$('.option > p').text($(this).text()); 
			$('.option > p').attr('data-value',$(this).attr('data-value'));
		})
		.on('click','#getRoomList tbody tr', function(){
			$('.get_roomtype').val($('.roomtype', this).text());
			$('.get_in_date').val($('#in_date').val());
			$('.get_out_date').val($('#out_date').val());
			$('.get_roomname').val($('.roomname', this).text());
			$('.get_roomid').val($(this).attr("data-value"));
			$('.get_howmany').val($('.howmany', this).text());
			$('.get_howmuch').val($('.howmuch', this).text());
		})
		.on('click','#deleteBookBtn',function() {
			if($('input[name=check]:checked').length==0) {
				alert('하나 이상 체크하세요.');
				return false;
			}
			let check='';
			$('input[name=check]:checked').each(function() {
				check+=$(this).val()+",";
			});
			console.log(check);
			$.ajax({
				url:'/project/deleteBook',
				data:{check:check},
				method:'POST',
				datatype:'json',
				success:function(txt) {
					console.log(txt);
					if(txt=="ok") {
						alert('삭제 완료.');
						document.location='/project/manage';
					} else {
						alert('다시 삭제해주세요.');
					}
				}
			});
		})
		;
		function loadList(title){
			$.ajax({
				url : '/project/loadBookList',
				data : {
					room_type : $('.option p').attr('data-value'),
					checkin : $('#in_date').val(),
					checkout : $('#out_date').val(),
					howmany : $('#howmany').val(),
					id : title
				},
				datatype : 'Json',
				method : 'post',
				success : function(data) {
					let str = '';
					$('#getRoomList tbody').empty();
					for(i = 0; i < data.length; i++){
						let str = '<tr data-value="' + data[i]['id'] + '"><td class="roomname">'
								  + data[i]['name'] + '</td><td class="roomtype">'
								  + data[i]['type_name'] + '</td><td class="howmany">'
								  + data[i]['howmany'] + '</td><td class="howmuch">'
								  + data[i]['howmuch'] + '</td></tr>';
						$('#getRoomList tbody').append(str);
					}
				}
			});
		};
		function loadMyList(title){
			$.ajax({
				url : '/project/loadMyList',
				data : {
					id : title
				},
				datatype : 'Json',
				method : 'post',
				success : function(data) {
					let str = '';
					for(i = 0; i < data.length; i++){
						str = '<tr data-value="' + data[i]['id'] + '"><td class="roomname">'
								  + data[i]['name'] + '</td><td class="roomtype">'
								  + data[i]['type_name'] + '</td><td class="howmany">'
								  + data[i]['howmany'] + '</td><td class="howmuch">'
								  + data[i]['howmuch'] + '</td></tr>';
						if($('.option p').text() ==  data[i]['type_name']){
							$('#getRoomList tbody').append(str);
						}
					}
				}
			});
		};
	</script>
