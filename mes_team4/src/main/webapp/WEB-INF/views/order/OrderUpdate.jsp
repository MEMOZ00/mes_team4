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
	
	if($('.instruction_qt').val()==""){
		alert("생산지시수량을 입력하세요");
		$('.instruction_qt').focus();
		return false;
	}
  //class="pass"
  if($('.line_cd').val()==""){
    	alert("생산라인 코드를 선택하세요");
		$('.line_cd').focus();
		return false;
    }
  
  if($('.instruction_date').val()==""){
    	alert("생산지시일자를 선택하세요");
		$('.instruction_date').focus();
		return false;
    }
    
  if($('.instruction_date').val()==""){
    	alert("작업지시상태를 선택해주세요");
		$('.instruction_date').focus();
		return false;
    }
 
  document.update.submit();
  setTimeout(function() {
	  	 opener.parent.location.reload();
	 	 window.close();
	  }, 100);
});//
});

</script>
<!-- 자바스크립트 입력 끝-->

<div id="contents">
	<!-- 본문HTML 입력 시작-->
	
	
	<form action="${pageContext.request.contextPath }/order/orderupdatepro" name="update" id="update" method="post">
		
<fieldset style="width:500px; height:450px; padding-left:20px; padding-right: 20px;">
<h2 style= "margin-top: 30px; margin-bottom: 15px; text-align: center" >사용자추가</h2>
		
					<div>
					<label>수주코드</label>
					<input type="text" name="order_cd" class="order_cd" style="width:150px;height:30px;font-size:18px;" value="${orderDTO.order_cd}" readonly><br><br>
					</div>
					<div>
					<label>품목코드</label>
					<input type="text" name="product_cd" class="product_cd" style="width:150px;height:30px;font-size:18px;" value="${orderDTO.product_cd}" readonly><br><br>
					</div>
					<div>
					<label>지시수량</label>
					<input type="text" name="instruction_qt" class="instruction_qt" style="width:150px;height:30px;font-size:18px;" value="${orderDTO.instruction_qt}"><br><br>
					</div>
					<div>
					<label>라인코드</label><br>
						<input type="radio" name="line_cd" class="line_cd" value="l1" ${orderDTO.line_cd eq 'l1' ? 'checked':''}/> 1라인
						<input type="radio" name="line_cd" class="line_cd" value="l2" ${orderDTO.line_cd eq 'l2' ? 'checked':''}/> 2라인
						<input type="radio" name="line_cd" class="line_cd" value="l3" ${orderDTO.line_cd eq 'l3' ? 'checked':''}/> 3라인
					</div><br>
					<div>
					<label>생산지시일자</label>
					<input type="date" name="instruction_date" class="instruction_date" style="width:150px;height:30px;font-size:18px;" value="${orderDTO.instruction_date}"><br><br>
					</div>
					<div>
					<label>작업지시상태</label><br>
						<input type="radio" name="instruction_state" class="instruction_state" value="off" ${orderDTO.instruction_state eq 'off' ? 'checked':''}/>대기
						<input type="radio" name="instruction_state" class="instruction_state" value="on" ${orderDTO.instruction_state eq 'on' ? 'checked':''}/>지시
					</div>
					
			</fieldset>
		
	</form>
<div style="text-align:center">
		<button class="button2" form="update" onclick="submit">작업지시수정</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->