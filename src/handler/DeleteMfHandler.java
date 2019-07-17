package handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manufactures;
import service.ManufacturesService;

public class DeleteMfHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/concept-master/ajaxResult/mfResult.jsp";
	private ManufacturesService manufacturesService = new ManufacturesService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String num = request.getParameter("rows");
		List<Manufactures> list = new ArrayList<Manufactures>();
		list = manufacturesService.delete(num);
		request.setAttribute("list", list);
		return FORM_VIEW;
	}
}
