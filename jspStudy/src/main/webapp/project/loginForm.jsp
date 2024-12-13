<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 세션 정보를 가져오기 (세션이 없으면 null 반환)
String id = (String) session.getAttribute("id");
if (id == null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body align="center">
    <h3>로그인</h3>
    <form action="loginCheck.jsp" method="post">
        <fieldset style="border: 0cap;">
        <table align="center">
            <tr>
                <th><label for="id">아이디</label></th>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <th><label for="pwd">비밀번호</label></th>
                <td><input type="text" name="pwd" id="pwd"></td>
            </tr>
        </table>
        </fieldset>
                <input type="submit" value="로그인" size="300px">
                <a href='registerForm.jsp'><input
						type='button' value='회원가입'></a>
    </form>
</body>
</html>
<%
 } else {
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
 }
%>