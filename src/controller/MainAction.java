package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import model.Manufactures;
import model.Notice;
import model.Sales;
import model.SendEmail;
import service.EmailService;
import service.MainService;
import service.ManufacturesService;
import service.SalesService;

public class MainAction extends Action {

	MainService mainService = new MainService();

	public String mainUserGET(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LOGINED_ID");
		
		List<Notice> notices = mainService.getNotice();
		int lastNotice = mainService.lastNotice();
		int lastWort = mainService.lastWork(id);
		int lastEmail = mainService.lastEmail(id);
		
		EmailService emailService = new EmailService();
		List<SendEmail> emails = emailService.getEmails(id);
		
		List works = mainService.getWorks(id);
		String pl = mainService.getPl(id);
		session.setAttribute("pl", pl);
		/*
		 * ManufacturesService manufacturesService = new ManufacturesService();
		 * List<Manufactures> mfs = manufacturesService.getMfs(id);
		 * 
		 * SalesService salesService = new SalesService(); List<Sales> sales =
		 * salesService.getSales(id);
		 */
		
		/*
		 * request.setAttribute("sales", sales); request.setAttribute("mfs", mfs);
		 */
		request.setAttribute("works", works);
		request.setAttribute("emails", emails);
		request.setAttribute("notices", notices);
		request.setAttribute("lastNotice", lastNotice);
		request.setAttribute("lastWort", lastWort);
		request.setAttribute("lastEmail", lastEmail);
		

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
