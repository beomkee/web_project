package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.NoticeDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.Notice;

public class NoticeService {

	NoticeDao noticeDao = new NoticeDao();
	
	public List<Notice> getNoticeList() {
		Connection conn = null;
		List<Notice> list = new ArrayList<Notice>();
		try {
			conn = ConnectionProvider.getConnection();
			list = noticeDao.getNoticeList(conn);
			return list;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public int getMaxNum() {
		Connection conn = null;
		int num = 0;
		try {
			conn = ConnectionProvider.getConnection();
			num = noticeDao.getMaxNum(conn);
			return num;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
