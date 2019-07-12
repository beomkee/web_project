package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ChangePwDao;
import dao.GridDataDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.ChangePwRequest;
import model.Manufactures;

public class manufacturesService {
	private GridDataDao dataDao = new GridDataDao();
	
	public List<Manufactures> selectData() {
		List<Manufactures> list = new ArrayList<Manufactures>();
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dataDao.selectManufactures(conn);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
