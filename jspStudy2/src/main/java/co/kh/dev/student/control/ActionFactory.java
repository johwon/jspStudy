package co.kh.dev.student.control;

import co.kh.dev.student.action.Action;
import co.kh.dev.student.action.IdCheckAction;
import co.kh.dev.student.action.IndexAction;
import co.kh.dev.student.action.LoginFormAction;
import co.kh.dev.student.action.LoginProcAction;
import co.kh.dev.student.action.LogoutAction;
import co.kh.dev.student.action.ModifyFormAction;
import co.kh.dev.student.action.RegFormAction;
import co.kh.dev.student.action.RegProcAction;
import co.kh.dev.student.action.ZipCheckAction;

//싱글톤 방식
public class ActionFactory {
	private static ActionFactory factory;

	public static synchronized ActionFactory getInstance() {
		if (factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}

	private ActionFactory() {
	}

	public Action getAction(String cmd) {
		Action action = null;
		switch (cmd) {
		case "/index.do":
			action = new IndexAction();
			break;
		case "/regForm.do":
			action = new RegFormAction();
			break;
		case "/idCheck.do":
			action = new IdCheckAction();
			break;
		case "/zipCheck.do":
			action = new ZipCheckAction();
			break;
		case "/regProc.do":
			action = new RegProcAction();
			break;
		case "/login.do":
			action = new LoginFormAction();
			break;
		case "/loginProc.do":
			action = new LoginProcAction();
			break;
		case "/logout.do":
			action = new LogoutAction();
			break;
		case "/modifyForm.do":
			action = new ModifyFormAction();
			break;
		case "/modifyProc.do":
			action = new ModifyFormAction();
			break;
		default:
			action = new IndexAction();
			break;
		}
		return action;
	}

}
