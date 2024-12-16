<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file = "./top.jsp" %>
<%
	//지역변수
	String name = "해원";
%>
<h2>body 영역입니다.</h2>
<form method="post" action="/jspStudy/MemberInsert">
		<h2>회원가입</h2>
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="50"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size="50"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" size="50"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" size="50"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type='submit'
					value='회원가입하기' size=300px></td>
			</tr>
		</table>
	</form>

<%@ include file = "./bottom.jsp" %>