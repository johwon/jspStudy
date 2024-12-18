package co.kh.dev.student.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.student.control.ActionForward;
import co.kh.dev.student.model.StudentDAO;
import co.kh.dev.student.model.StudentVO;
import co.kh.dev.student.model.ZipCodeVO;

public class LoginProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		StudentDAO dao = StudentDAO.getInstance();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		StudentVO svo = new StudentVO();
		svo.setId(id);
		svo.setPass(pass);
		int check = dao.selectLoginCheck(svo);
		if (check == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		request.setAttribute("check", check);
		return new ActionForward("login.do", false);
	}

}
