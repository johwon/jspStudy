<%@page import="java.util.HashMap"%>
<%@page import="co.kh.dev.actiontag.model.Customer2"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//2.curd
	/* Customer2 customer = new Customer2();
	customer.setName("kim");
	customer.setEmail("kim.naver.com");
	customer.setPhone("010-1111-1111");
	request.setAttribute("customer", customer); */
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "kkk");
	map.put("email", "kim.naver.com");
	map.put("phone", "010-1111-1111");
	request.setAttribute("map", map);
	
	/* Customer2 ct = (Customer2)request.getAttribute("customer"); */
	HashMap<String, String> map2 = (HashMap)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Example</title>
</head>
<body>
	<%-- <ul>
		<li><%=ct.getName() %></li>
		<li><%=ct.getEmail() %></li>
		<li><%=ct.getPhone() %></li>
	</ul>
	<ul>
		<li><%=${customer.name} %></li>
		<li><%=${customer.email} %></li>
		<li><%=${customer.phone} %></li>
	</ul> --%>
	<ul>
		<li><%= map2.get("name") %></li>
		<li><%= map2.get("email") %></li>
		<li><%= map2.get("phone") %></li>
	</ul> 
	<ul>
		<li>${map.name}</li>
		<li>${map.email}</li>
		<li><${map.phone}</li>
	</ul> 
</body>
</html>