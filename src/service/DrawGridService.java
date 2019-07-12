package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.ChangePwDao;
import dao.GridDataDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.ChangePwRequest;

public class DrawGridService {
	private GridDataDao dataDao = new GridDataDao();
	
	public void selectData(String tables) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			dataDao.selectTables(conn, tables);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
