package handler;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import JSON.JqGridJSONObject;
import service.manufacturesService;

public class DrawGridHandler implements CommandHandler {

	private manufacturesService manufacturesService = new manufacturesService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		JqGridJSONObject json = new JqGridJSONObject();
		String cols = request.getParameter("colNames");
		String ops = request.getParameter("options");
		String tableName = request.getParameter("tableName");
		List<?> list = null;
		json.putKey(cols);
		json.setOption(ops);

		switch (tableName) {
		case "manufactures":
			list = manufacturesService.selectData();
			break;
		case "sales":

			break;
		case "left_menu":

			break;
		case "customer":

			break;
		case "employee":
			
			break;
		case "factory":
			
			break;
		case "m_order":
			
			break;
		case "own_pl":
			
			break;
		case "p_line":
			
			break;
		case "product":
			
			break;
		case "store":
			
			break;
		}
		request.setAttribute("data", list);

		return "";
	}
}
