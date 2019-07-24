package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ChangePwDao;
import dao.ProfileDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.ChangePwRequest;

public class ProfileService {
	private ProfileDao pfDao = new ProfileDao();
	
	public List getWorks(String	id, String pl) {
		Connection conn = null;
		List list = new ArrayList();
		try {
			conn = ConnectionProvider.getConnection();
			list = pfDao.getWorks(conn, id, pl);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public int getMaxSale() {
		Connection conn = null;
		int ms = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ms = pfDao.getMaxSale(conn);
			return ms;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public int getMaxMf() {
		Connection conn = null;
		int ms = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ms = pfDao.getMaxMf(conn);
			return ms;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
