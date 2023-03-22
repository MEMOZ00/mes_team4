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
function memberinsert(){
    window.open("${pageContext.request.contextPath }/system/memberinsert","팝업 테스트","width=570, height=570, top=200, left=200");
}

</script>
<!-- 자바스크립트 입력 끝-->

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>사용자관리</h2><br>
	<div class="wrap2">
	
	  <button class="button2" onclick = "memberinsert();">추가</button>
	  <button class="button2">삭제</button>
	  <button class="button2">조회</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>사원번호</th>
					<th>비밀번호</th>
					<th>사원명</th>
					<th>부서</th>
					<th>직급</th>
					<th>권한</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				
				<c:forEach var ="systemDTO" items="${systemList}">
					<tr><td><input type="checkbox" id="checkbox" value="${systemDTO.emp_no}"></td>	
						<td>${systemDTO.emp_no}</td>
						<td>${systemDTO.emp_pass}</td>
						<td>${systemDTO.emp_name}</td>
						<td>${systemDTO.dept_cd}</td>
						<td>${systemDTO.grade_cd}</td>
						<td>${systemDTO.priv_cd}</td>
						<td><button class="button2" value="${systemDTO.emp_no}">수정</button></td></tr>
				</c:forEach>

			</tbody>
		</table>

		<div id="array"></div>
	
	
	</form>
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${i}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${pageDTO.endPage + pageDTO.pageBlock}">[10페이지 이후]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
	</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->