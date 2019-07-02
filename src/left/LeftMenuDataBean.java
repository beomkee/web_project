package left;

public class LeftMenuDataBean {
	
	private int num;
	private String text;
	private int depth;
	private String collapse;
	private String url;
	private int parent_num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getCollapse() {
		return collapse;
	}
	public void setCollapse(String collapse) {
		this.collapse = collapse;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getParent_num() {
		return parent_num;
	}
	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	@Override
	public String toString() {
		return "{num:" + num + ", text:" + text + ", depth:" + depth + ", collapse:" + collapse
				+ ", url:" + url + ", parent_num:" + parent_num + "}";
	}
	
}
