package handler;

import java.io.BufferedReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JSON.JqGridJSONObject;
import model.Manufactures;
import service.DrawGridService;
import service.ManufacturesService;

public class SearchManufactureHandler implements CommandHandler {

	private static final String FORM_VIEW = "/concept-master/content/emp/e_sample.jsp";
	private ManufacturesService manufacturesService = new ManufacturesService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return processSubmit(request, response);
	}

	public String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}

	public String processSubmit(HttpServletRequest request, HttpServletResponse response) {

		String temp = request.getParameter("searchData");
		System.out.println(temp);
		String[] datas = temp.split(",");
		for (String str : datas) {
			System.out.println(str);
		}
		/*
		 * String searchData = readJSONStringFromRequestBody(request);
		 * System.out.println(searchData);
		 */
		// List<Manufactures> list = null;

		// list = manufacturesService.selectData();
		/*
		 * String data = "["; for (Object ob : list) { data += ob.toString() + ","; }
		 * data = data.substring(0, data.length() - 1); data += "]";
		 * 
		 * System.out.println(data);
		 * 
		 * request.setAttribute("data", data);
		 */
        //request.setAttribute("searchData", searchData);
		return FORM_VIEW;
	}

	/*
	 * private String readJSONStringFromRequestBody(HttpServletRequest request) {
	 * StringBuffer json = new StringBuffer(); String line = null; try {
	 * BufferedReader reader = request.getReader(); while ((line =
	 * reader.readLine()) != null) { json.append(line); }
	 * 
	 * } catch (Exception e) { System.out.println("Error reading JSON string: " +
	 * e.toString()); } return json.toString(); }
	 */

}
