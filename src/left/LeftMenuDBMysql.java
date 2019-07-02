package left;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LeftMenuDBMysql {

	private static LeftMenuDBMysql instance = new LeftMenuDBMysql();

	public static LeftMenuDBMysql getInstance() {
		return instance;
	}

	private LeftMenuDBMysql() {
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/projectdb";
		String dbId = "scott";
		String dbPasswd = "1111";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPasswd);
		return conn;
	}

	public List<LeftMenuDataBean> getLeftMenu(int div) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LeftMenuDataBean left = null;
		List<LeftMenuDataBean> list = new ArrayList<LeftMenuDataBean>();
		try {
			conn = getConnection();
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
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return list;
	}
}
