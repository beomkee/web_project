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
	
	public int getMinNum() {
		Connection conn = null;
		int num = 0;
		try {
			conn = ConnectionProvider.getConnection();
			num = mainDao.getMinNum(conn);
			return num;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	

	public Notice getContent(int nNum) {
		Connection conn = null;
		Notice notice = new Notice();
		try {
			conn = ConnectionProvider.getConnection();
			notice = mainDao.getContent(conn, nNum);
			return notice;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public void writeNotice(String writer, String title, String content) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			mainDao.writeNotice(conn, writer, title, content);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void updateNotice(String n_num, String title, String content) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			mainDao.updateNotice(conn, n_num, title, content);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public void deleteNotice(String n_num) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			mainDao.deleteNotice(conn, n_num);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
