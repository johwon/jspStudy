<%@page import="javax.naming.ldap.Rdn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String code = request.getParameter("code");
String viewPageURI = null;
if (code.equals("A")) {
	viewPageURI = "viewModule/a.jsp";
} else if (code.equals("B")) {
	viewPageURI = "viewModule/b.jsp";
} else if (code.equals("C")) {
	viewPageURI = "viewModule/c.jsp";
}

RequestDispatcher rd = request.getRequestDispatcher(viewPageURI);
rd.forward(request, response);
%>
<%-- <jsp:forward page="<%=viewPageURI%>" /> --%>

