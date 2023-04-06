<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function goPopup(){ 
        new daum.Postcode({
        	 oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress; }
                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';  }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                 } else {
                     addr += ' ' ; }
                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
               //  제이쿼리를 사용하기 때문에 제이쿼리 값 입력형태로 바꿈 $
                $(".zonecode").val(data.zonecode);
                $(".address").val(addr);  }
         }).open();
    }
    
    function itemChange(){
    	var select2a = ["제약", "약국", "연구소"];
    	var select2b = ["원자재","부자재"];
    	
    	$('#select2').empty();
    	$('#select2').append("<option value=''>선택하세요</option>");
    	
    	var str = $('#select1').val();
    	if(str=="수주"){    		
     		for(i=0; i<select2a.length; i++){

    			$('#select2').append("<option value='"+select2a[i]+"'>"+select2a[i]+"</option>");
     		}
    		}else if(str=="발주"){
    		for(i=0; i<select2b.length; i++){
    			$('#select2').append("<option value='"+select2b[i]+"'>"+select2b[i]+"</option>");
     			}
    		}
    	}
    
    function goSubmit(){
    	
    	
    	if($("select[name=business_dv]").val() == ""){
    	    alert("수주/발주 구분을 선택하세요.");
    	    $("#select1").focus();
    	    return false;
    	}
    	
    	if($("select[name=business_type]").val() == ""){
    	    alert("업종유형을 선택하세요.");
    	    $("#select2").focus();
    	    return false;
    	}
    	
    	if($('.business_name').val() == ""){
    	    alert("거래처명을 입력하세요.");
    	    $('.business_name').focus();
    	    return false;
    	}
    	if($('.business_ceo').val() == ""){
    	    alert("대표명을 입력하세요.");
    	    $('.business_ceo').focus();
    	    return false;
    	}
    	if($('.business_tel').val() == ""){
    	    alert("전화번호를 입력하세요.");
    	    $('.business_tel').focus();
    	    return false;
    	}
    	if($('.business_email').val() == ""){
    	    alert("이메일을 입력하세요.");
    	    $('.business_email').focus();
    	    return false;
    	}
    	if($('.zonecode').val() == ""){
    	    alert("우편번호를 입력하세요.");
    	    $('.zonecode').focus();
    	    return false;
    	}
    	if($('.address').val() == ""){
    	    alert("주소를 입력하세요.");
    	    $('.address').focus();
    	    return false;
    	}
    	
    	
    	
    	opener.name="parentPage";
    	document.insertform.target="parentPage";
    	document.insertform.action="${pageContext.request.contextPath}/business/businessinsertpro";
    	document.insertform.submit();
    	self.close();
    }
    
</script>

</head>
<body>

	<div id="contents">
<!-- 본문HTML 입력 시작-->

	<h2 class="inserttitle">거래처 등록</h2><br>
	
	<form  name="insertform" method="post" >
	
	<div class="wrap2">
		<input type="submit" class="button2" value="등록" onclick="return goSubmit(this)">
		<input type="reset" class="button2" value="초기화">
	 </div><br>
	 <br>
	
		<input type="hidden" value="">
		<table id="vendortable" class="table table-striped" style="width:1000px;">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>구분</th>
					<th>업종유형</th>
					<th>거래처명</th>
					<th>대표자</th>
					
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>
					<select id="select1"  name="business_dv" onchange="itemChange()" >
						<option value="">선택해주세요</option>
						<option value="수주">수주</option>
						<option value="발주">발주</option>
					</select>
					</td>
					
					<td>
					<select id="select2"  name="business_type">
						<option value="">구분을 선택하세요</option>
					</select>
					</td>
					
					<td><input type="text" name="business_name" class="business_name"></td>
					<td><input type="text" name="business_ceo" class="business_ceo"></td>	
				</tr>
			</tbody>
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>전화번호</th>
					<th>이메일</th>
					<th>우편번호 	<button type="button" onClick="goPopup();">우편번호찾기</button> </th>
					<th>주소</th>
					
					</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="business_tel" class="business_tel"></td>
					<td><input type="text" name="business_email" class="business_email"></td>
					<td><input type="text"  class="zonecode" name="business_post"></td>
					<td><input type="text"  class="address" name="business_addr" size=40></td>
					
				</tr>
			</tbody>
		</table>

	</form>
	
	
<!-- 본문HTML 입력 끝-->
	</div>
	
</body>
</html>
