<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 3. 화면설계 -->
<html>
<head>
<title>ID중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
	<br>
	<main>
		<%
		String id = (String) request.getAttribute("id");
		boolean check = (boolean) request.getAttribute("check");
		if (check == true) {
			out.println(id + "는 이미 존재하는 ID입니다.<br></br>");
		} else {
			out.println(id + "는 사용 가능 합니다.<br></br>");
		}
		%>
		<button onClick="javascript:self.close()">닫기</button>
	</main>
</body>
</html>