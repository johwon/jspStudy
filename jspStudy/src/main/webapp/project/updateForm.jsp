<%@page import="co.kh.dev.board.model.Board2DAO"%>
<%@page import="co.kh.dev.board.model.Board2VO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./view/color.jsp"%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
Board2VO vo = new Board2VO();
vo.setNum(num);
%>
<%
try {
	Board2DAO bdao = Board2DAO.getInstance();
	Board2VO article = bdao.selectBoardOneDB(vo);
%>
<!DOCTYPE html>
<%@ include file="./top.jsp"%>
<main>
	<aside class="left"></aside>
	<section align="center">
		<div class="center">
		<b>글수정</b> <br>
		<form method="post" name="writeform" 
			action="updateProc.jsp?pageNum=<%=pageNum%>"
			onsubmit="return writeSave()" style="background-color: white">
			<input type="hidden" name="num" value="<%=article.getNum()%>">
			<table width="600" border="1" cellspacing="0" cellpadding="0"
				align="center" >
				<tr>
					<td width="100px" align="center">이 름</td>
					<td align="left" width="330"><input type="text" size="10"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
					</td>
				</tr>
				<tr>
					<td width="100px" align="center">제 목</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="100px" align="center">Email</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="7100px" align="center">내 용</td>
					<td align="left" width="330"><textarea name="content"
							rows="13" cols="40">
 <%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="100px" align="center">비밀번호</td>
					<td align="left" width="330"><input type="password" size="8"
						maxlength="12" name="pass"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="글수정"> 
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%
	} catch (Exception e) {
	}
	%>
<%@ include file="./bottom.jsp"%>