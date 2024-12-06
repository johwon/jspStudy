package co.kh.dev.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import co.kh.dev.common.DBUtility;

@WebServlet("/loginCheck.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//1. 사용자 정보를 읽는다.
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			//2. 데이터베이스에서 확인한다. id, pass
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
			String loginCheck_select = "select * from login where id = ?";
			
			String idChk = null;
			String passChk = null;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "webuser", "123456");
			
			pstmt = con.prepareStatement(loginCheck_select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idChk = rs.getString("id");
				passChk = rs.getString("password");
				
				//3. 체크확인해서 로그인 인정이 되면 세션을 만들어서 저장한다.
				if(id.equals(idChk)&& password.equals(passChk)) {
					//세션이 있으면 가져오고 없으면 생성함
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("password", password);
					break;
				}
			}
			response.sendRedirect("/jspStudy/loginServlet.do");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtility.dbClose(con, pstmt, rs);
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
