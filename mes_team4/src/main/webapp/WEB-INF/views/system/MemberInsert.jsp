<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../main/Header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
	
</script>
<!-- 자바스크립트 입력 끝-->

<div id="contents">
	<!-- 본문HTML 입력 시작-->
	<h2>사용자추가</h2>
	<br><br><br>
	<form action="${pageContext.request.contextPath }/system/memberinsertpro;insertpro()" method="post">
		<table id="vendortable" class=" table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th>사원명</th>
					<th>비밀번호</th>
					<th>부서</th>
					<th>직급</th>
					<th>권한</th>
				</tr>
			</thead>

			<tbody>

				<tr>
					<td><input type="text" name="emp_name" style="width:100px;height:30px;font-size:18px;" autofocus="autofocus"></td>
					<td><input type="password" name="emp_pass" style="width:150px;height:30px;font-size:18px;"></td>
					<td>
						<input type="radio" name="dept_cd" value="11" /> 총무부<br>
						<input type="radio" name="dept_cd" value="22" /> 인사부<br>
						<input type="radio" name="dept_cd" value="33" /> 영업부<br>
						<input type="radio" name="dept_cd" value="44" /> 생산부<br>
						<input type="radio" name="dept_cd" value="55" /> 자재관리부	
					</td>
					<td>
						<input type="radio" name="grade_cd" value="대표" /> 대표<br>
						<input type="radio" name="grade_cd" value="이사" /> 이사<br>
						<input type="radio" name="grade_cd" value="부장" /> 부장<br>
						<input type="radio" name="grade_cd" value="과장" /> 과장<br>
						<input type="radio" name="grade_cd" value="대리" /> 대리<br>	
						<input type="radio" name="grade_cd" value="사원" /> 사원	
					</td>
					<td>
						<div>
							<input type="checkbox" id="priv_cd" name="priv_cd" >
							<label for="0">기본등록</label>
						</div>
						<div>
							<input type="checkbox" id="priv_cd" name="priv_cd"> <label
								for="1">사원조회</label>
						</div>
						<div>
							<input type="checkbox" id="priv_cd" name="priv_cd"> <label
								for="2">사원관리</label>
						</div>
						<div>
							<input type="checkbox" id="priv_cd" name="priv_cd"> <label
								for="3">재고조회</label>
						</div>
						<div>
							<input type="checkbox" id="priv_cd" name="priv_cd"> <label
								for="4">재고관리</label>
						</div>
					</td>
			</tbody>
		</table>
	</form>

	<!-- 본문HTML 입력 끝-->
</div>


<!-- 푸터 들어가는 곳 -->
<jsp:include page="../main/Footer.jsp" />
<!-- 푸터 들어가는 곳 -->