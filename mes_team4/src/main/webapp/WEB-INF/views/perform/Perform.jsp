<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>

</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 생산실적 </h2><br>
	<div class="wrap2">
	  <button class="button2">추가</button>
	  <button class="button2">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>실적번호</th>
					<th>작업지시코드</th>
					<th>라인코드</th>
					<th>품목코드</th>
					<th>수주코드</th>
					<th>실적일자</th>
					<th>양품</th>
					<th>불량</th>
					<th>불량사유</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="PerformDTO" items="${PerformList }">

				<tr>
				<td><input type="checkbox" name="chbox" value="${PerformDTO.perform_no}"></td>
				<td>${PerformDTO.perform_no}</td>
    			<td>${PerformDTO.instruction_code}</td>
    			<td>${PerformDTO.line_cd}</td>
    			<td>${PerformDTO.product_cd}</td>
    			<td>${PerformDTO.order_cd}</td>    			
    			<td>${PerformDTO.perform_date}</td>
    			<td>${PerformDTO.fair_prod}</td>
    			<td>${PerformDTO.defect_prod}</td>
    			<td>${PerformDTO.defect_remarks}</td>
    			<td>${PerformDTO.remarks}</td>
    			<td><button class="button2" onclick="showPopup2('${PerformDTO.perform_no}');">수정</button></td>
    			</tr>
   			 
				</c:forEach>
			</tbody>
		</table>
		
		<div id="array"></div>
	
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->