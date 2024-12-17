<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//1. 업로드 경로 지정
String uploadPath = request.getRealPath("upload"); //업로드를 어디에 할것인지
//2. 업로드할 최대 사이즈 지정
int size = 10 * 1024 * 1024; //최대 10MB
String name = "";
String subject = "";
String filename1 = "";
String filename2 = "";
String origfilename1 = "";
String origfilename2 = "";
try {
	//3. MultipartRequest 객체 생성, 매개변수(request, 업로드 위치, 사이즈, 인코딩방식, new DefaultFileRenamePolicy())
	MultipartRequest multiRequest = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	name = multiRequest.getParameter("name");
	subject = multiRequest.getParameter("subject");
	//4. 파일명 가져옴
	Enumeration files = multiRequest.getFileNames();		//파일명 가져오는법
	String file1 = (String) files.nextElement();	//String file1 = fileName2
	//5. 업로드된 서버에서 저장된 이름을 가져옴(테이블 저장되어야함)
	filename1 = multiRequest.getFilesystemName(file1);				//서버에 저장된 이름-DefaultFileRenamePolicy()에 의해 이름+번호 증가시킴(중복안되게)
	//6. 사용자가 지정한 파일의 진짜 이름을 가져온다.
	origfilename1 = multiRequest.getOriginalFileName(file1);	//orange.png 사용자가 정한 이름
	String file2 = (String) files.nextElement();	//String file2 = fileName1
	filename2 = multiRequest.getFilesystemName(file2);
	origfilename2 = multiRequest.getOriginalFileName(file2);
	System.out.println(file1);
	System.out.println(file2);
	System.out.println(uploadPath);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<html>
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> 
		<input type="hidden" name="subject" value="<%=subject%>"> 
		<input type="hidden" name="filename1" value="<%=filename1%>"> <!-- 업로드에 저장하는 이름 -->
		<input type="hidden" name="filename2" value="<%=filename2%>"> 
		<input type="hidden" name="origfilename1" value="<%=origfilename1%>">		<!-- 진짜 클라이언트가 올린 파일이름 -->
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드
		페이지 이동</a>	<!-- 앵커는 원래 get방식, post로 보내기위해 onclick 사용해서 submit -->
</body>
</html>