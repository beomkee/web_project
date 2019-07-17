package handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Manufactures;
import service.ManufacturesService;

public class SearchManufactureHandler implements CommandHandler {

	private static final String FORM_VIEW = "/concept-master/ajaxResult/mfResult.jsp";
	private ManufacturesService manufacturesService = new ManufacturesService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String dataSet = request.getParameter("dataSet");
		String[] datas = dataSet.split(",",7);
		/*
		 * for (int i = 0; i < datas.length; i++) { System.out.println("데이터"+
		 * (i+1)+": "+datas[i]); }
		 */
		List<Manufactures> searchList = manufacturesService.searchData(datas);
		
		request.setAttribute("list", searchList);
	
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
