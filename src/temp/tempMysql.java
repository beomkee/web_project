package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.SaleDataBean;
import member.LoginUserDataBean;

public class tempMysql {

	private static tempMysql instance = new tempMysql();

	public static tempMysql getInstance() {
		return instance;
	}

	private tempMysql() {
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

	public boolean idValidationCheck(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean isExist = false;
		try {
			conn = getConnection();
			String query1 = "select e_id from employee where e_id = ?";
			String query2 = "select c_id from customer where c_id = ?";
			if (id.charAt(0) == '3') {
				stmt = conn.prepareStatement(query2);
			} else {
				stmt = conn.prepareStatement(query1);
			}
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				isExist = true;
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
		return isExist;
	}
}
