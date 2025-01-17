package co.kh.dev.member;

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

@WebServlet(name = "memberList", urlPatterns = { "/memberList" })
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberList() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		String member_select = "select * from member order by no";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webuser", "123456");
			pstmt = con.prepareStatement(member_select);
			rs = pstmt.executeQuery();
			
			//출력
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>회원정보</head>");
			out.println("<body>");
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				out.println("<table align=center, border = 1px solid black, margin = 30px, width = 300px>");
				out.println("<tr>");
				out.println("<th>회원번호</th>");
				out.println("<td>"+no+"</td>");
				out.println("</tr>");
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
			}
			out.println("</body>");
			out.println("</html>");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			
		}

	}
}
