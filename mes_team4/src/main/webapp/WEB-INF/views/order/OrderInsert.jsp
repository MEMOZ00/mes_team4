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

	if($('.product_count').val()==""){
		alert("생산량을 입력하세요");
		$('.product_count').focus();
		return false;
	}
  //class="pass"
    if($('.line_cd').val()==""){
    	alert("생산할 라인을 선택하세요");
		$('.line_cd').focus();
		return false;
    }
  
    if($('.wh_dv').val()==""){
    	alert("원자재위치를 선택하세요");
		$('.wh_dv').focus();
		return false;
    }
    
    if($('.wh_dv2').val()==""){
    	alert("완제품적재위치를 선택하세요");
		$('.wh_dv2').focus();
		return false;
    }


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
	
	
	<form action="${pageContext.request.contextPath }/order/orderinsertpro" name="insert" id="insert" method="post">
		
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
					<label>생산량</label>
					<input type="text" name="product_count" class="product_count" style="width:150px;height:30px;font-size:18px;" max="${orderDTO.product_count}"><br><br>
					</div>
					<div>
					<label>라인코드</label><br>
						<input type="radio" name="line_cd" class="line_cd" value="l1" /> 1라인
						<input type="radio" name="line_cd" class="line_cd" value="l2" /> 2라인
						<input type="radio" name="line_cd" class="line_cd" value="l3" /> 3라인
					</div><br>
					<div>
					<label>생산완료일</label>
					<input type="date" name="procom_date" class="procom_date" style="width:150px;height:30px;font-size:18px;" value="${orderDTO.procom_date}" readonly><br><br>
					</div>
					<div>
					<label>원자재위치</label><br>
						<input type="checkbox" class="wh_dv" name="wh_dv" value="rp1" /> 원자재1창고
						<input type="checkbox" class="wh_dv" name="wh_dv" value="rp2" /> 원자재2창고
						<input type="checkbox" class="wh_dv" name="wh_dv" value="rp3" /> 원자재3창고
					</div>
					<div>
					<label>제품적재위치</label><br>
						<input type="checkbox" class="wh_dv2" name="wh_dv2" value="p1" /> 완제품1창고
						<input type="checkbox" class="wh_dv2" name="wh_dv2" value="p2" /> 완제품2창고
						<input type="checkbox" class="wh_dv2" name="wh_dv2" value="p3" /> 완제품3창고
					</div>

			</fieldset>
		
	</form>
<div style="text-align:center">
		<button class="button2" form="insert" onclick="submit">작업지시추가</button>
	  	<button class="button2" onclick="window.close()">창닫기</button>
	  	</div>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../main/Footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->