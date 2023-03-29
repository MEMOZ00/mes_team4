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
	var win = window.open("${pageContext.request.contextPath }/system/memberinsert", "_blank", "width=570, height=570, top=200, left=200");
}
function memberupdate(a) {
	var win = window.open("${pageContext.request.contextPath }/system/memberupdate?emp_no=" + a, "_blank", "width=570, height=570, top=200, left=200");
}
function memberdelete(a) {
	location.href = '${pageContext.request.contextPath }/system/memberdelete?emp_no=' + a; 
}

</script>
<!-- 자바스크립트 입력 끝-->

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>사용자관리</h2>
	<div class="wrap2">
	
	  <button class="button2" onclick="memberinsert()">추가</button><br>

	 </div><br><br>
	
	 
	 

		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>사원번호</th>
					<th>비밀번호</th>
					<th>사원명</th>
					<th>부서</th>
					<th>직급</th>
					<th>권한</th>
					<th>수정</th>
					<th>삭제</th>
					
				</tr>
			</thead>
			
			<tbody>
				
				<c:forEach var ="systemDTO" items="${systemList}">
					<tr><td>${systemDTO.emp_no}</td>
						<td>${systemDTO.emp_pass}</td>
						<td>${systemDTO.emp_name}</td>
						<td>${systemDTO.dept_cd}</td>
						<td>${systemDTO.grade_cd}</td>
						<td>${systemDTO.priv_cd}</td>
						<td><button onclick="memberupdate('${systemDTO.emp_no}');">수정</button></td>
						<td><button onclick="memberdelete('${systemDTO.emp_no}');">삭제</button></td></tr>

			  	</c:forEach>
			</tbody>
		</table>

		<div id="array"></div>
	<div id="table_search" style="text-align:right;">
				<form action="${pageContext.request.contextPath}/system/membermain" method="get">
					<input type="text" name="search" class="input_box"> 
					<button class="button2"	type="submit" value="search">검색</button>	
				</form>
			</div>
	
<!-- 	</form> -->


	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/system/membermain?pageNum=${pageDTO.endPage + pageDTO.pageBlock}&search=${pageDTO.search}">[10페이지 이후]</a>
</c:if>
	
<!-- 본문HTML 입력 끝-->
	</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->