<%@ page contentType="text/html; charset=UTF-8"%>
 <% 
 request.setCharacterEncoding("UTF-8"); 
 %>
 <jsp:useBean id="sdao" class="co.kh.dev.memberone.model.StudentDAO"/>
 <jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO">
 <jsp:setProperty name="svo" property="*"/>
 </jsp:useBean>
<%
String id = (String) session.getAttribute("id");
svo.setId(id);
boolean flag = sdao.updateDB(svo);
%>
<html>
<head>
<title>Update Process</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
	<main>
<%
	if(flag==true){
		//수정잘됨
		session.setAttribute("pass", svo.getPass());
%>
<p>
		입력하신 내용대로 <b>회원정보가 수정 되었습니다.</b><br></br>
 		3초후에 Login Page로 이동합니다
 </p>
<%
	}else{
		//수정오류
%>
<p>
		<b>회원정보 수정이 실패되었습니다..</b><br></br>
 		3초후에 Login Page로 이동합니다
 </p>
<%
}
%>
	
 </main>
 </body>
 </html>
<head>
