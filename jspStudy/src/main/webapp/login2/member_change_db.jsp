<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="co.kh.dev.login2.model.LoginDAO"%>
<%@ page import="co.kh.dev.login2.model.LoginVO"%>
<%
// 1.1 전송된 값을 UTF-8로 설정하기
request.setCharacterEncoding("UTF-8");

// 1.2 사용자 입력 받은 비밀번호 값
String pass = request.getParameter("pass");
String pass1 = request.getParameter("pass1");

// 1.3 세션에서 사용자 아이디 가져오기
String id = (String) session.getAttribute("id");
String message;

// 2. 비밀번호 변경 처리
boolean successFlag = false;

if (pass != null && pass.equals(pass1)) {
	// 비밀번호가 일치하면 DB에서 비밀번호를 변경
	LoginDAO ld = new LoginDAO();
	LoginVO lvo = new LoginVO(id, pass);
	successFlag = ld.changeLogin(lvo);

// 3. 결과에 따른 화면 처리
if (successFlag) {
	// 비밀번호 변경 성공 시 세션에 새로운 비밀번호 저장
	session.setAttribute("pass", pass);
	message = "비밀번호 변경이 완료되었습니다.";
}else{
	message = "비밀번호 수정 실패했습니다.";
}

%>
<html>
<head>
<script>
	window.onload = function() {
		alert('<%=message%>');
		window.location.href = 'login_main.jsp'; // 리다이렉트
	};
</script>
</head>
<body>
</body>
</html>
<%
}else{
%>
<html>
<head>
<script>
	window.onload = function() {
		alert('패스워드 입력에 문제가 있습니다.');
		window.location.href = 'login_main.jsp'; // 리다이렉트
	};
</script>
</head>
<body>
</body>
</html>
<%
}
%>
