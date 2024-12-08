<%@ page contentType="text/html; charset=UTF-8"
import = "java.sql.Connection"
import = "java.sql.PreparedStatement"
import = "java.sql.ResultSet"
import = "co.kh.dev.account.model.AccountDAO"
import = "co.kh.dev.account.model.AccountVO"
import = "co.kh.dev.common.DBUtility"
%>

<%
String SELECT_SQL = "SELECT PWD, NAME FROM ACCOUNT WHERE ID = ?";
Connection con = DBUtility.dbCon();
PreparedStatement pstmt = null;
ResultSet rs = null;
	// 1. 사용자정보를 얻는다
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	pstmt = con.prepareStatement(SELECT_SQL);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	// 2. curd
	AccountDAO ad = new AccountDAO();
	AccountVO avo = new AccountVO();
	avo.setId(id);
	avo.setPwd(pwd);
	AccountVO ravo = ad.selectLoginCheckDB(avo);
	if(ravo == null) {
		//아이디 패스워드 잘못된 경우
		
	}else {
		session.setAttribute("id", ravo.getId());
		session.setAttribute("pwd", ravo.getPwd());
		session.setAttribute("name", ravo.getName());
	}
	//3.화면
	response.sendRedirect("/jspStudy/membership/membership_login.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>