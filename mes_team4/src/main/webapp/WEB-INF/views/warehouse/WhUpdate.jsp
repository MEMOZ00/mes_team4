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
function sub(){
document.updateform.action="${pageContext.request.contextPath}/wh/whupdatePro";
document.updateform.submit();
setTimeout(function() { 
	opener.parent.location.reload();
	window.close();
	}, 200);
}

function rst(){
document.updateform.reset();
}
</script>

</head>
<body>

<div id="contents">	
<!-- 본문HTML 입력 시작-->

<!-- 	<h2 class="inserttitle">창고 수정</h2><br> -->
<!-- 	<div class="wrap2"> -->
<!-- 	  <button class="button2">수정</button> -->
<!-- 	  <button class="button2">초기화</button> -->
<!-- 	 </div><br>	 -->
	 
<%-- 	<form action="${pageContext.request.contextPath}/wh/whupdatePro" name="updateform" method="post"> --%>
 
<%-- 	 창고명 : <input type="text" name="wh_name" value="${whDTO.wh_name }"><br> --%>
<!-- 	 창고구분 : <label><input type="radio" name="wh_dv" value="0" checked="checked">완제품</label> -->
<!-- 	 		 <label><input type="radio" name="wh_dv" value="1">원자재</label><br> -->
<%-- 	 창고코드 : <input type="text" name="wh_cd" value="${whDTO.wh_cd }" readonly><br>		  --%>
<%-- 	 창고주소 : <input type="text" name="wh_addr" value="${whDTO.wh_addr }"><br> --%>
<%-- 	 창고연락처 : <input type="tel" name="wh_tel" value="${whDTO.wh_tel }"><br> --%>
<!-- 	 창고사용여부 : <label><input type="radio" name="wh_use" value="1" checked="checked">사용</label> -->
<!-- 	 		    <label><input type="radio" name="wh_use" value="0">미사용</label><br> -->
<%-- 	 적요 : <input type="text" name="remarks" value="${whDTO.remarks }" ><br> --%>
<!-- 	 </form> -->
	

	
	
<h2 class="inserttitle">창고 수정</h2><br>
	
	<form action="${pageContext.request.contextPath}/wh/whupdatePro" name="updateform" method="post" >
	<input type="hidden" value="${whDTO.wh_cd }" name="wh_cd">
	<div class="wrap2">
		<input type="submit" class="button2" value="수정" onclick="sub()">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	
		
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고구분</th>
					<th>창고이름</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
<%-- 				<c:if test="${whDTO.wh_dv=='완제품'}"> --%>
<!-- 					<td> -->
<!-- 					<select id="select1"  name="wh_dv"> -->
<!-- 						<option value="완제품" selected>완제품</option> -->
<!-- 						<option value="원자재">원자재</option> -->
<!-- 					</select> -->
<!-- 					</td> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${whDTO.wh_dv=='원자재'}"> --%>
<!-- 					<td> -->
<!-- 					<select id="select1"  name="wh_dv"> -->
<!-- 						<option value="완제품" >완제품</option> -->
<!-- 						<option value="원자재" selected>원자재</option> -->
<!-- 					</select> -->
<!-- 					</td> -->
<%-- 					</c:if> --%>
					<td><input type="text" name="wh_dv" value="${whDTO.wh_dv }"></td>
					<td><input type="text" name="wh_name" value="${whDTO.wh_name }"></td>
				
				</tr>
			</tbody>
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고사용여부</th>
					<th>창고연락처</th>	
				</tr>
			</thead>
			
			<tbody>
				<tr>
					
					<c:if test="${whDTO.wh_use=='사용'}">
					<td>
					<select name="wh_use">
							<option value="사용" selected>사용</option>
							<option value="미사용">미사용</option>
						
					</select>
					</td>
					</c:if>
					<c:if test="${whDTO.wh_use=='미사용'}">
					<td>
					<select name="wh_use">
							<option value="사용" >사용</option>
							<option value="미사용" selected>미사용</option>
					</select>
					</td>
					</c:if>
						
					<td><input type="tel" name="wh_tel" value="${whDTO.wh_tel }"></td>
				</tr>
			</tbody>
			
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>창고지역</th>
					<th>적요</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
						<select name="wh_addr">
							<option value="" selected>지역을 선택하세요</option>
							<option value='1'>서울</option>
				            <option value='2'>부산</option>
				            <option value='3'>대구</option>
				            <option value='4'>인천</option>
				            <option value='5'>광주</option>
				            <option value='6'>대전</option>
				            <option value='7'>울산</option>
				            <option value='8'>강원</option>
				            <option value='9'>경기</option>
				            <option value='10'>경남</option>
				            <option value='11'>경북</option>
				            <option value='12'>전남</option>
				            <option value='13'>전북</option>
				            <option value='14'>제주</option>
				            <option value='15'>충남</option>
				            <option value='16'>충북</option>
						</select>
					</td>
				
					<td><input type="text"  class="remarks" name="remarks" value="${whDTO.remarks }" size=40></td>
				</tr>
			</tbody>
			
		</table>
	</form>
<!-- 본문HTML 입력 끝-->
</div>	
	
</body>
</html>
