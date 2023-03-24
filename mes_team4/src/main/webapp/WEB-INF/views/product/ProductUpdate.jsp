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

<script type="text/javascript">
// function sub(){
// 	document.LineUpdate.action="${pageContext.request.contextPath}/line/lineupdatepro";
// 	document.LineUpdate.submit();
// 	setTimeout(function() { 
// 		opener.parent.location.reload();
// 		window.close();
// 		}, 200);
// 	}
// 	function rst(){
// 	document.LineUpdate.reset();
// 	}
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle"> 품목정보수정 </h2><br>
<!-- 	<div class="wrap2"> -->
	<button class="button2" onclick="sub()">완료</button>
	<button class="button2" onclick="rst()">초기화</button>	  
<!-- 	 </div><br> -->
	 <br><br>
	 
	 
	<form name="LineUpdate" method="post">
		<input type="hidden" value="">
		
		<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>라인코드</th>
					<th>라인명</th>
					<th>공정</th>
					<th>가동상태</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr><td><input type="text" name="line_cd" value="${LineDTO.line_cd}" readonly></td>
					<td><input type="text" name="line_name" value="${LineDTO.line_name}"></td>
					<td><input type="text" name="line_process" value="${LineDTO.line_process}"></td>  					
					<td><input type="text" name="remarks" value="${LineDTO.remarks}"></td>
				</tr>

			</tbody>
		</table>
	
	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
</body>
</html>