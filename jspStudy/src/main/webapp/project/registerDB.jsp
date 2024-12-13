<%@page import="co.kh.dev.customer.model.CustomerDAO"%>
<%@page import="co.kh.dev.customer.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String id = request.getParameter("id");
 	String pwd = request.getParameter("pwd");
 	String name = request.getParameter("name");
 	String phone1 = request.getParameter("phone1");
 	String phone2 = request.getParameter("phone2");
 	String phone3 = request.getParameter("phone3");
 	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
 	String zipcode = request.getParameter("zipcode");
 	String address1 = request.getParameter("address1");
 	String address2 = request.getParameter("address2");
 
 	CustomerVO cvo = new CustomerVO(id,pwd,name,phone1,phone2,phone3,email,zipcode,address1,address2);
 	CustomerDAO cdao = new CustomerDAO();
 	boolean returnFlag = cdao.insertDB(cvo);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	if(returnFlag){
%>
	<h2>회원가입이 완료되었습니다.</h2>
	<br>
	<a href="loginPage.jsp"><button>로그인하기</button></a>
<%
	}else{
%>
	<h2>회원가입이 실패되었습니다.</h2>
	<br>
	<a href="registerPage.jsp"><button>뒤로가기</button></a>
<%
	}
%>
</body>
</html>