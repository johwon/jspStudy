<%@ page contentType="text/html; charset=UTF-8"
	import="co.kh.dev.account.model.AccountDAO"
	import="co.kh.dev.account.model.AccountVO"%>
<%
try {
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String uid = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 2. 데이타베이스처리한다
	AccountDAO ad = new AccountDAO();
	AccountVO avo = new AccountVO(name, uid, pwd);
	boolean returnFlag = ad.insertDB(avo);
	response.setContentType("text/html;charSet=UTF-8");
	if (returnFlag) {
		System.out.println("입력성공");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
	<h1 align='center'>회원가입이 완료되었습니다.</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align="center">이름 = <%=name%>
			</td>
		</tr>
		<tr>
		<tr>
			<td align="center">id = <%=uid%>
			</td>
		</tr>
		<tr>
			<td align="center">비밀번호 = <%=pwd%>
			</td>
		</tr>
		<tr>
			<td align="center"><a href='/jspStudy/membership/membership_login.jsp'><input
					type="button" value="로그인"></a></td>
		</tr>
	</table>
</body>
</html>
<%
} else {
System.out.println("입력실패");
%>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
	<h1 align='center'>회원가입이 실패되었습니다.</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align="center"><a href='/jspStudy/membership/membership.html'><input
					type="button" value="회원가입"></a></td>
		</tr>
	</table>
</body>
</html>
<%
}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(out != null) {
		out.close();
	}
}
%>
