<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="co.kh.dev.login2.model.LoginDAO"%>
<%@ page import="co.kh.dev.login2.model.LoginVO"%>
<!-- 2.curd -->
<%
boolean successFlag = false;
String message = "";
if (session != null) {
	String id = (String) session.getAttribute("id");
	LoginDAO ldao = new LoginDAO();
	LoginVO lvo = new LoginVO(id);
	successFlag = ldao.deleteLogin(lvo);
	if (successFlag) {
		// 탈퇴 성공
		session.invalidate(); // 세션 무효화
		message = "탈퇴되었습니다.";
	}else{
		message = "탈퇴 실패하였습니다.";
	}
}else{
	message = "세션이 존재하지 않습니다. 다시 로그인 해주세요.";
}
%>
	<script>
		alert('<%= message %>');
		window.location.href = 'login_main.jsp'; // 리다이렉트
	</script>
