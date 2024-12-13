<%@page import="co.kh.dev.customer.model.CustomerDAO"%>
<%@page import="co.kh.dev.customer.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>

<%
boolean successFlag = false;
if (id != null && pwd != null) {
	CustomerVO cvo = new CustomerVO();
	cvo.setId(id);
	cvo.setPwd(pwd);

	CustomerDAO cdao = new CustomerDAO();
	boolean returnFlag = cdao.selectCustomer(cvo);

	if (returnFlag) {
		session.setAttribute("id", id);
		session.setAttribute("pass", pwd);
%>
<html>
<body>
	<table border='1' width='300' align="center">
		<tr>
			<td width='300' align='center'> <%= id %> 님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td align='center'><a href=#>회원정보</a>
				&nbsp;&nbsp; <a href='logout.jsp'>로그아웃</a></td>
		</tr>
	</table>
</body>
</html>
<%
	} else {
%>
<script>
	alert('로그인 실패했습니다.');
</script>
<%
	response.sendRedirect("loginForm.jsp");
	}
}else{
	%>
	<script>
	alert('아이디 패스워드를 입력하세요');
</script>
<%
	response.sendRedirect("loginForm.jsp");
}
%>