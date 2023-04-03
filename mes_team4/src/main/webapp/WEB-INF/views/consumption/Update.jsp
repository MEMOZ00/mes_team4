<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- js파일 들어가는 곳 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<!-- js파일 들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/Consumption.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script type="text/javascript">
	$(document).ready(function() { // j쿼리 시작
		// 셀렉트박스 선택 시 value 저장
		$(document).on('change', '.select-option', function(){
			let consumption_unit = $("option:selected", this).val();
			$(this).closest("td").find("#consumption_unit_arr").val(consumption_unit);
		});
		// 초기화 버튼
		$(document).on('click', '#resetBtn', function() {
			var rpListBtn = $('<button>').attr({
				    'type': 'button',
				    'id': 'rpListBtn'
				}).text('추가');
			 
			var cpTableTr = $('#cproductBody tr');
			
			var rpTableTr = $('#rproductBody tr');
			rpTableTr.find('td:eq(0)').empty();
			rpTableTr.find('td:eq(1)').empty();
			rpTableTr.find('td:eq(0)').append(rpListBtn);
			rpTableTr.find('input').val('');
		});
		
		// 원자재 행 추가
		$('#addRowBtn').on('click', function() {
		    var newRow = $('#rproductBody tr:first').clone();
		    var rpListBtn = $('<button>').attr({
			    'type': 'button',
			    'id': 'rpListBtn'
			}).text('추가');
		    
		    $('#rproductBody').append(newRow);
		    $('#rproductBody tr:last-child td:eq(0)').empty();
		    $('#rproductBody tr:last-child td:eq(1)').empty();
		    $('#rproductBody tr:last-child td:eq(0)').append(rpListBtn);
		    
		});
	
		// 원자재 행 삭제
		$('#rproductBody').on('click', '#deleteRowBtn', function() {
			var row = $(this).closest('tr');
			if (row.index() > 0) { 
				row.remove();
			} else {
				alert('첫 번째 행은 삭제할 수 없습니다.');
			}     
		});
		
		// 원자재 리스트 팝업
		$(document).on('click', '#rpListBtn', function() {
			var trIndex = $(this).parent().parent().index();
			var product_dv = 'rp';
			
			var link = '${pageContext.request.contextPath}/consmpt/prlist?trIndex='+trIndex+'&product_dv='+product_dv;     
			var popupWidth = 500;
			var popupHeight = 700;
			var popupX = (window.screen.width/2) - (popupWidth/2) + 800;
			var popupY= (window.screen.height/2) - (popupHeight/2);
			
		  	window.open(link,'_blank','status=no height='+popupHeight+', width='+popupWidth +',left='+popupX+',top='+popupY);
		});
	}); // j쿼리 끝
	function updateBtn(){
		// submit 전 제한 사항
		
		// 내용 제한 넘길 시 submit 진행
		var result = confirm("게시글을 수정하시겠습니까?");
		if (result == true){    
			document.getElementById('move').submit(); 
			alert("수정");
		} else {
			return false;
		}
	}
</script>
<!-- 자바스크립트 입력 끝-->
</head>
<body>

	
<!-- 본문HTML 입력 시작-->

	<h2>소요량 수정</h2>
	<div class="wrap2">
	  <button class="button2" id="resetBtn">초기화</button>
	  <button class="button2" onclick="updateBtn();">수정</button>
	  <button class="button2" onclick="window.close();">닫기</button>
	</div>
	<br>

	<form id="move" action="${pageContext.request.contextPath}/consmpt/updatePro" method="post">		
	<c:forEach var="dto" items="${consmptList}" begin="0" end="0">
	<input type="hidden" name="insert_date_st" value="${dto.insert_date }">
	</c:forEach>
	
		<div>제품 등록</div>
		<table id="cproduct" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>제품코드(+)</th>
					<th>품목명</th>
				</tr>
			</thead>
			
			<tbody id="cproductBody">
				<c:forEach var="dto" items="${consmptList}" begin="0" end="0">
				<tr>
					<td><input type="text" name="cproduct_cd_name" value="${dto.cproduct_cd_name}" readonly></td>
					<td><input type="text" name="cproduct_name" value="${dto.cproduct_name}" readonly></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
			
		<div>원자재 등록</div>
		<table id="rproduct" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>원자재코드(+)</th>
					<th>품목명</th>
					<th>소요량</th>
					<th>단위</th>
					<th>삭제</th>
				</tr>
			</thead>
			
			<tbody id="rproductBody">
				<c:forEach var="dto" items="${consmptList }">
				<tr>
					<td><input type="text" name="rproduct_cd_name_arr" value="${dto.rproduct_cd_name }" readonly></td>
					<td><input type="text" name="rproduct_name_arr" value="${dto.rproduct_name }" readonly></td>
					<td><input type="text" name="consumption_arr" value="${dto.consumption }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
					<td><input type="hidden" id="consumption_unit_arr" name="consumption_unit_arr" value="${dto.consumption_unit }">
					<select class="select-option">
						<option value="">단위를 선택하세요.</option>
						<c:forEach var="unit" items="${unit}">
							<option value="${unit}" <c:if test ="${dto.consumption_unit eq unit}">selected="selected"</c:if>>${unit}</option>
						</c:forEach>
					</select>
					</td>
					<td><button type="button" id="deleteRowBtn">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
			
		</table>
			
	</form>
	
	<button id="addRowBtn">원자재 추가</button>
	
	
	
<!-- 본문HTML 입력 끝-->
</body>
</html>