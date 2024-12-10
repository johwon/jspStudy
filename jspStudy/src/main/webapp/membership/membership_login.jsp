<%@ page contentType="text/html; charset=UTF-8"%>
<%
// 1. 세션 정보를 가져오기 (세션이 없으면 null 반환)
String id = (String) session.getAttribute("id");
if (id == null) {
%>
<html>
<body>
	<form method='post' action='/jspStudy/membership/membership_loginCheck.jsp'>
		<table border='1' width='300' align="center">
			<tr>
				<th width='100'>아이디</th>
				<td width='200'>&nbsp;<input type='text' name='id'></td>
			</tr>
			<tr>
				<th width='100'>비번</th>
				<td width='200'>&nbsp;<input type='password' name='pwd'></td>
			</tr>
			<tr>
				<td align='center' colspan='2'><a href='membership.html'><input
						type='button' value='회원가입'></a> &nbsp; &nbsp; <input
					type='submit' value='로그인'></td>
			</tr>
			</form>
		</table>
</body>
</html>
<%
 } else {
%>
<html>
<body>
	<table border='1' width='300' align="center">
		<tr>
			<td width='300' align='center'> <%= id %> 님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td align='center'><a href='membership_mypage.jsp'>회원정보</a>
				&nbsp;&nbsp; <a href='membership_logout.jsp'>로그아웃</a></td>
		</tr>
	</table>
</body>
</html>
<%
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