package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import service.ManufacturesService;

public class ChartAction extends Action {

	public String mfDataPOST(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ManufacturesService service = new ManufacturesService();
		
		//line 차트 데이터
		Map<String, Map<Integer, Integer>> lineData = service.getLineData();
		String line = lineData.toString().replace("=", ":");
		
		//bar 차트 데이터
		Map<String, Map<String, Integer>> barData = service.getBarData();
		String bar = barData.toString().replace("=", ":");
		
		//pie 차트 데이터
		Map<String, Integer> pieData = service.getPieData();
		String pie = pieData.toString().replace("=", ":");
		
		//polor 차트 데이터
		Map<String, Integer> polorData = service.getPolorData();
		String polor = polorData.toString().replace("=", ":");
		
		
		
		Map<String, String> ChartDatas = new HashMap<String, String>();
		ChartDatas.put("\nLineData", line+"\n\n");
		ChartDatas.put("barData", bar+"\n\n");
		ChartDatas.put("pieData", pie+"\n\n");
		ChartDatas.put("polorData", polor+"\n");
		
		String datas = ChartDatas.toString().replace("=", ":");
		request.setAttribute("datas", datas);
		
		return "/concept-master/ajaxResult/ChartResult.jsp";
	}
}
