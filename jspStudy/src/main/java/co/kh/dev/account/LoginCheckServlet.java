package co.kh.dev.account;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.account.model.AccountDAO;
import co.kh.dev.account.model.AccountVO;
import co.kh.dev.common.DBUtility;


@WebServlet("/loginCheckServlet.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginCheckServlet() {
		super();
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		final String SELECT_SQL = "SELECT PWD, NAME FROM ACCOUNT WHERE ID = ?";
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. 사용자정보를 얻는다
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// 2. curd
			AccountDAO ad = new AccountDAO();
			AccountVO avo = new AccountVO();
			avo.setId(id);
			avo.setPwd(pwd);
			AccountVO ravo = ad.selectLoginCheckDB(avo);
			if(ravo == null) {
				//아이디 패스워드 잘못된 경우
				
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("id", ravo.getId());
				session.setAttribute("pwd", ravo.getPwd());
				session.setAttribute("name", ravo.getName());
			}
			//3.화면
			response.sendRedirect("/jspStudy/loginServlet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		processRequest(request, response);
	}

}