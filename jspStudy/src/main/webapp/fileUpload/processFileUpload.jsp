<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//1.사용자가 전송할때 form에 enctype="multipart/form-data" 점검
if (FileUpload.isMultipartContent(request)) {
	//2. 임시파일지정
	String temporaryDir = "D:\\temp";
	//3. MultipartRequest(request,위치,사이즈,인코딩,이름정책) 객체와 같은 기능
	DiskFileUpload fileUpload = new DiskFileUpload();
	//3-1 위치
	fileUpload.setRepositoryPath(temporaryDir);
	//3-2 사이즈 최대 1메가
	fileUpload.setSizeMax(1024 * 1024);
	//3-3 내부메모리에 들어올 사이즈 결정, 한번에 100K 까지는 메모리에 저장.
	fileUpload.setSizeThreshold(1024 * 100);
	//4.FileItem의 리스트 - Enumeration files = multiRequest.getFileNames(); 똑같은 기능! 
	//4. (String) files.nextElement();와 비슷함
	java.util.List fileItemList = fileUpload.parseRequest(request);
	for (int i = 0; i < fileItemList.size(); i++) {
		//4-1 해당되는 파일정보 가져옴
		FileItem fileItem = (FileItem) fileItemList.get(i);
		//4-2 폼파라미터 보내온 <input type="file">이 아닌지 체크
		if (fileItem.isFormField()) {// 파일 이외의 파라미터
	out.println("폼 파라미터:");
	out.println(fileItem.getFieldName() + " = " + fileItem.getString() + "<br>");
		} else { // 파일인 경우
	out.println("파일:");
	out.println(
			fileItem.getFieldName() + " = " + fileItem.getString() + "(" + fileItem.getSize() + "bytes) <br>");
	//메모리에 저장되어있는 파일? 디스크에 저장되어있는 파일?
	if (fileItem.isInMemory()) {
		out.println("메모리에 저장 <br>");
	} else {
		out.println("디스크에 저장 <br>");
	}
	//upload 위치를 알려준다.
	String filepath = application.getRealPath("upload");
	// 업로드한 파일이 사이즈가 있는지 체크
	if (fileItem.getSize() > 0) {
		//D:\\temp\\sdfs\\orange.png	\\없으면 위치는 -1 리턴
		int idx = fileItem.getName().lastIndexOf("\\");
		if (idx == -1) {
		//D:/temp/sdfs/orange.png	\\없으면 위치는 -1 리턴
			idx = fileItem.getName().lastIndexOf("/");
		}
		//substr
		String fileName = fileItem.getName().substring(idx + 1);
		try {
			//filepath String filepath = application.getRealPath("upload");
			//new File(upload/orange.png);
			File uploadedFile = new File(filepath, fileName);
			// d://temp/orange.png => /jspStudy/upload/orange.png
			fileItem.write(uploadedFile);
		} catch (IOException ex) {
			// 예외 처리
		}
	} // 업로드한 파일이 존재하는 경우
		} // 파일인 경우
	} //end of for
} else { //1.사용자가 전송할때 form에 enctype="multipart/form-data"
	out.println("인코딩 타입이 multipart/form-data가 아님.");
}
%>