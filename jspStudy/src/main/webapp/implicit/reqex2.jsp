<%@ page contentType = "text/html; charset=euc-kr" %>
 <html>
 <head><title>폼 생성</title></head>
 <body>
	<h3>폼에 데이터를 입력한 후 '전송' 버튼을 클릭하세요.</h3>
	 <form action="<%= request.getContextPath() %>/implicit/viewParameter.jsp" method="post">
		이름: <input type="text" name="name" size="10"> <br></br>
		주소: <input type="text" name="address" size="30"> <br></br>
		좋아하는 동물: 
		<input type="checkbox" name="pet" value="dog">강아지 
		<input type="checkbox" name="pet" value="cat">고양이 
		<input type="checkbox" name="pet" value="pig">돼지 <br></br>
	 <input type="submit" value="전송">
	 </form>
 </body>
 </html>