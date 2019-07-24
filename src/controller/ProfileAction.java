package controller;

import java.util.ArrayList;
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
import model.Manufactures;
import model.Sales;
import service.ChangePwService;
import service.ManufacturesService;
import service.ProfileService;
import service.SalesService;

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

		ManufacturesService manufacturesService = new ManufacturesService();
		int maxSale = profileService.getMaxSale();
		int maxMf = profileService.getMaxMf();
		List works = profileService.getWorks(id, pl);

		List<String> products = null;
		products = manufacturesService.proNums();
		String fac = manufacturesService.facNum(id);
		String pl_num = manufacturesService.plNum(id);

		request.setAttribute("pl", pl);
		request.setAttribute("maxMf", maxMf);
		request.setAttribute("maxSale", maxSale);
		request.setAttribute("works", works);
		request.setAttribute("fac", fac);
		request.setAttribute("pl_num", pl_num);
		request.setAttribute("products", products);

		return "/concept-master/content/emp/e_works.jsp";
	}

	public String insertWorksPOST(HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		String pl = request.getParameter("pl");
		String datas = "";
		if (pl.equals("mf")) {
			ManufacturesService manufacturesService = new ManufacturesService();
			datas += request.getParameter("mf_num") + ",";
			datas += request.getParameter("f_num") + ",";
			datas += request.getParameter("pl_num") + ",";
			datas += request.getParameter("e_id") + ",";
			datas += request.getParameter("p_num") + ",";
			datas += request.getParameter("mf_count") + ",";
			datas += request.getParameter("mf_date");
			String[] dataset = datas.split(",");
			List<Manufactures> list = new ArrayList<Manufactures>();
			list = manufacturesService.insertUpdate(dataset);
		} else {
			SalesService salesService = new SalesService();
			datas += request.getParameter("s_num") + ",";
			datas += request.getParameter("mf_num") + ",";
			datas += request.getParameter("e_id") + ",";
			datas += request.getParameter("c_id") + ",";
			datas += request.getParameter("p_num") + ",";
			datas += request.getParameter("s_obtain_date") + ",";
			datas += request.getParameter("s_contract_sum");
			String[] dataset = datas.split(",");
			List<Sales> list = new ArrayList<Sales>();
			list = salesService.insertUpdate(dataset);
		} 
		
		return "/concept-master/content/emp/insertWorksPro.jsp";
	}
}
