package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet.do" )
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			// 1. 세션 정보 가져오기(세션 객체가 있으면 세션 객체를 주고 없으면 null)
			HttpSession session = request.getSession(false);
			// 2. 세션 정보 있으면 아이디와 패스워드를 가져온다. 없으면 로그인 창으로 가게한다.
			if (session != null) {
				// 사용자정보 id, pass
				String id = (String) session.getAttribute("id");
				String password = (String) session.getAttribute("password");
				// 사용자정보를 화면에 출력한다.

				System.out.println("세션 고유 번호 : " + session.getId());
				out.println("<html>");
				out.println("<body>");
				out.println("<table border='1' width='300'>");
				out.println("<tr>");
				out.println("<td width='300' align='center'>" + id + " 님 로그인 되었습니다.</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center'>");
				out.println("<a href='/jspStudy/memberInfoServelet.do'>회원정보</a>");
				out.println("<a href='/jspStudy/logoutServlet.do'>로그아웃</a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			} else {
				out.println("<html>");
				out.println("<body>");
				out.print("<form method='post' action='/jspStudy/loginCheck.do'>");
				out.println("<table border='1' width='300'>");
				out.println("<tr>");
				out.println("<th width='100'>아이디</th>");
				out.println("<td width='200'>&nbsp;<input type='text' name='id'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th width='100'>비밀번호</th>");
				out.println("<td width='200'>&nbsp;<input type='password' name='password'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center' colspan='2'>");
				out.println("<a href='/jspStudy/login/memberInsert.html'><input type='button' value='회원가입'></a>");
				out.println("<input type='submit' value='로그인'>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</form>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(out!=null) {
				out.close();
			}
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
