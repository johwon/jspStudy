<%@ page contentType="text/html; charset=UTF-8"%>
<%
if( session != null) {
	session.invalidate();
}
response.sendRedirect("/jspStudy/membership/membership_login.jsp");
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