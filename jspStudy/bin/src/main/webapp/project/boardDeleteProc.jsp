<%@page import="co.kh.dev.board.model.Board2VO"%>
<%@page import="co.kh.dev.board.model.Board2DAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String pass = request.getParameter("pass");
%>
<% 
Board2DAO bdao = Board2DAO.getInstance();
Board2VO vo = new Board2VO();
vo.setNum(num);
vo.setPass(pass);
boolean check = bdao.deleteDB(vo);
if (check) {
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
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