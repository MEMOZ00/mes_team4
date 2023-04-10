<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function DeliverUpdate(rel_count,product_dv){
	
	
	$(document).ready(function(){ //Jquery 시작
		// 선택 유효성 검사		
		var order_cd=opener.document.getElementById("order_cd").value;
		var pchor_cd=document.getElementById("pchor_cd").value;
// 		var product_dv=document.getElementById("product_dv").value;
// 		var com="완제품";
// 		alert(com);
// 		alert(product_dv);
// 		if(product_dv equal com){
// 			alert("완제품만 선택 할 수 있습니다.");
// 			return false;
// 		}
// 		if($('#instruction_code').val()==""){
// 			alert("작업지시코드를 선택하세요");
// 			$('#instruction_code').focus();
// 			return false;
// 		}
// 		if(product_dv != com){
// 			alert("완제품만 선택 할 수 있습니다.");
// 			return false;
// 		}
			if(order_cd != pchor_cd){
				alert("선택되어 있는 수주코드의 출고품이 아닙니다.");
				return false;
			}
				
			else{
		     	  // 유효성 검사 통과시 선택 진행
				  var result = confirm("이 행을 선택 하시겠습니까?");
				  if (result == true){
						opener.setChildValue2(rel_count);

						window.close();
				  } else {
				  return false;
				  }
			}
		}); //Jquery 끝	
}

</script>
</head>
<!-- 자바스크립트 입력 끝-->


	<div id="innerContents">
<!-- 본문HTML 입력 시작-->
	<h2>출고관리</h2><br>
	
	
<!--     <div class="search"> -->
<%--     <form action="${pageContext.request.contextPath}/rel/relpage" method="get"> --%>
<!--        <select name="select" class="button2"> -->
<!--        		<option value="wh_name">창고명</option> -->
<!--        		<option value="product_name">출고품목명</option> -->
<!--        </select> -->
<!--        <input type="text" name="search" class="button2"> -->
<!--        <input type="submit" class="button2" value="검색" > -->
<!--      </form>   -->
<!--     </div> -->

	
	<div class="wrap2">
	 </div><br>
	 <br>
	 
	<div>전체 ${pageDTO.count }건</div>
	<form name="rellist">
<!-- 		<input type="hidden" value=""> -->
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고코드</th>
					<th>출고창고</th>
					<th>출고품목명</th>
					<th>품목구분</th>
					<th>출고일자</th>
					<th>출고수량</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${relList }">
			<input type="hidden" name="pchor_cd" id="pchor_cd" value="${dto.pchor_cd}">
				<tr>					
					<td>${dto.rel_schedule_cd}</td>
					<td>${dto.wh_name}</td>
					<td>${dto.product_name}</td>
					<td><input type="hidden" name="product_dv" id="product_dv" value="${dto.product_dv}">${dto.product_dv}</td>
					<td>${dto.rel_date}</td>
					<td>${dto.rel_count }</td>
					<td>${dto.remarks}</td>
					<td>
					<button class="button2" onclick="DeliverUpdate('${dto.rel_count}','${dto.product_dv}');">선택</button>
					</td>					
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</form>

	<!-- 페이징 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/deliver/deliverinstlist2?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/deliver/deliverinstlist2?pageNum=${i}&search=${pageDTO.search}&select=${pageDTO.select}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/deliver/deliverinstlist2?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&select=${pageDTO.select}">[10페이지 다음]</a>
</c:if>	

<!-- 본문HTML 입력 끝-->
	</div>
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->