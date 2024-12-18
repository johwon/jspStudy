package co.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.kh.dev.student.control.ActionForward;

public interface Action {
	//추상메소드
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws IOException;
}
