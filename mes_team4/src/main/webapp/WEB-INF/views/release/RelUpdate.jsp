<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script>
// $(document).ready(function() { // j쿼리 시작
// 	// 입고리스트 팝업
// 	$(document).on('click', '#recListBtn', function() {
// 		var trIndex = $(this).parent().parent().index();
// 		var rec_schedule_cd = 'rec';
		
// 		var link = '${pageContext.request.contextPath}/rel/reclist?trIndex='+trIndex+'&rec_schedule_cd='+rec_schedule_cd;     
// 		var popupWidth = 500;
// 		var popupHeight = 700;
// 		var popupX = (window.screen.width/2) - (popupWidth/2) + 800;
// 		var popupY= (window.screen.height/2) - (popupHeight/2);
		
// 	  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
// 	});
	
// }); // j쿼리 끝

function recListBtn(){
	var link = "${pageContext.request.contextPath}/rel/reclist";     
	var popupWidth = 1200;
	var popupHeight = 500;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
}

function sub(){
	$(document).ready(function(){
		// submit 유효성 검사
		var result = confirm("수정사항을 등록하시겠습니까?");
		if (result == true){   			
			if($('#rec_schedule_cd').val()==""){
				alert("입고목록을 조회해서 선택하세요");
				$('#rec_schedule_cd').focus();
				return false;
			}
			if($('#rel_date').val()==""){
				alert("라인코드를 입력하세요");
				$('#rel_date').focus();
				return false;
			}
			if($('#rel_count').val()==""){
				alert("품목수량을 입력하세요");
				$('#rel_count').focus();
				return false;
			}
			window.opener.name = "parentPage";
			document.updaterel.target="parentPage";
			document.updaterel.action="${pageContext.request.contextPath}/rel/relupdatePro";
			document.updaterel.submit();
			self.close();
		} else {
			return false;
		}
	});
}

function rst(){
	// 초기화 유효성 검사
	var result = confirm("초기화 하시겠습니까?");
	if (result == true){    
		document.updaterel.reset();
	} else {
		return false;
	}
}

function setChildValue(rec_schedule_cd,wh_cd,product_cd_name,rec_count,pchor_cd){
	
    document.getElementById("rec_schedule_cd").value = rec_schedule_cd;
    document.getElementById("wh_cd").value = wh_cd;
    document.getElementById("product_cd_name").value = product_cd_name;
    document.getElementById("rec_count").value = rec_count;
    document.getElementById("pchor_cd").value = pchor_cd;
 

}
</script>


</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->
<h2 class="updatetitle">자재출고 수정</h2><br>
	
	<div class="wrap2">
	  <button class="button2" onclick="sub()">수정</button>
	<button class="button2" onclick="rst()">초기화</button>
	 </div>
	 <br>
	 
	<button class="button2" onclick="recListBtn();" style="width:200px">입고목록</button>
	<br>

	<form id="move" action="${pageContext.request.contextPath}/rel/relupdatePro" name="updaterel" method="post" >
	
	<input type="hidden" name="rel_schedule_cd" value="${rec.rel_schedule_cd }" >
	
		<table id="vendortable" class="table table-striped" style="width:1000px;">		
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>입고코드</th>
					<th>입고창고</th>
					<th>입고제품</th>
					<th>입고수량</th>
					<th>발주/수주코드</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="rec_schedule_cd" id="rec_schedule_cd" value="${rec.rec_schedule_cd}" readonly></td>
					<td><input type="text" name="wh_cd" id="wh_cd" value="${rec.wh_cd}" readonly></td>
					<td><input type="text" name="product_cd_name" id="product_cd_name" value="${rec.product_cd_name}" readonly></td>
					<td><input type="text" name="rec_count" id="rec_count" value="${rec.rec_count}" readonly></td>
					<td><input type="text" name="pchor_cd" id="pchor_cd" value="${rec.pchor_cd}" readonly></td>

				</tr>
			</tbody>	
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>출고일자</th>
					<th>출고수량</th>
					<th>적요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="date" name="rel_date" id="rel_date" value="${rec.rel_date }"></td>
					<td><input type="text" name="rel_count" id="rel_count" value="${rec.rel_count }"></td>
					<td><input type="text"  class="remarks" id="remarks" name="remarks" size=40  value="${rec.remarks }"></td>
				</tr>
			</tbody>				
		</table>
	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>