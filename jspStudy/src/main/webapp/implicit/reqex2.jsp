<%@ page contentType = "text/html; charset=euc-kr" %>
 <html>
 <head><title>�� ����</title></head>
 <body>
	<h3>���� �����͸� �Է��� �� '����' ��ư�� Ŭ���ϼ���.</h3>
	 <form action="<%= request.getContextPath() %>/implicit/viewParameter.jsp" method="post">
		�̸�: <input type="text" name="name" size="10"> <br></br>
		�ּ�: <input type="text" name="address" size="30"> <br></br>
		�����ϴ� ����: 
		<input type="checkbox" name="pet" value="dog">������ 
		<input type="checkbox" name="pet" value="cat">������ 
		<input type="checkbox" name="pet" value="pig">���� <br></br>
	 <input type="submit" value="����">
	 </form>
 </body>
 </html>