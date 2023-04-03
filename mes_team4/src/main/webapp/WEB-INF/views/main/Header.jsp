<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- js파일 들어가는 곳 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<!-- js파일 들어가는 곳 -->

<!-- 본문적용 CSS들어가는 곳 -->
<link href="${pageContext.request.contextPath}/resources/css/MainFront.css" rel="stylesheet" type="text/css">
<!-- 본문적용 CSS들어가는 곳 -->

<!-- 자바스크립트 입력 시작-->
<script>
</script>
<!-- 자바스크립트 입력 끝-->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

</head>
<body>

<div id="topcontainer">
	<div id ="head">
	
		<div class="wrap">
		  <button class="button" onclick="location.href='${pageContext.request.contextPath}/main/home'">홈</button>
		  <button class="button">로그인</button>
		  <button class="button" onclick="location.href='${pageContext.request.contextPath}/main/mypage'">마이페이지</button>
		  <button class="button">로그아웃</button>
		</div>

	</div>

	<div id="header">
		
		<h1 class="main">의약품 생산 MES<img src="${pageContext.request.contextPath}/resources/image/robot.png"></h1>
	</div> 
</div>



<div id="container">
	<div id="sidebar1">
	 <ul class="menu">
	      <li>
	        <a href="#">시스템관리</a>
	        <ul class="submenu">
	          <li><a href="home2.jsp">사용자관리</a></li>
	          <li><a href="#">권한관리</a></li>
	          <li><a href="#">코드관리</a></li>
	          <li><a href="#">정보관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">기준정보관리</a>
	        <ul class="submenu">
	          <li><a href="${pageContext.request.contextPath}/product/prodpage">품목정보관리</a></li>
	          <li><a href="${pageContext.request.contextPath}/consmpt/list">소요량관리</a></li>
	          <li><a href="#">설비정보관리</a></li>
	          <li><a href="${pageContext.request.contextPath}/business/businessmain">거래처정보관리</a></li>
	          <li><a href="wh/whpage">창고관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">영업관리</a>
	        <ul class="submenu">
	          <li><a href="#">수주등록</a></li>
	          <li><a href="${pageContext.request.contextPath}/order/ordermain">수주관리</a></li>
	          <li><a href="#">출하등록</a></li>
	          <li><a href="#">출하관리</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">생산관리</a>
	        <ul class="submenu">
	          <li><a href="#">생산계획</a></li>
	          <li><a href="#">작업지시현황</a></li>
	          <li><a href="#">실적등록</a></li>
	          <li><a href="#">생산실적현황</a></li>
	          <li><a href="#">submenu05</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">자재관리</a>
	        <ul class="submenu">
	          <li><a href="${pageContext.request.contextPath}/receive/recpage">자재입고관리</a></li>
	          <li><a href="${pageContext.request.contextPath}/rel/relpage">자재출고관리</a></li>
	          <li><a href="#">자재재고현황</a></li>
	          <li><a href="${pageContext.request.contextPath}/purchase/list">자재발주관리</a></li>
	          <li><a href="#">submenu05</a></li>
	        </ul>
	      </li>
	    </ul>
	</div>
	
	
	<div id="contents">
