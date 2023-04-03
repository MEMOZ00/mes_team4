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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>

$(function(){	
	$("#myform").submit(function(){
        if($('.pass').val()==""){
        	alert("비밀번호 입력하세요");
			$('.pass').focus();
			return false;
        }
      
        if($('.pass2').val()==""){
        	alert("비밀번호 확인란을 입력하세요");
			$('.pass2').focus();
			return false;
        }
        
        if($('.pass').val() != $('.pass2').val()){
        	alert("비밀번호가 일치하지 않습니다");
			$('.pass2').focus();
			return false;
        }
        
	});
	
	});
</script>
<!-- 자바스크립트 입력 끝-->
	
	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2>마이페이지</h2><br>
	 	 
<form method="post" id="myform" action="${pageContext.request.contextPath}/member/update?num=emp_no">

<div class="wrap2">
		<input type="submit" class="button2" value="저장">
	 </div><br>
	 <br>
	<table >	
	<thead><th colspan="2" style="text-align: center; height:35px; font-size: 1.3rem ">사용자정보 (비밀번호 변경가능)</th></thead>
	<tr style="text-align: center; font-size: 1rem">
	<td>이름</td><td>김이름</td></tr>
	<tr style="text-align: center; font-size: 1rem">
	<td>사원번호</td><td>1010101</td></tr>
	<tr style="text-align: center; font-size: 1rem">
	<td>부서번호</td><td>DP101</td></tr>
	<tr style="text-align: center; font-size: 1rem">
	<td>비밀번호</td><td><input type="password" name="pass" class="pass" size=40  style="height:20px;"><br>
						비밀번호는 <span style="color:red">숫자 *자리</span>를 입력하세요</td></tr>
	<tr style="text-align: center; font-size: 1rem">
	<td>비밀번호확인</td><td><input type="password" name="pass2" class="pass2" size=40 style="height:20px;"><br>
						비밀번호를 다시한번 입력하세요</td></tr>
	</table>		
</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->