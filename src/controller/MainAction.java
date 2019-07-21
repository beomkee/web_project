package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import model.Notice;
import service.MainService;

public class MainAction extends Action {

	MainService mainService = new MainService();
	
	public String mainUserGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		List<Notice> notices = mainService.getNotice();
		int lastNotice = mainService.lastNotice();
		
		request.setAttribute("notices", notices);
		request.setAttribute("lastNotice", lastNotice);
		
		return "/concept-master/content/main_e.jsp";
	}
}
