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
  
$('#update').submit(function(){
	
	if($('.emp_name').val()==""){
		alert("사원명을 입력하세요");
		$('.emp_name').focus();
		return false;
	}
  //class="pass"
  if($('.emp_pass').val()==""){
    	alert("현재비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
  
  if($('.emp_pass').val() != ${systemDTO.emp_pass}){
    	alert("현재비밀번호 틀림");
		$('.emp_pass').focus();
		return false;
    }
    
  if($('.newemp_pass').val()==""){
    	alert("새 비밀번호를 입력하세요");
		$('.emp_pass').focus();
		return false;
    }
    
  if($('.newemp_pass2').val()==""){
    	alert("새 비밀번호를 확인해주세요");
		$('.emp_pass2').focus();
		return false;
    }
    
  if($('.newemp_pass').val() != $('.newemp_pass2').val()){
    	alert("새 비밀번호 일치하지 않음");
		$('.emp_pass2').focus();
		return false;
    }
    
  if($('.dept_cd').val()==""){
    	alert("부서를 체크하세요");
		return false;
    }
    
  if($('.grade_cd').val()==""){
    	alert("직급을 체크하세요");
		return false;
    }
    
  if($('.priv_cd').val()==""){
    	alert("권한을 체크하세요");
		return false;
    } 
  document.update.submit();
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
	
	
	<form action="${pageContext.request.contextPath }/system/memberupdatepro" name="update" id="update" method="post">
		
<fieldset style="width:500px; height:450px; padding-left:20px; padding-right: 20px;">
<h2 style= "margin-top: 30px; margin-bottom: 15px; text-align: center" >사용자수정</h2>
					<input type="hidden" name="emp_no" class="emp_no" value="${systemDTO.emp_no}">
					<div>
					<label>사원명</label>
					<input type="text" name="emp_name" class="emp_name" style="width:150px;height:30px;font-size:18px;" value="${systemDTO.emp_name}" readonly><br><br>
					</div>
					<div>
					<label>현재비밀번호</label>
					<input type="password" name="emp_pass" class="emp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>새 비밀번호</label>
					<input type="password" name="newemp_pass" class="newemp_pass" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<div>
					<label>새 비밀번호확인</label>
					<input type="password"  name="newemp_pass2" class="newemp_pass2" style="width:150px;height:30px;font-size:18px;"><br><br>
					</div>
					<label>부서</label><br>
					<div>
						<input type="radio" name="dept_cd" class="dept_cd" value="총무부" ${systemDTO.dept_cd eq '총무부' ? 'checked':''}/> 총무부
						<input type="radio" name="dept_cd" class="dept_cd" value="인사부" ${systemDTO.dept_cd eq '인사부' ? 'checked':''}/> 인사부
						<input type="radio" name="dept_cd" class="dept_cd" value="영업부" ${systemDTO.dept_cd eq '영업부' ? 'checked':''}/> 영업부
						<input type="radio" name="dept_cd" class="dept_cd" value="생산부" ${systemDTO.dept_cd eq '생산부' ? 'checked':''}/> 생산부
						<input type="radio" name="dept_cd" class="dept_cd" value="자재관리부" ${systemDTO.dept_cd eq '자재관리부' ? 'checked':''}/> 자재관리부	
					</div><br>
					<label>직급</label><br>
					<div>
						<input type="radio" name="grade_cd" class="grade_cd" value="대표" ${systemDTO.grade_cd eq '대표' ? 'checked':''}/> 대표
						<input type="radio" name="grade_cd" class="grade_cd" value="이사" ${systemDTO.grade_cd eq '이사' ? 'checked':''}/> 이사
						<input type="radio" name="grade_cd" class="grade_cd" value="부장" ${systemDTO.grade_cd eq '부장' ? 'checked':''}/> 부장
						<input type="radio" name="grade_cd" class="grade_cd" value="과장" ${systemDTO.grade_cd eq '과장' ? 'checked':''}/> 과장
						<input type="radio" name="grade_cd" class="grade_cd" value="대리" ${systemDTO.grade_cd eq '대리' ? 'checked':''}/> 대리	
						<input type="radio" name="grade_cd" class="grade_cd" value="사원" ${systemDTO.grade_cd eq '사원' ? 'checked':''}/> 사원	
					</div><br>
					<label>권한</label><br>
					<div>
						<input type="checkbox" class="priv_cd" name="priv_cd" value="0" ${systemDTO.priv_cd.contains("0") ? 'checked':''}/> 기본등록
						<input type="checkbox" class="priv_cd" name="priv_cd" value="1" ${systemDTO.priv_cd.contains("1") ? 'checked':''}/> 사원조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="2" ${systemDTO.priv_cd.contains("2") ? 'checked':''}/> 사원관리
						<input type="checkbox" class="priv_cd" name="priv_cd" value="3" ${systemDTO.priv_cd.contains("3") ? 'checked':''}/> 재고조회
						<input type="checkbox" class="priv_cd" name="priv_cd" value="4" ${systemDTO.priv_cd.contains("4") ? 'checked':''}/> 재고관리 
					</div>

			</fieldset>
		
	</form>
<div style="text-align:center">
		<button class="button2" form="update" onclick="submit">사용자수정</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->