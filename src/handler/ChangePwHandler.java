package handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChangePwRequest;
import service.ChangePwService;

public class ChangePwHandler implements CommandHandler {
	
	private static final String ORIGIN_VIEW = "/concept-master/content/emp/e_profile.jsp";
	private ChangePwService changePwService = new ChangePwService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ChangePwRequest cpReq = new ChangePwRequest();
		cpReq.setId(request.getParameter("id"));
		cpReq.setPasswd(request.getParameter("passwd"));
		cpReq.setPasswdCheck(request.getParameter("passwdCheck"));
		cpReq.setTel(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		Map<String, Boolean> stat = new HashMap<>();
		if (!cpReq.isPasswordEqualToConfirm()) {
			stat.put("notEq", Boolean.TRUE);
			request.setAttribute("stat", stat);
			return ORIGIN_VIEW;
		}else {
			changePwService.updatePw(cpReq);
			stat.put("success", Boolean.TRUE);
			request.setAttribute("stat", stat);
			return ORIGIN_VIEW;
		}
	}
}
