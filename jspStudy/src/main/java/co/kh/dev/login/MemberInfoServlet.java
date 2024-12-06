package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memberInfoServelet.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
		HttpSession session = request.getSession(false);
		
		String memberInfo_select = "SELECT * FROM LOGIN WHERE ID = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String id = (String)session.getAttribute("id");
			String name = null;
			String password = null;
			String address = null;
			String phone = null;
			
			con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(memberInfo_select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				name = rs.getString("name");
				password = rs.getString("password");
				address = rs.getString("address");
				phone = rs.getString("phone");
			}
			
			//출력
			out.println("<html>");
			out.println("<head>");
			out.println("</head>");
			out.println("<body>");
			out.println("<table border=1px, width=300px>");
			out.println("<tr>");
			out.println("<th colspan=2 >회원정보</th>");
			out.println("<tr>");
			out.println("<tr>");
			out.println("<th>이름</th>");
			out.println("<td>"+name+"</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>아이디</th>");
			out.println("<td>"+id+"</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>비밀번호</th>");
			out.println("<td>"+password+"</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>전화번호</th>");
			out.println("<td>"+phone+"</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>주소</th>");
			out.println("<td>"+address+"</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</body>");
			out.println("</html>");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
