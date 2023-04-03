<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
function sub(){
	$(document).ready(function(){
// 	 	alert("준비");
			if($('#line_cd').val()==""){
				alert("라인코드를 입력하세요");
				$('#line_cd').focus();
				return false;
			}
			if($('#product_cd').val()==""){
				alert("품목코드를 입력하세요");
				$('#product_cd').focus();
				return false;
			}
			if($('#perform_date').val()==""){
				alert("실적일자를 입력하세요");
				$('#perform_date').focus();
				return false;
			}
			if($('#fair_prod').val()==""){
				alert("양품 수량을 입력하세요");
				$('#fair_prod').focus();
				return false;
			}
			if($('#defect_prod').val()==""){
				alert("불량 수량을 입력하세요");
				$('#defect_prod').focus();
				return false;
			}
	
	window.opener.name = "parentPage";
	document.PerformUpdate.target="parentPage";
	document.PerformUpdate.action="${pageContext.request.contextPath}/perform/performupdatepro";
	document.PerformUpdate.submit();
	self.close();
	});
}
	function rst(){
	document.PerformUpdate.reset();
	}
	
	$(document).ready(function () {
//	 	alert($("#inst").val());
// 			$.ajax({
// 				url:'${pageContext.request.contextPath}/perform/callcd',
// 				data:{'ic':$("#inst").val()},
// 				success:function(result){
// 					  $('#line_cd').val(result);
// 				}
// 			});
			
// 			$.ajax({
// 				url:'${pageContext.request.contextPath}/perform/callcd2',
// 				data:{'ic':$("#inst").val()},
// 				success:function(result){
// 					  $('#product_cd').val(result);
// 				}
// 			});
			
			$("#inst").on("change", function(){
				$.ajax({
					url:'${pageContext.request.contextPath}/perform/callcd',
					data:{'ic':$("#inst").val()},
					success:function(result){
						  $('#line_cd').val(result);			
					}
				});
				
				$.ajax({
					url:'${pageContext.request.contextPath}/perform/callcd2',
					data:{'ic':$("#inst").val()},
					success:function(result){
						$('#product_cd').val(result);			
					}
				});			
			});
	});
</script>


</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">생산실적 수정 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">등록</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="PerformUpdate" method="post">
		<input type="hidden" name="perform_cd" value="${perform.perform_cd}">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
<!-- 					<th>실적코드</th> -->
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>품목코드</th>				
				</tr>
			</thead>
			
			<tbody>
				<tr>
					
					<td><select name="instruction_code"  id="inst">
							<option value="${perform.instruction_code}" selected>${perform.instruction_code}</option>
								<c:forEach var="dto" items="${instMap}">
									<c:if test="${dto.instruction_code != perform.instruction_code}">											
									<option value="${dto.instruction_code}">${dto.instruction_code}</option>	
									</c:if>						
								</c:forEach>
      					</select></td>
    				<td><input type="text" name="line_cd" id="line_cd" value="${perform.line_cd}"></td>
    				<td><input type="text" name="product_cd" id="product_cd" value="${perform.product_cd}"></td>			
				</tr>
								
			</tbody>
		</table>
		
		<br>
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">					
					<th>실적일자</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
    				<td><input type="date" name="perform_date" id="perform_date" value="${perform.perform_date}"></td>
    				<td><input type="text" name="fair_prod" id="fair_prod" value="${perform.fair_prod}"></td>
    				<td><input type="text" name="defect_prod" id="defect_prod" value="${perform.defect_prod}"></td>
    				<td><input type="text" name="defect_remarks" id="defect_remarks" value="${perform.defect_remarks}"></td>
    				<td><input type="text" name="remarks" id="remarks" value="${perform.remarks}"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>