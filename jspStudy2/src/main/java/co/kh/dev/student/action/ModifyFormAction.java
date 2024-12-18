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

public class ModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		StudentDAO dao = StudentDAO.getInstance();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		StudentVO vo = new StudentVO();
		vo.setId(id);
		StudentVO svo = dao.selectOneDB(vo);
		request.setAttribute("svo", svo);
		
		return new ActionForward("/mvcmem/modifyForm.jsp", false);
	}
}
