package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import model.Notice;
import service.NoticeService;

public class NoticeAction extends Action {

	NoticeService noticeService = new NoticeService();
	
	public String nListGET(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Notice> notices = noticeService.getNoticeList();

		request.setAttribute("notices", notices);

		return "/concept-master/content/notice/noticeList.jsp";
	}

	public String nWriteGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int maxNum = noticeService.getMaxNum();
			
		request.setAttribute("maxNum", maxNum);
		
		return "/concept-master/content/notice/noticeWrite.jsp";
	}
}
