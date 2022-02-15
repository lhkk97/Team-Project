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

<div id=dlgType style='display:none;'>
<table>
<tr>
	<td>
		<select id=selType size=10 style='width:220px'></select>
	</td>
	<td valign=top>
		<table>
		<tr><td>아이디&nbsp;<input type=text id=d_userid name=d_userid size=10></td></tr>
		<tr><td>번호&nbsp;<input type=number id=d_code name=d_code size=3></td></tr>
		<tr><td>등급&nbsp;<input type=text id=d_type name=d_type size=10></td></tr>
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
				let head='<thead><tr><th></th><th>이름</th><th>성별</th><th>전화번호</th><th>아이디</th><th>비밀번호'
						+'</th><th>등급</th><th>로그인시간</th><th>로그아웃시간</th></tr></thead>'
				$('#tblMember').append(head);
// 				console.log(txt);
				
				for(i=0;i<txt.length;i++) {
					let check='<tr><td><input type="checkbox" id=check name="check" value="'+txt[i]['id']+'"></td>'
					let str='<td>'+txt[i]['name']+'</td><td>'+txt[i]['gender']+
							'</td><td>'+txt[i]['mobile']+'</td><td>'+txt[i]['id']+
							'</td><td>'+txt[i]['pw']+'</td><td id=memberType>'+txt[i]['m_type']+
							'</td><td>'+txt[i]['login']+'</td><td>'+txt[i]['logout']+'</td>';
					let btn='<td><input type="button" id=typeBtn value="등급 수정" data-userid='+txt[i]['id']+'></td><tr>'
					$('#tblMember').append(check+str+btn);
				}
			}
	});
})

// 등급 수정 버튼 눌렀을 때, 다이얼로그
.on('click','#typeBtn',function() {
	$('#d_userid').val($(this).attr('data-userid'));
	$('#dlgType').dialog({
		modal:true,
		width:450,
		open:function(){
			$('#selType').empty();
			$.ajax({url:'/project/dlgType',data:{},method:'POST',datatype:'json',
				success:function(txt) {
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str='<option>'+txt[i]['m_code']+' '+txt[i]['m_type']+'</option>';
						$('#selType').append(str);
					}	
				}
			});
		},
		close:function(){}
	});
	return false;
})

// 다이얼로그 내 select option
.on('click','#selType option',function() {
	let txt=$(this).text();
	let ar=txt.split(' ');
	$('#d_code').val($.trim(ar[0]));
	$('#d_type').val($.trim(ar[1]));
	return false;
})

// 등급 수정 다이얼로그 완료 버튼 눌렀을 때, member 관리 테이블 값 중 '등급'만 변경
.on('click','#btnDone',function() {
	//console.log($('#d_userid').val());
	//console.log($('#d_code').val());

	let oParam={userid:$('#d_userid').val(),code:$('#d_code').val()};
// 	console.log(oParam);

	$.ajax({url:'/project/updateType',data:oParam,method:'POST',datatype:'json',
		success:function(txt) {
	 		if(txt=="ok") {
				$('#d_code,#d_type').val('');
				$('#memberType').val('');
				$.ajax({url:'/project/memberList',data:{},method:'POST',datatype:'json',
					success:function(txt) {
						for(i=0;i<txt.length;i++) {
							let td=txt[i]['m_type'];
							console.log("td : "+td);
							
							$('#memberType').val(td);
						}
					}
				});
			} else {
				alert('등급 업데이트에 실패했습니다.');
			}
	 		$('#dlgType').dialog('close');
		}
	});
})
</script>
</html>