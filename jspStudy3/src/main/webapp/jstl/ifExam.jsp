<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${3>4}">
	<p>화면에 안나옴 \${3>4}</p>
</c:if>
<c:if test="${3<4}">
	<p>화면에 나옴! \${3<4}</p>
</c:if>
<c:if test="${param.type eq 'guest'}">
	<p>guest 방문 감사</p>
</c:if>
<c:if test="${param.type eq 'member'}">
	<p>member 방문 감사</p>
</c:if>
</body>
</html>