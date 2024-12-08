<%@page import="java.lang.reflect.Executable"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true"%>
<%
	//웹브라우저에게 정상적으로 처리되었음을 통보한다.(200)
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
	<h1>요청처리 과정에서 문제가 발생하였습니다.</h1>
	<h1>빠른 시간 안에 처리하겠습니다.</h1>
	<h2>에러타입 <%= exception.getClass().getName() %></h2>
	<h2>에러메세지 <%= exception.getMessage() %></h2>
</body>
</html>