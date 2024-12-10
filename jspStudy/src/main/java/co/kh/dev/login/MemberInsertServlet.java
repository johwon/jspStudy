package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.login.model.LoginDAO;
import co.kh.dev.login.model.LoginVO;

@WebServlet("/memberInsertServlet.do")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int count = 0;
		LoginVO lvo = new LoginVO(0, name, id, password, phone, address);
		LoginDAO ldao = new LoginDAO();
		boolean returnFlag = ldao.insertDB(lvo);

		if(returnFlag) {
			//html 화면 구현
			System.out.println("회원가입 성공하였습니다.");
		}else {
			System.out.println("회원가입에 실패했습니다.");
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
