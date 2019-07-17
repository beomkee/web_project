package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JSON.JSONObject;

public class BarGraphHandler implements CommandHandler {

	private static final String FORM_VIEW = "/concept-master/ajaxResult/barResult.jsp";

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		JSONObject json = new JSONObject();
		String name = request.getParameter("name");
		String aaa = request.getParameter("barKey");
		String bbb = request.getParameter("barValue1");
		String ccc = request.getParameter("barValue2");

		String[] barKey = aaa.split(",");
		String[] barValue1 = bbb.split(",");
		String[] barValue2 = ccc.split(",");

		//String[] keys = barKey;
		/*
		 * json.putKey("January", "February", "March", "April", "May", "June", "July",
		 * "August", "September", "October", "November", "December");
		 */
		/*
		 * Integer[] num1 = { 12, 65, 37, 85, 43, 89, 44, 55, 75, 45, 35, 96 }; String[]
		 * num2 = { "30", "65", "97", "84", "78", "94", "15", "35", "65", "75", "15",
		 * "35" }; Integer[] num3 = { 65, 87, 54, 15, 65, 45, 85, 32, 47, 85, 96, 15 };
		 * Integer[] num4 = { 54, 94, 64, 15, 24, 75, 36, 48, 45, 61, 54, 48 };
		 */
		json.setName(name);
		json.putKey(barKey);
		json.putValue(barValue1);
		json.putValue(barValue2);

		request.setAttribute("barGraph", json);

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
