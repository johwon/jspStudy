<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<link rel="stylesheet" href="./carousel.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<header>
		<a href="main.jsp"><i class="fa-solid fa-shirt"></i>
			<h2>SHOP</h2></a>
		<ul>
			<li><a href="list.jsp">문의게시판</a></li>
			<li><a href="#">menu</a></li>
			<li><a href="#">menu</a></li>
			<li class="dropdown"><a href="#">menu</a>
				<div class="dropdown_content">
					<a href="#">1.menu</a> <a href="#">2.menu</a> <a href="#">3.menu</a>
				</div></li>
		</ul>
		<div class="header_icon">
			<%
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null) {
			%>
			<a href="loginPage.jsp" class="sign"><li>로그인</li></a> <a
				href="registerPage.jsp" class="sign"><li>회원가입</li></a>
			<!-- <a href="#"><i class="fa-solid fa-phone"></i></a>
            <a href="#"><i class="fa-regular fa-comments"></i></a> -->
			<%
			} else {
			%>
			<a href="loginPage.jsp" class="sign"><li>마이페이지</li></a> <a href=#><i
				class="fa-solid fa-basket-shopping"></i></a>
			<%
			}
			%>
		</div>
	</header>
	<div class="carousel">
		<%@ include file="carousel.jsp"%>
	</div>
	<main>
		<aside class="left">
			<!-- 	<h2>국민소통</h2>
			<hr>
			<ul class="nav1">
				<a href="#"><strong>국민참여</strong></a>
				<div class="ul_body">
					<li><a href="#">이벤트</a></li>
					<li><a href="#">칭찬합시다</a></li>
					<li><a href="#">궁금합니다</a></li>
					<li><a href="#">제안합니다</a></li>
					<li><a href="#">국민신고방(불법산행)</a></li>
				</div>
			</ul>
			<ul class="nav2">
				<a href="#"><strong>혁신제안</strong></a>
				<div class="ul_body">
					<li><a href="#">기업성장응답센터</a></li>
					<li><a href="#">사회적가치, 혁신 우수사례</a></li>
				</div>
			</ul>
			<ul class="nav3">
				<a href="#"><strong>클린신고센터</strong></a>
				<div class="ul_body">
					<li><a href="#">공익신고</a></li>
					<li><a href="#">소극행정신고</a></li>
					<li><a href="#">갑질신고</a></li>
					<li><a href="#">청탁금지법 위반신고</a></li>
					<li><a href="#">사이버감사실</a></li>
					<li><a href="#">예산낭비신고</a></li>
					<li><a href="#">갑질행위 공개</a></li>
				</div>
			</ul> -->
		</aside>
		<section></section>
		<aside class="right"></aside>
	</main>
	<footer></footer>
</body>
</html>