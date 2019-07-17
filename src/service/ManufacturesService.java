package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ChangePwDao;
import dao.ManufactureDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.ChangePwRequest;
import model.Manufactures;

public class ManufacturesService {
	private ManufactureDao dataDao = new ManufactureDao();
	
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
	
	public List<Manufactures> searchData(String[] dataset) {
		List<Manufactures> list = new ArrayList<Manufactures>();
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dataDao.searchMf(conn, dataset);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public List<Manufactures> insertUpdate(String[] dataset) {
		Connection conn = null;
		List<Manufactures> list = new ArrayList<Manufactures>();
		try {
			conn = ConnectionProvider.getConnection();
			boolean isExist = dataDao.isExist(conn, dataset[0]);
			if (isExist) {
				dataDao.update(conn, dataset);
			}else {
				int num  = 0;
				num = dataDao.maxNum(conn, dataset[0]);
				dataDao.insert(conn, dataset , num);
			}
			list = dataDao.selectManufactures(conn);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public List<Manufactures> delete(String num) {
		Connection conn = null;
		List<Manufactures> list = new ArrayList<Manufactures>();
		try {
			conn = ConnectionProvider.getConnection();
			dataDao.delete(conn, num);
			list = dataDao.selectManufactures(conn);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		}finally {
			JdbcUtil.close(conn);
		}
				
	}
	
	public List<String> proNums() {
		Connection conn = null;
		List<String> list = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dataDao.selectProNum(conn);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
		return list;
	}
	
	public List<String> empNums() {
		Connection conn = null;
		List<String> list = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dataDao.selectENum(conn);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
		return list;
	}
	
	public List<String> facNums() {
		Connection conn = null;
		List<String> list = null;
		try {
			conn = ConnectionProvider.getConnection();
			list = dataDao.selectFNum(conn);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
		return list;
	}
}
