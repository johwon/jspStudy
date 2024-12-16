<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<link rel="stylesheet" href="./carousel.css" />
<!-- 내부 자바스크립트 -->
<script language="javascript">
	function begin() {
		document.myForm.pass.focus();
	}
	function checkIt() {
		if (!document.myForm.pass.value) {
			alert("비밀번호를 입력하지 않았습니다");
			document.myForm.pass.focus();
			return false;
		}
	}
</script>
</head>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>

</head>
<body onload="begin()">
	<header>
		<a href="main.jsp"><i class="fa-solid fa-cart-shopping"></i>
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
			String id = (String) session.getAttribute("id");
			if (id == null) {
			%>
			<a href="loginPage.jsp" class="sign"><li>로그인</li></a> <a
				href="registerPage.jsp" class="sign"><li>회원가입</li></a>
			<!-- <a href="#"><i class="fa-solid fa-phone"></i></a>
            <a href="#"><i class="fa-regular fa-comments"></i></a> -->
			<%
			} else {
			%>
			<a href="loginPage.jsp" class="sign"><li>마이페이지</li></a> 
			<a href=#><i class="fa-solid fa-basket-shopping"></i></a>
			<%
			}
			%>
		</div>
	</header>
	<main>
		<aside class="left"></aside>
		<section>
			<form name="myForm" method="post" action="deleteDB.jsp"
				onsubmit="return checkPass()">
				<table width="280" border="1" align="center">
					<tr>
						<td colspan="2" align="center"><b>회원 탈퇴</b></td>
					</tr>
					<tr>
						<td width="170"><b>비밀번호입력</b></td>
						<td width="110"><input type="password" name="pwd" size="15"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="회원탈퇴"> <input type="button" value="취  소"
							onclick="javascript:window.location='loginPage.jsp'"></td>
					</tr>
				</table>
			</form>
		</section>
		<aside class="right"></aside>
	</main>
	<footer></footer>
</body>
</html>