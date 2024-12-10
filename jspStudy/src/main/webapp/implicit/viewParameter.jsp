<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String address = request.getParameter("address");
//체크박스에서 체크한 것만 가져옴. 4개에서 2개 체크하면 배열 사이즈 2
String[] values = request.getParameterValues("pet");

System.out.println("name=" + name);
System.out.println("address=" + address);
for (int i = 0; i < values.length; i++) {
	System.out.println("values[" + i + "]=" + values[i]);
}

Enumeration enumData = request.getParameterNames();
//enum 데이터가 존재하니?
while (enumData.hasMoreElements()) {
	String enumName = (String) enumData.nextElement();
	System.out.println("enumName=" + enumName);
}

//키값, value값으로 분류해서 나누어버린다.
Map parameterMap = request.getParameterMap();
String[] nameParam = (String[]) parameterMap.get("pet");
System.out.println("name=" + nameParam[1]);
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