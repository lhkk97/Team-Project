<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
table {border-collapse:collapse;}
tr,td,th{
	box-sizing: border-box;
    border: 1px solid #ddd;
}
input {
	box-sizing: border-box;
    border: 1px solid #ddd;
}
input.btn {
	margin-left:700px;
}
</style>
<div>
<table id=tblMember></table>
</div><br>
<div class="booking-list_btn" ><input type=button id=deleteBtn value="선택삭제" class=btn></div>

<div id=dlgType style='display:none;'>
<table>
<tr>
	<td>
		<select id=selType size=10 style='width:220px'></select>
	</td>
	<td valign=top>
		<table>
		<tr><td>아이디&nbsp;<input type=text id=d_userid name=d_userid readonly></td></tr>
		<tr><td>번호&nbsp;<input type=number id=d_code name=d_code></td></tr>
		<tr><td>등급&nbsp;<input type=text id=d_type name=d_type></td></tr>
		<tr><td align=right>
			<button id=btnDone>완료</button>
		</td></tr>
		</table>
	</td>
</tr>
</table>
</div>

<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function() {
	memberList();
})
.on('click','#deleteBtn',function() {
	if($('input[name=check]:checked').length==0) {
		alert('하나 이상 체크하세요.');
		return false;
	}
	let check='';
	$('input[name=check]:checked').each(function() {
		check+=$(this).val()+",";
	});
	console.log(check);
	if(!confirm("정말 삭제하시겠습니까?")) return false;
	$.ajax({url:'/project/deleteMember',data:{check:check},
			method:'POST',datatype:'json',
			success:function(txt) {
				console.log(txt);
				if(txt=="ok") {
					alert('삭제 완료.');
					document.location='/project/member';
				} else {
					alert('다시 삭제해주세요.');
				}
			}
	});
})

// 등급 수정 버튼 눌렀을 때, 다이얼로그
.on('click','#typeBtn',function() {
	$('#d_userid').val($(this).attr('data-userid'));
	$.ajax({url:'/project/getMember',data:{},method:'GET',datatype:'json',
		success:function(txt) {
			let id=""
			for(i=0;i<txt.length;i++) {
				id=txt[i]['userid'];
				if($('#d_userid').val()==id) {
					$('#d_code').val(txt[i]['m_code']);
					$('#d_type').val(txt[i]['m_type']);
				}
			}	
		}
	});
	$('#dlgType').dialog({
		modal:true,
		width:450,
		open:function(){
			$('#selType').empty();
			$.ajax({url:'/project/dlgType',data:{},method:'POST',datatype:'json',
				success:function(txt) {
					for(i=0;i<txt.length;i++) {
						let str='<option>'+txt[i]['m_code']+' '+txt[i]['m_type']+'</option>';
						$('#selType').append(str);
					}	
				}
			});
		},
		close:function(){
			$('#d_code,#d_type').val('');
		}
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

// 등급 수정 다이얼로그 완료 버튼
.on('click','#btnDone',function() {	
	if($('#d_userid').val()=='') {
		alert("아이디를 입력하세요");
		return false;
	}
	if($('#d_code').val()=='') {
		alert("번호를 입력하세요");
		return false;
	}
	if($('#d_type').val()=='') {
		alert("등급을 입력하세요");
		return false;
	}
	let oParam={userid:$('#d_userid').val(),code:$('#d_code').val()};
	$.ajax({url:'/project/updateType',data:oParam,method:'POST',datatype:'json',
		success:function(txt) {
	 		if(txt=="ok") {
	 			$('#tblMember').empty();
				memberList();
				alert('수정 완료했습니다.');
			} else {
				alert('등급 업데이트에 실패했습니다.');
			}
		}
	});
	$('#dlgType').dialog('close');
})

function memberList() {
	$.ajax({url:"/project/memberList",data:{},datatype:"json",
		method:"GET",
		success:function(txt) {
			let head='<thead><tr><th></th><th>이름</th><th>성별</th><th>전화번호</th><th>아이디</th><th>비밀번호'
					+'</th><th>등급</th><th>로그인시간</th><th>로그아웃시간</th></tr></thead>'
			$('#tblMember').append(head);
			
			for(i=0;i<txt.length;i++) {
				let check='<tr><td><input type="checkbox" name="check" value="'+txt[i]['id']+'"></td>'
				let str='<td>'+txt[i]['name']+'</td><td>'+txt[i]['gender']+'</td><td>'
						+txt[i]['mobile']+'</td><td>'+txt[i]['id']+'</td><td>'+txt[i]['pw']
						+'</td><td id=memberType>'+txt[i]['m_type']
						+'</td><td>'+txt[i]['login']+'</td><td>'+txt[i]['logout']+'</td>';
				let btn='<td><input type="button" id=typeBtn value="등급 수정" data-userid='+txt[i]['id']+'></td><tr>'
				$('#tblMember').append(check+str+btn);
			}
		}
	});
}
</script>