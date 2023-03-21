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
function showPopup(){
    window.open("${pageContext.request.contextPath}/line/lineinsert","lineinsert","width=1000, height=500, top=200, left=200");

}
function showPopup2(cd){
    window.open("${pageContext.request.contextPath}/line/lineupdate?line_cd="+cd,"lineupdate","width=1000, height=500, top=200, left=200");

}
function chdelete(){
	document.linelist.action="${pageContext.request.contextPath}/line/linedelete";
	document.linelist.submit();
}
</script>
<!-- 자바스크립트 입력 끝-->


	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2> 설비관리 </h2><br>
	<div class="wrap2">
	  <button class="button2" onclick="showPopup();">추가</button>
	  <button class="button2" onclick="chdelete();">삭제</button>
	  
	 </div><br>
	 <br>
	 
	 
	<form name="linelist">
		<input type="hidden" value="">
		
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>선택</th>
					<th>라인코드</th>
					<th>라인명</th>
					<th>공정</th>
					<th>가동상태</th>
					<th>적요</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="LineDTO" items="${LineList }">

				<tr>
				<td><input type="checkbox" name="chbox" value="${LineDTO.line_cd}"></td>
				<td>${LineDTO.line_cd}</td>
    			<td>${LineDTO.line_name}</td>
    			<td>${LineDTO.line_process}</td>
    			<td>
				<c:if test="${LineDTO.line_status==1}">가동중</c:if>
    			<c:if test="${LineDTO.line_status==2}">대기중</c:if>
    			<c:if test="${LineDTO.line_status==3}">고장</c:if>
    			</td>
    			<td>${LineDTO.remarks}</td>
    			<td><button class="button2" onclick="showPopup2('${LineDTO.line_cd}');">수정</button></td>
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