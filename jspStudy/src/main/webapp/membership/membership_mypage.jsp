<%@ page contentType="text/html; charset=UTF-8"
					import = "java.io.IOException" %>
<%
	if (session == null) {
		// 세션등록안되어있음을 알려줌(페이지이동)
		return;
	}
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	String pwd = (String) session.getAttribute("pwd");
	try {
%>
			<h1 align="center">마이페이지</h1>
			<table align="center" width="300" border="1">
			<tr>
			<td align="center">
			이름 = <%= name %>
			</td>
			</tr>
			<tr>
			<tr>
			<td align="center">
			id = <%= id %>
			</td>
			</tr>
			<tr>
			<td align="center">
			비밀번호 = <%= pwd %>
			</td>
			</tr>
			<tr>
			<td align="center">
			<a href='/jspStudy/membership/memberUpdate.html'><input type="button" value="회원정보 수정"></a>
			<a href='/jspStudy/membership/membership_login.jsp'><input type="button" value="뒤로가기"></a>
			</td>
			</tr>
			</table>
<%
} catch (IOException e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>