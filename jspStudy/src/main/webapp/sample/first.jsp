<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 여기서 아래에 있는 멤버변수를 쓴다 <%= declation %></h1>
	<h1> 여기서 아래에 있는 멤버함수를 콜할수있다 <%= getDeclation() %></h1>
	<h1>연산처리</h1>
	<%
		//내장객체 context,config,request,response,pagecontext,session,out,page
		//자바 연산처리(제어문, 반복문): 서비스에서 진행이 된다.
		String message = "연산처리문입니다.";		//message : 서비스에 있는 지역변수
		out.println("내장객체를 이용한 출력 " + message);
		//멤버함수영역 서비스 안에 있음
	%>
	<h1>멤버변수선언</h1>
	<%!
		String declation = "멤버변수선언문입니다.";
		//멤버변수선언영역에 있음(맨위)
	%>
	<h1>멤버함수선언</h1>
	<%!
		public String getDeclation(){
			return declation;
	}
		//멤버함수영역에있음
	%>
</body>
</html>