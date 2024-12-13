<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@page import="co.kh.dev.memberone.model.ZipCodeVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1. 사용자정보 가져오기 -->
<!-- 2. curd -->
<%
request.setCharacterEncoding("UTF-8");
String check = request.getParameter("check");
String dong = request.getParameter("dong");
ArrayList<ZipCodeVO> zipList = null;

if(check.equals("n")){
ZipCodeVO zvo = new ZipCodeVO();
zvo.setDong(dong);
StudentDAO sdao = new StudentDAO();
zipList = sdao.selectZipCode(zvo);
}
%>

<html>
<head>
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
<!-- ② -->
</head>
<body bgcolor="#FFFFCC">
	<main>
		<b>우편번호 찾기</b>
		<form name="zipForm" method="post" action="zipCheck.jsp">
			<input type="hidden" name="check" value="n">
			<table>
				<tr>
					<td>동이름 입력 : <input name="dong" type="text"> <input
						type="button" value="검색" onclick="dongCheck()" />
					</td>
				</tr>
			</table>
		</form>
		<table>
			<!-- ③ -->
			<%
			if (check.equals("n")) {
				if (zipList.isEmpty()) {
			%>
			<tr>
				<td align="center"><br />검색된 결과가 없습니다.</td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<td align="center"><br /> ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
			</tr>
			<%
			for ( ZipCodeVO data : zipList) {
				String tempZipcode = data.getZipcode();
				String tempSido = data.getSido();
				String tempGugun = data.getGugun();
				String tempDong = data.getDong();
				String tempBunji = data.getBunji();
				if (tempBunji == null)
					tempBunji = " ";
			%>
			<tr>
				<td><a href="javascript:sendAddress('<%=tempZipcode%>','<%=tempSido%>','<%=tempGugun%>','<%=tempDong%>','<%=tempBunji%>')">
						<%=data.toString()%></a><br>
					<%
					} //end for
				} //end zipList.isEmpty() else
 }//end if check.equals("n") 
 %></td>
			</tr>
			<tr>
				<td align="center"><a href="javascript:this.close();">닫기</a></td>
			</tr>
		</table>
	</main>
</body>
</html>