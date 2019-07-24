package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.MainDao;
import dao.NoticeDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.Notice;
import model.SendEmail;

public class MainService {

	MainDao mainDao = new MainDao();
	
	public List<Notice> getNotice() {
		Connection conn = null;
		List<Notice> list = new ArrayList<Notice>();
		try {
			conn = ConnectionProvider.getConnection();
			list = mainDao.getNotice(conn);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public List getWorks(String id) {
		Connection conn = null;
		List list = new ArrayList();
		try {
			conn = ConnectionProvider.getConnection();
			list = mainDao.getWorks(conn, id);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public String getPl(String id) {
		Connection conn = null;
		String pl = "";
		try {
			conn = ConnectionProvider.getConnection();
			pl = mainDao.getPl(conn, id);
			return pl;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public int lastNotice() {
		Connection conn = null;
		int num = 0;
		try {
			conn = ConnectionProvider.getConnection();
			num = mainDao.lastNotice(conn);
			return num;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public int lastWork(String id) {
		Connection conn = null;
		int num = 0;
		try {
			conn = ConnectionProvider.getConnection();
			num = mainDao.lastWork(conn, id);
			return num;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public int lastEmail(String id) {
		Connection conn = null;
		int num = 0;
		try {
			conn = ConnectionProvider.getConnection();
			num = mainDao.lastEmail(conn, id);
			return num;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
