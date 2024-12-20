<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.edu.jstl.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO vo1 = new MemberVO("홍길동", "길동1@naver.com", 20);
MemberVO vo2 = new MemberVO("저길동", "길동2@naver.com", 30);
MemberVO vo3 = new MemberVO("구길동", "길동3@naver.com", 40);
MemberVO vo4 = new MemberVO("말길동", "길동4@naver.com", 50);
ArrayList<MemberVO> list = new ArrayList<MemberVO>();
list.add(vo1);
list.add(vo2);
list.add(vo3);
list.add(vo4);
request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 정보</h3>
	<table border="1" width="450">
		<tr>
			<th width="50">번호</th>
			<th width="100">이름</th>
			<th width="200">메일</th>
			<th width="100">나이</th>
		</tr>
		<c:forEach var="data" items="${list}" varStatus="no">
			<tr>
				<td>${no.count}</td>
				<td>${data.name}</td>
				<td>${data.email}</td>
				<td>${data.age}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>