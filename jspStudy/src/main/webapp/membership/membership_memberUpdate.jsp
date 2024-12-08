<%@ page contentType="text/html; charset=UTF-8"
import = "java.sql.Connection"
import = "java.sql.PreparedStatement"
import = "co.kh.dev.account.model.AccountDAO"
import = "co.kh.dev.account.model.AccountVO"
import = "co.kh.dev.common.DBUtility"
%>
<%
		//객체참조변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		// 1. 사용자정보를 가져온다, 3 화면에 보여준다.
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		try {
			if (session == null) {
				// 로그인을 하지않고 불법적으로 수정페이지롤 들어온것이기 때문에 경고창준다.
				System.out.println("세션값이 없습니다.");
				response.sendRedirect("membership_mypage.jsp");
			} else {
				// 2. curd
				String sid = (String) session.getAttribute("id");
				if (!(sid.equals(id))) {
					System.out.println("세션 아이디값이 일치하지 않습니다.");
					response.sendRedirect("membership_mypage.jsp");
				} else {
					System.out.println("입력실패");
%>
					<html>
					<head>
					<meta charset='UTF-8'>
					<title>Insert title here</title>
					</head>
					<body>
					<h1 align= 'center'>회원수정이 실패되었습니다.</h1>
					<table align='center' width='300' border='1'>
					<tr>
					<td align="center">
					<a href='/jspStudy/membership/membership_login.jsp'><input type="button" value="로그인"></a>
					</td>
					</tr>
					</table>
					</body>
					</html>
<%
				}
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBUtility.dbClose(con, pstmt);
	}
%>