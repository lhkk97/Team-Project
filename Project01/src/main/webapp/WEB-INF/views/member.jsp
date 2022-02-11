<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"/>
</head>
<style>
table {border-collapse:collapse;}
tr,td,th{
	border:1px solid black;
}
</style>
<body>
<div>
<table id=tblMember></table>
</div>
<div style="float:right;">
	<table>
		<tr><td>
			<input type='button' id=btnMember value="회원관리">
		</td><tr>
	</table>
</div>

<div id=dlgMember style='display:none;'>
<table>
	<tr>
		<td>아이디 : <input type=text id=keyword>
			<input type="button" id=find value="찾기"></td>
	</tr>
	<tr>
		<td>
			<select id=selMember size=10 style='width:520px'></select>
		</td>
	</tr>
	<tr>
		<td>
			<table>
			<tr><td>아이디&nbsp;<input type=text id=d_id name=d_id></td></tr>
			<tr><td>이름&nbsp;<input type=text id=d_name name=d_name></td></tr>
			<tr><td>전화번호&nbsp;<input type=text id=d_mobile name=d_mobile></td></tr>
			<tr><td>회원등급&nbsp;<input type=text id=d_type name=d_type></td></tr>
			<tr><td align=right>
				<button id=btnDone>완료</button>&nbsp;
				<button id=btnEmpty>비우기</button>
			</td></tr>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function() {
	$.ajax({url:"/project/memberList",data:{},datatype:"json",
			method:"GET",
			beforeSend:function() {
				if(!confirm("회원정보를 가져오시겠습니까?")) return false;
			},
			success:function(txt) {
				let head='<thead><tr><th>이름</th><th>성별</th><th>전화번호</th><th>아이디</th><th>비밀번호'
						+'</th><th>등급</th><th>로그인시간</th><th>로그아웃시간</th></tr></thead>'
				$('#tblMember').append(head);
				console.log(txt);
				for(i=0;i<txt.length;i++) {
					let str='<tr><td>'+txt[i]['name']+'</td><td>'+txt[i]['gender']+
							'</td><td>'+txt[i]['mobile']+'</td><td>'+txt[i]['id']+
							'</td><td>'+txt[i]['pw']+'</td><td>'+txt[i]['m_type']+
							'</td><td>'+txt[i]['login']+'</td><td>'+txt[i]['logout']+'</td></tr>';
					$('#tblMember').append(str);
				}
			}
	});
})

.on('click','#btnMember',function() {
	$('#dlgMember').dialog({
		modal:true,
		width:700,
		open:function(){
			$.ajax({url:"/project/memberList",data:{},datatype:"json",
				method:"GET",
				success:function(txt) {
					for(i=0;i<txt.length;i++) {
	 					let str='<option>'+txt[i]['id']+','+txt[i]['name']+','+txt[i]['gender']+
	 							','+txt[i]['mobile']+','+txt[i]['m_type']+'</option>';
						$('#selMember').append(str);
					}
				}
			});
		},
		close:function(){
		
		}
	});
	return false;
})

.on('click','#find',function() {
	$.ajax({url:"/project/dlgList",data:{kw:$('#keyword').val()},datatype:"json",
		method:"GET",
		success:function(txt) {
			$('#selMember').empty();
			for(i=0;i<txt.length;i++) {
					let str='<option>'+txt[i]['id']+','+txt[i]['name']+','+txt[i]['gender']+
							','+txt[i]['mobile']+','+txt[i]['m_type']+'</option>';
				$('#selMember').append(str);
			}
		}
	});
})
</script>
</html>