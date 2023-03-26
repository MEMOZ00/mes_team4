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
	var win = window.open("${pageContext.request.contextPath }/order/orderinsert?instruction_cd=" + a, "_blank", "width=570, height=570, top=200, left=200");
}
function orderupdate(a) {
	var win = window.open("${pageContext.request.contextPath }/order/orderupdate?instruction_cd=" + a, "_blank", "width=570, height=570, top=200, left=200");
}
function orderdelete(a) {
	location.href = '${pageContext.request.contextPath }/order/orderdelete?instruction_cd=' + a; 
}

</script>
<!-- 자바스크립트 입력 끝-->

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>사용자관리</h2>
	<div class="wrap2">
	
	 </div><br>
	
	 
	 

		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>수주코드</th>
					<th>품목코드</th>
					<th>수주량</th>
					<th>생산량</th>
					<th>원자재소요량</th>
					<th>라인코드</th>
					<th>납품예정일</th>
					<th>생산완료일</th>
					<th>원자재위치</th>
					<th>제품적재위치</th>
					<th>추가</th>
					<th>수정</th>
					<th>삭제</th>
					
				</tr>
			</thead>
			
			<tbody>
				
				<c:forEach var ="OrderDTO" items="${orderList}">
					<tr><td>${orderDTO.order_cd}</td>
						<td>${orderDTO.prodect_cd}</td>
						<td>${orderDTO.order_count}</td>
						<td>${orderDTO.product_count}</td>
						<td>${orderDTO.consumtion}</td>
						<td>${orderDTO.line_cd}</td>
						<td>${orderDTO.deliver_date}</td>
						<td>${orderDTO.procom_date}</td>
						<td>${orderDTO.wh_dv}</td>
						<td>${orderDTO.wh_dv2}</td>
						<td><button class="button2" onclick="orderinsert(${orderDTO.instruction_cd})">추가</button></td>
						<td><button class="button2" onclick="orderupdate(${orderDTO.instruction_cd})">수정</button></td>
						<td><button class="button2" onclick="orderdelete(${orderDTO.instruction_cd})">삭제</button></td>

			  	</c:forEach>
			</tbody>
		</table>

		<div id="array"></div>
	<div id="table_search" style="text-align:right;">
				<form action="${pageContext.request.contextPath}/order/ordermain" method="get">
					<input type="text" name="search" class="input_box"> 
					<button class="button2"	type="submit" value="search">조회</button>	
				</form>
			</div>
	
<!-- 	</form> -->


	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/order/ordermain?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/order/ordermain?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/ordermain?pageNum=${pageDTO.endPage + pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이후]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
	</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->