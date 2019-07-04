package service;

import java.sql.Connection;
import java.util.List;

import connection.ConnectionProvider;
import connection.JdbcUtil;
import exception.ServiceException;
import left.LeftMenuDAO;
import left.LeftMenuDataBean;

public class LeftMenuService {
	private static LeftMenuService instance = new LeftMenuService();

	public static LeftMenuService getInstance() {
		return instance;
	}

	private LeftMenuService() {
	}
	
	public List<LeftMenuDataBean> getLeftMenu(int division) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			LeftMenuDAO left = LeftMenuDAO.getInstance();
			return left.getLeftMenu(conn, division);
		} catch (Exception e) {
			throw new ServiceException("메뉴목록 불러오기 실패: "+e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	public List<LeftMenuDataBean> selectAllLeft() {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			LeftMenuDAO left = LeftMenuDAO.getInstance();
			return left.selectAllLeft(conn);
		} catch (Exception e) {
			throw new ServiceException("메뉴목록 불러오기 실패: "+e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
