<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
function showPopup(){
    window.open("test.html","팝업 테스트","width=800, height=500, top=200, left=200");
}	
</script>
<!-- 자바스크립트 입력 끝-->


<!-- 본문HTML 입력 시작-->

	<div id ="homebutton">

	
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon3.png"><br>사용자관리</button>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon4.png"><br>수주현황</button><br>
	  <br>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon2.png"><br>생산현황</button>
	  <button class="button3"><img src="${pageContext.request.contextPath}/resources/image/icon1.png"><br>자재현황</button>
	  
	</div>

	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="Footer.jsp" />
<!-- 푸터 들어가는 곳 -->