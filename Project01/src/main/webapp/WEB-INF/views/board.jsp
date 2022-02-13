<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
 <style>
	  a {
	  	text-decoration : none;
	  }
	  table {
	 	border-collapse: collapse;
	 	width: 1000px;    
	 	margin-top : 20px;
	 	text-align: center;
	  }
	  td, th {
	  	border : 1px solid black;
	  	height: 50px;
	  }
	  th {
	  	font-size : 17px;
	  }
	  thead {
	  	font-weight: 700;
	  }
	  .table_wrap {
	  	margin : 50px 0 0 50px;
	  }
	  .bno_width {
	  	width: 12%;
	  }
	  .writer_width {
	  	width: 20%;
	  }
	  .regdate_width {
	  	width: 15%;
	  }
	  .updatedate_width {
	  	width: 15%;
	  }
	  .write {
	  	font-size: 20px;
	    padding: 6px 12px;
	    background-color: #fff;
	    border: 1px solid #ddd;
	    font-weight: 600;
	  }
	  
	  .pageInfo{
	     list-style : none;
	     display: inline-block;
	     margin: 50px 0 0 100px;      
	  }
  	  .pageInfo li{
	     float: left;
	     font-size: 20px;
	     margin-left: 18px;
	     padding: 7px;
	     font-weight: 500;
  	  }
	  a:link {color:black; text-decoration: none;}
	  a:visited {color:black; text-decoration: none;}
	  a:hover {color:black; text-decoration: underline;}
 </style>
<body>
<h1 align=center>게시판 목록</h1>
<div class="table_wrap" align=center>
	<a href="/project/insertBoard" class="write">글쓰기</a>
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="list" varStatus="status">
            <tr>
<%--             	<td><c:out value="${list.bno}"/></td> --%>
            	<td>
	     			<c:out value="${status.count}"/>
				</td>
				<td>
					<a id=get href='<c:out value="${list.bno}"/>'>
                        <c:out value="${list.title}"/>
                    </a>
                </td>
                <td><c:out value="${list.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
            </tr>
        </c:forEach>
	</table>
	
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area" id="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        	<c:if test="${pm.prev}">
                <li class="previous"><a href="${pm.startPage-1}">Previous</a></li>
            </c:if>
            
        	<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
        		<li class="pageInfo_btn"><a href="${num}">${num}</a></li>
        	</c:forEach>
        	
        	<c:if test="${pm.next}">
                <li class="next"><a href="${pm.endPage+1}">Next</a></li>
            </c:if>  
        	</ul>
        </div>
    </div>
    
	<form id="move" method="get">
		<input type="hidden" name="pageNum" value="${pm.page.pageNum}">
        <input type="hidden" name="amount" value="${pm.page.amount}">    
    </form>
</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function() {
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	
	function checkAlert(result){
		console.log("["+result+"]");
		if(result=='') return;
		if(result=="ok"){
			alert("등록이 완료되었습니다.");
		}
		if(result=="update") {
			alert("수정이 완료되었습니다.");
		}
		if(result=="delete") {
			alert("삭제가 완료되었습니다.");
		}
	}	
})

.on('click','#get',function(e) {
	e.preventDefault(); 
    $('#move').append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
    $('#move').attr("action","/project/getBoard");
    $('#move').submit();
})
.on('click','.pageInfo a',function(e) {
	e.preventDefault();
	 $('#move').find("input[name='pageNum']").val($(this).attr("href"));
	 $('#move').attr("action", "/project/listBoard");
	 $('#move').submit();
})
</script>
</html>