<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
StudentDAO sdao = new StudentDAO();
StudentVO svo = new StudentVO();
svo.setId(id);
boolean flag = sdao.deleteDB(svo);
if (flag == true) {
	session.invalidate();
%>
<html>
<head>
<title>회원탈퇴</title>
</head>

<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
	<main>
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다<br></br> 안녕히 가세요 ! ㅠ.ㅠ<br></br>
			3초후에 로그인 페이지로 이동합니다
		</font>
	</main>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>