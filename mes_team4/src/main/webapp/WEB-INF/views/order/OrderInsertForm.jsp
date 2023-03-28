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
function orderinsert(a){
	var win = window.open("${pageContext.request.contextPath }order/orderinsert?order_cd=" + a, "_blank", "width=570, height=570, top=200, left=200");
}

</script>
<!-- 자바스크립트 입력 끝-->

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>작업지시추가</h2>
	<div class="wrap2">
	 </div><br>

		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>수주코드</th>
					<th>거래처코드</th>
					<th>사원코드</th>
					<th>품목코드</th>
					<th>수주일자</th>
					<th>납품예정일</th>
					<th>수주량</th>
					<th>완료여부</th>	
					<th>추가</th>	
				</tr>
			</thead>
			
			<tbody>
				
				<c:forEach var ="OMDTO" items="${omList}">
					<tr><td>${omList.order_cd}</td>
						<td>${omList.business_cd}</td>
						<td>${omList.emp_no}</td>
						<td>${omList.product_cd}</td>
						<td>${omList.order_date}</td>
						<td>${omList.deliver_date}</td>
						<td>${omList.order_count}</td>
						<td>${omList.om_com}</td>
<!-- 		조건걸기: 1. (기본)수주가 완료된 상황 = omList.om_com이 1 -->
<!-- 		2. 수주량>지시수량일때 omList.order_count > instrution_qt의 합 -->
<!-- 			일 때 작업지시 추가버튼이 보이게 함 -->
						<td><button class="button2" onclick="orderinsert(${omList.order_cd})">추가</button></td>
			  	</c:forEach>
			</tbody>
		</table>

		<div id="array"></div>
	<div id="table_search" style="text-align:right;">
				<form action="${pageContext.request.contextPath}/order/orderinsertform" method="get">
					<input type="text" name="search" class="input_box"> 
					<button class="button2"	type="submit" value="search">조회</button>	
				</form>
			</div>
	
<!-- 	</form> -->


	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/order/orderinsertform?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/order/orderinsertform?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/orderinsertform?pageNum=${pageDTO.endPage + pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이후]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
	</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->