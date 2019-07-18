package handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JSON.JSONObject;
import JSON.JqGridJSONObject;
import model.Manufactures;
import service.DrawGridService;
import service.ManufacturesService;

public class ManufactureHandler implements CommandHandler {

	private static final String FORM_VIEW = "/concept-master/content/emp/e_manufacture.jsp";
	private ManufacturesService manufacturesService = new ManufacturesService();
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return processSubmit(request, response);
	}

	public String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}

	public String processSubmit(HttpServletRequest request, HttpServletResponse response) {

		JqGridJSONObject json = new JqGridJSONObject();
		List<Manufactures> list = null;
		String cols = "생산번호,공장번호,생산라인,담당직원,상품번호,생산수량,생산일자,삭제";
		String mods = "mf_num,f_num,pl_num,e_id,p_num,mf_count,mf_date";
		String ops = "0,0,0,0,0,0,0";
		json.putKey(cols);
		json.putVal(mods);
		json.setOption(ops);

		list = manufacturesService.selectData();

		String data = "[";
		for (Object ob : list) {
			data += ob.toString() + ",";
		}
		data = data.substring(0, data.length() - 1);
		data += "]";
		
		List<String> products = null;
		products = manufacturesService.proNums();
		
		List<String> emps = null;
		emps = manufacturesService.empNums();

		List<String> facs = null;
		facs = manufacturesService.facNums();
		
		/*
		 * System.out.println("colNames:"); System.out.println(json.getKey());
		 * System.out.println("\ncolModel:"); System.out.println(json.getValue());
		 * System.out.println("\ndata:"); System.out.println(data);
		 */
		
		
		//바그래프 정보넘기는 부분
		JSONObject bars = new JSONObject();
		
		bars.setName("data");
		bars.putKey(mods);
		/*
		 * bars.putValue(barValue1); bars.putValue(barValue2);
		 */
		
		request.setAttribute("colNames", json.getKey());
		request.setAttribute("colModel", json.getValue());
		request.setAttribute("data", data);
		request.setAttribute("products", products);
		request.setAttribute("emps", emps);
		request.setAttribute("facs", facs);
		/* request.setAttribute("bar_data1", bars); */

		return FORM_VIEW;
	}
}
