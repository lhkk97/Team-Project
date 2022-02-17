<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
input {
	box-sizing: border-box;
	border: 1px solid #ddd;
	padding: 5px;
}

input.btn {
	/*  	box-sizing: border-box;  */
	background-color: -internal-light-dark(rgb(239, 239, 239),
		rgb(59, 59, 59));
	/*  	padding: 5px;  */
}

table {
	border-collapse: collapse;
	text-align: center;
	box-sizing: border-box;
	border: 1px solid #ddd;
}

td {
	/* 	border:1px solid black; */
	/* 	text-align:center; */
	/* 	box-sizing: border-box; */
	/*     border: 1px solid #ddd; */
	
}

.roominfo_wrap {
	margin: 100px auto 0;
	font-size:1rem;
}
.roominfo_wrap table{margin:0 auto;}

td.td1 {
	float:left;
}
#selRoom option{padding:10px; font-size:1rem;}
#type{width:100%;}
table.table1 {
	box-sizing: border-box;
	border: 1px solid #ddd;
}

select {
	box-sizing: border-box;
	border: 1px solid #ddd;
}
</style>

<form action="/project/addInfo" id="frmAddRoom">
	<div class="roominfo_wrap">
		<table>
			<tr>
				<td class=td1><select id=selRoom name=selRoom size=10
					style='width: 500px;'></select></td>
			</tr>
		</table>
		<table>
			<tbody>
				<table class=table1 style='width: 500px;'>
					<input type=hidden id=id name=id>
					<tr>
						<td align=center>객실명</td>
						<td><input type=text name=name></td>
					</tr>
					<tr>
						<td align=center>룸타입</td>
						<td><select id=type name=type>
								<option value=''>-</option>
						</select></td>
					</tr>
					<tr>
						<td align=center>숙박가능인원</td>
						<td><input type=number name=howmany></td>
					</tr>
					<tr>
						<td align=center>룸가격</td>
						<td><input type=number name=howmuch></td>
					</tr>
					<tr>
						<td colspan=2 align=center><input type=submit value='추가'>
							<input type=button id=btnDelete name=btnDelete value=삭제>
							<input type=reset value=비우기 >
							<input type=button id=btnPlus name=btnPlus value=룸추가>
						</td>
					</tr>
				</table>
			</tbody>
		</table>
	</div>
</form>
<script>
	$(document).ready(
			function() {
				$.ajax({
					url : "/project/roomlist",
					data : {},
					datatype : 'json',
					method : 'get',
					beforeSend : function() {
					},
					success : function(txt) {
						console.log(txt);
						for (i = 0; i < txt.length; i++) {
							let str = '<option value='+txt[i]['id']+'>'
									+ txt[i]['name'] + ','
									+ txt[i]['room_type'] + ','
									+ txt[i]['howmany'] + ','
									+ txt[i]['howmuch'] + ','
									+ txt[i]['type_name'] + '</option>';
							$('#selRoom').append(str);
						}
					}
				});
				$.ajax({
					url : "/project/typelist",
					data : {},
					datatype : 'json',
					method : 'get',
					beforeSend : function() {
					},
					success : function(txt) {
						console.log(txt);
						for (i = 0; i < txt.length; i++) {
							let str = '<option value='+txt[i]['type_code']+'>'
									+ txt[i]['type_name'] + '</option>';
							$('#type').append(str);
						}
					}
				});
			}).on(
			'submit',
			'#frmAddRoom',
			function() {
				if ($('input[name=name]').val() == ''
						|| $('input[name=type]').val() == ''
						|| $('input[name=howmany]').val() == ''
						|| $('input[name=howmuch]').val() == '') {
					alert('모든 값이 입력 되어야 합니다.');
					return false;
				}
				return true;
			}).on('click', '#btnDelete', function() {
		let url = "/project/delInfo?id=" + $('#id').val();
		console.log(url);
		document.location = url;
		return false;
	}).on('click', '#btnPlus', function() {
		document.location = '/project/roomtype';
		return false;
	}).on('click', '#selRoom option', function() {
		console.log($(this).val() + ',' + $(this).text());
		$('#id').val($(this).val());
		let str = $(this).text();
		let ar = str.split(',');
		$('input[name=name]').val($.trim(ar[0]));
		$('input[name=howmany]').val($.trim(ar[2]));
		$('input[name=howmuch]').val($.trim(ar[3]));
		let type = $.trim(ar[1]);
		console.log('room_type [' + type + ']');
		$('#room_type').val('');
		$('#room_type option').each(function() {
			if ($(this).text() == type) {
				$(this).prop('selected', 'selected');
				return false;
			}
		})
		return false;
	})
</script>
