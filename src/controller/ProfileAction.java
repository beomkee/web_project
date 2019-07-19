package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import dao.UserDao;
import model.ChangePwRequest;
import model.LoginUser;
import service.ChangePwService;

public class ProfileAction extends Action {

	public String loginPOST(HttpServletRequest request, HttpServletResponse res) throws Exception {

		String loginId = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String div = String.valueOf(loginId.charAt(0));
		UserDao manager = UserDao.getInstance();
		HttpSession session = request.getSession();
		int check = 0;

		if (loginId.equalsIgnoreCase("admin")) {
			if (passwd.equals("1")) {
				return "/concept-master/content/main_a.jsp";
			}
		} else {
			check = manager.userCheck(loginId, passwd);
		}
		LoginUser user = manager.getUserInfo(loginId);
		session.setAttribute("user", user);
		session.setAttribute("LOGINED_ID", loginId);
		request.setAttribute("check", check);
		request.setAttribute("loginId", loginId);
		request.setAttribute("userDiv", div);

		return "/concept-master/login/userDivider.jsp";
	}

	public String mainGET(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String div = req.getParameter("div");

		return "/concept-master/content/main_" + div + ".jsp";
	}

	public String e_profileGET(HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		return "/concept-master/content/emp/e_profile.jsp";
	}

	public String changePWPOST(HttpServletRequest request, HttpServletResponse res) throws Exception {
		ChangePwService changePwService = new ChangePwService();
		ChangePwRequest cpReq = new ChangePwRequest();
		cpReq.setId(request.getParameter("id"));
		cpReq.setPasswd(request.getParameter("passwd"));
		cpReq.setPasswdCheck(request.getParameter("passwdCheck"));
		cpReq.setTel(
				request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3"));
		Map<String, Boolean> stat = new HashMap<>();
		if (!cpReq.isPasswordEqualToConfirm()) {
			stat.put("notEq", Boolean.TRUE);
			request.setAttribute("stat", stat);
			return "/concept-master/content/emp/e_profile.jsp";
		} else {
			changePwService.updatePw(cpReq);
			stat.put("success", Boolean.TRUE);
			request.setAttribute("stat", stat);
			return "/concept-master/content/emp/e_profile.jsp";
		}
	}
}
