package co.kh.dev.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.common.DBUtility;
import co.kh.dev.login.model.LoginDAO;
import co.kh.dev.login.model.LoginVO;

@WebServlet("/loginCheck.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LoginDAO ldao = new LoginDAO();
		LoginVO lvo = new LoginVO();
		try {
			// 1. 사용자 정보를 읽는다.
			request.setCharacterEncoding("UTF-8");

			String id = request.getParameter("id");
			String password = request.getParameter("password");
			lvo.setId(id);
			lvo.setPassword(password);
			// 2. 데이터베이스에서 확인한다. id, pass
			boolean returnFlag = ldao.loginDB(lvo);

			// 3. 체크확인해서 로그인 인정이 되면 세션을 만들어서 저장한다.
			if (returnFlag = true) {
				// 세션이 있으면 가져오고 없으면 생성함
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("password", password);
			}else {
			}
			response.sendRedirect("/jspStudy/loginServlet.do");
		} catch (IOException e) {
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
