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
<title>404 예외 발생</title>
</head>
<body>
	<h1>요청처리 과정에서 문제가 발생하였습니다.</h1>
	<h1>요청한 페이지가 존재하지 않습니다.</h1>
</body>
</html>