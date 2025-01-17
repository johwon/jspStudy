<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./top.jsp"%>
<main>
	<aside class="left"></aside>
	<section align="center">
		<div class="center">
			<%
			// 1. 세션 정보를 가져오기 (세션이 없으면 null 반환)
			if (sessionId == null) {
			%>
			<h3>로그인</h3>
			<form action="loginCheck.jsp" method="post">
				<fieldset style="border: 0px">
					<table align="center">
						<tr>
							<th><label for="id">아이디</label></th>
							<td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
					</table>
				</fieldset>
				<input type="submit" value="로그인" size="300px"> <a
					href='registerPage.jsp'><input type='button' value='회원가입'></a>
			</form>
		
	<%
	} else {
	%>
	<table width='400' align="center">
		<tr>
			<td width='300' align='center'><%=sessionId%> 님 어서오세요.</td>
		</tr>
		<tr>
			<td align='center'>
			<a href=modifyPage.jsp>회원정보 수정</a> &nbsp;&nbsp; 
			<a href=deletePage.jsp>회원 탈퇴</a> &nbsp;&nbsp; 
			<a href='logout.jsp'>로그아웃</a>
			</td>
		</tr>
	</table>
	<%
	}
	%>
	</div>
	</section>
	<aside class="right"></aside>
</main>
<%@ include file="./bottom.jsp"%>
</body>
</html>