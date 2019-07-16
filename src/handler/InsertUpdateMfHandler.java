package handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manufactures;
import service.ManufacturesService;

public class InsertUpdateMfHandler implements CommandHandler {

	private static final String FORM_VIEW = "/concept-master/ajaxResult/mfResult.jsp";
	private ManufacturesService manufacturesService = new ManufacturesService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String dataSet = request.getParameter("dataSet");
		String[] datas = dataSet.split(",");
		List<Manufactures> list = new ArrayList<Manufactures>();
		list = manufacturesService.insertUpdate(datas);
		request.setAttribute("list", list);
		return FORM_VIEW;
	}
}
