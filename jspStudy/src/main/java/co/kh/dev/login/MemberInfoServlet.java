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

import co.kh.dev.login.model.LoginDAO;
import co.kh.dev.login.model.LoginVO;

@WebServlet("/memberInfoServelet.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);

		LoginVO lvo = new LoginVO();
		LoginDAO ldao = new LoginDAO();

		String id = (String) session.getAttribute("id");
		lvo.setId(id);
		lvo = ldao.mypageDB(lvo);

		// 출력
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
		out.println("<td>" + lvo.getName() + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>아이디</th>");
		out.println("<td>" + id + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>비밀번호</th>");
		out.println("<td>" + lvo.getPassword() + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>전화번호</th>");
		out.println("<td>" + lvo.getPhone() + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>주소</th>");
		out.println("<td>" + lvo.getAddress() + "</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
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
