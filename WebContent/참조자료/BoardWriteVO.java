package egovframework.example.boardAdmin.service;

import egovframework.example.cmmn.service.CmmnVO;

public class BoardWriteVO extends CmmnVO {

	private String contentId = "";
	private String boardNm="";
	private String contentTitle = "";
	private String contentContent = "";
	private String writerId = "";
	private String infoType = "";
	
	public String getInfoType() {
		return infoType;
	}
	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getBoardNm() {
		return boardNm;
	}
	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getContentContent() {
		return contentContent;
	}
	public void setContentContent(String contentContent) {
		this.contentContent = contentContent;
	}
}