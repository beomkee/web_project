package left;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.JdbcUtil;

public class LeftMenuDAO {

	private static LeftMenuDAO instance = new LeftMenuDAO();

	public static LeftMenuDAO getInstance() {
		return instance;
	}

	private LeftMenuDAO() {
	}

	public List<LeftMenuDataBean> getLeftMenu(Connection conn, int div) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LeftMenuDataBean left = null;
		List<LeftMenuDataBean> list = new ArrayList<LeftMenuDataBean>();
		try {
			String query = "select * from left_menu where division = ? and use_yn = 'y'";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, div);
			rs = stmt.executeQuery();
			if (rs.next()) {
				do {
					left = new LeftMenuDataBean();
					left.setNum(rs.getInt("num"));
					left.setText(rs.getString("text"));
					left.setDepth(rs.getInt("depth"));
					left.setCollapse(rs.getString("collapse"));
					left.setUrl(rs.getString("url"));
					left.setParent_num(rs.getInt("parent_num"));
					list.add(left);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
		return list;
	}
	public List<LeftMenuDataBean>  selectAllLeft(Connection conn) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LeftMenuDataBean left = null;
		List<LeftMenuDataBean> list = new ArrayList<LeftMenuDataBean>();
		try {
			String query = "select * from left_menu";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {
				do {
					left = new LeftMenuDataBean();
					left.setNum(rs.getInt("num"));
					left.setText(rs.getString("text"));
					left.setDepth(rs.getInt("depth"));
					left.setCollapse(rs.getString("collapse"));
					left.setDivision(rs.getInt("division"));
					left.setUrl(rs.getString("url"));
					left.setUse_yn(rs.getString("use_yn"));
					left.setParent_num(rs.getInt("parent_num"));
					list.add(left);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(rs);
		}
		return list;
	}
}
