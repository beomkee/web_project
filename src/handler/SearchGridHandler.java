package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import JSON.JqGridJSONObject;
import service.ManufacturesService;

public class SearchGridHandler implements CommandHandler {

	private ManufacturesService manufacturesService = new ManufacturesService();

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
		String result = "[";
		for (Object ob : list) {
			result += ob.toString()+",";
		}
		result = result.substring(0, result.length() - 1);
		result += "]";
		Map<String, String> ttt = new HashMap<String, String>();
		ttt.put("colNames", json.getKey()+"\n\n");
		ttt.put("colModel", json.getValue()+"\n\n");
		ttt.put("data", result);
			
		request.setAttribute("data", ttt);
		System.out.println("colNames: \n"+ttt.get("colNames"));
		System.out.println("colModel: \n"+ttt.get("colModel"));
		System.out.println("data:\n"+ttt.get("data"));
		return "/concept-master/jqgrid/commonGrid.js";
	}
}
