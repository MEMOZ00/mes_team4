<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!-- 헤더파일들어가는 곳 -->
<%-- <jsp:include page="../main/Header.jsp" /> --%>
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//	alert("준비");
//submit 버튼을 클릭했을때 폼태그 전송되어지면 이벤트 onsubmit()
// id="join" 폼태그 표시 => 전송
  
$('#insert').submit(function(){

	if($('.emp_name').val()==""){
		alert("사원명을 입력하세요");
		$('.emp_name').focus();
		return false;
	}
  //class="pass"
    if($('.emp_pass').val()==""){
    	alert("비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
  
    if($('.emp_pass2').val()==""){
    	alert("비밀번호2 입력하세요");
		$('.emp_pass2').focus();
		return false;
    }
    
    if($('.emp_pass').val() != $('.emp_pass2').val()){
    	alert("비밀번호 틀림");
		$('.emp_pass2').focus();
		return false;
    }
    
    setTimeout(function() {
	  	 opener.parent.location.reload();
	 	 window.close();
	  }, 1000);

});//
});
</script>
<!-- 자바스크립트 입력 끝-->

<div id="contents">
	<!-- 본문HTML 입력 시작-->
	
	
	<form action="${pageContext.request.contextPath }/system/memberinsertpro" name="insert" id="insert" method="post">
		
<fieldset style="width:500px; height:450px; padding-left:20px; padding-right: 20px;">
<h2 style= "margin-top: 30px; margin-bottom: 15px; text-align: center" >사용자추가</h2>
					<div>
					<label>사원명</label>
					<input type="text" name="emp_name" class="emp_name" style="width:150px;height:30px;font-size:18px;" autofocus="autofocus"><br><br>
					</div>
					<div>
					<label>비밀번호</label>
					<input type="password" name="emp_pass" class="emp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>비밀번호확인</label>
					<input type="password" name="emp_pass2" class="emp_pass2" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<label>부서</label><br>
					<div>
						<input type="radio" name="dept_cd" class="dept_cd" id="11" value="11" checked="checked"/> 총무부
						<input type="radio" name="dept_cd" class="dept_cd" id="22" value="22" /> 인사부
						<input type="radio" name="dept_cd" class="dept_cd" id="33" value="33" /> 영업부
						<input type="radio" name="dept_cd" class="dept_cd" id="44" value="44" /> 생산부
						<input type="radio" name="dept_cd" class="dept_cd" id="55" value="55" /> 자재관리부	
					</div><br>
					<label>직급</label><br>
					<div>
						<input type="radio" name="grade_cd" class="grade_cd" value="대표" /> 대표
						<input type="radio" name="grade_cd" class="grade_cd" value="이사" /> 이사
						<input type="radio" name="grade_cd" class="grade_cd" value="부장" /> 부장
						<input type="radio" name="grade_cd" class="grade_cd" value="과장" /> 과장
						<input type="radio" name="grade_cd" class="grade_cd" value="대리" /> 대리	
						<input type="radio" name="grade_cd" class="grade_cd" value="사원" checked="checked"/> 사원	
					</div><br>
					<label>권한</label><br>
					<div>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="0" /> 기본등록
						<input type="checkbox" class="priv_cd" name="priv_cd" value="1" checked="checked"/> 사원조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="2" /> 사원관리
						<input type="checkbox" class="priv_cd" name="priv_cd" value="3" /> 재고조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="4" /> 재고관리 
					</div>
					
		
					
			</fieldset>
		
	</form>
<div style="text-align:center">
		<button class="button2" form="insert" onclick="submit">사용자추가</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->