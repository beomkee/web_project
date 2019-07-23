package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import model.Notice;
import service.MainService;

public class MainAction extends Action {

	MainService mainService = new MainService();

	public String mainUserGET(HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		List<Notice> notices = mainService.getNotice();
		int lastNotice = mainService.lastNotice();

		request.setAttribute("notices", notices);
		request.setAttribute("lastNotice", lastNotice);

		return "/concept-master/content/main_e.jsp";
	}

	public String mainManagerGET(HttpServletRequest request, HttpServletResponse res) throws Exception {

		return "/concept-master/content/main_m.jsp";
	}

	public String mainPartnerGET(HttpServletRequest request, HttpServletResponse res) throws Exception {

		return "/concept-master/content/main_p.jsp";
	}

	public String mainAdminGET(HttpServletRequest request, HttpServletResponse res) throws Exception {

		return "/concept-master/content/main_a.jsp";
	}

}
