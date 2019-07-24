package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import dao.UserDao;
import model.ChangePwRequest;
import model.LoginUser;
import service.ChangePwService;
import service.ProfileService;

public class ProfileAction extends Action {

	public String loginPOST(HttpServletRequest request, HttpServletResponse res) throws Exception {

		String loginId = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String div = String.valueOf(loginId.charAt(0));
		UserDao manager = UserDao.getInstance();
		HttpSession session = request.getSession();
		int check = 0;
		String division = String.valueOf(loginId.charAt(0));
		if (loginId.equalsIgnoreCase("admin")) {
			if (passwd.equals("1")) {
				check = 1;
				division = "A";
			}
		} else {
			check = manager.userCheck(loginId, passwd);
			if (division.equals("1")) {
				division = "E";
			} else if (division.equals("2")) {
				division = "M";
			} else if (division.equals("3")) {
				division = "P";
			}
			LoginUser user = manager.getUserInfo(loginId);
			session.setAttribute("user", user);
		}
		
		session.setAttribute("division", division);
		session.setAttribute("LOGINED_ID", loginId);
		request.setAttribute("check", check);
		request.setAttribute("loginId", loginId);
		request.setAttribute("userDiv", div);

		return "/concept-master/login/userDivider.jsp";
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
	
public String worksGET(HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		HttpSession session = request.getSession();
		String pl = (String) session.getAttribute("pl");
		String id = (String) session.getAttribute("LOGINED_ID");
		ProfileService profileService = new ProfileService();
		
		List works = profileService.getWorks(id, pl);
		
		request.setAttribute("pl", pl);
		request.setAttribute("works", works);

		return "/concept-master/content/emp/e_works.jsp";
	}
}
