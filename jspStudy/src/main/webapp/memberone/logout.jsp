<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 세션객체정보를 가져온다. -->
    <%
    session.invalidate();
    response.sendRedirect("logout.jsp");
    %>
<!-- <html>
 <head>
 <title>Logout</title>
 </head>
 <body>
 <font size="4">
성공적으로 로그아웃 되었습니다.<br></br>
 <a href="login.jsp">로그인 페이지로 이동</a>
 </font>
 </body>
 </html> -->