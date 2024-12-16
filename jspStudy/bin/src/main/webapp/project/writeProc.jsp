<%@page import="co.kh.dev.board.model.Board2DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" scope="page"
	class="co.kh.dev.board.model.Board2VO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<!-- 2. curd -->
<%
vo.setRegdate(new Timestamp(System.currentTimeMillis()));
vo.setIp(request.getRemoteAddr());
Board2DAO bdao = Board2DAO.getInstance();
boolean flag = bdao.insertDB(vo);
if (flag == true) {
	response.sendRedirect("list.jsp");
}else{
%>
<script>
	alert("글 등록이 실패되었습니다.")
	history.go(-1);
</script>
<%
}
%>