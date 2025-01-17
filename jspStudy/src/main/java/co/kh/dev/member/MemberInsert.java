package co.kh.dev.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberInsert", urlPatterns = { "/memberInsert" })
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsert() {
        super();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
		String member_insert = "INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, ?,?,?,?,?)";
	
		int count=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(member_insert);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, password);
			pstmt.setString(4, phone);
			pstmt.setString(5, address);
			count = pstmt.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
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
		}
		if(count != 0) {
			System.out.println("입력 성공");
			response.sendRedirect("memberList");
		}else {
			System.out.println("입력 실패");
		}
	
	}

}
