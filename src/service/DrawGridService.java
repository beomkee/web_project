package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.ChangePwDao;
import dao.GridDataDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.ChangePwRequest;
import model.Manufactures;

public class DrawGridService {
	private GridDataDao dataDao = new GridDataDao();

	public List<Manufactures> selectManufactures() {
		Connection conn = null;
		List<Manufactures> list = null;
		try {
			conn = ConnectionProvider.getConnection();
			 list = dataDao.selectManufactures(conn);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
		return list;
	}
}
