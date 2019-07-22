package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.Notice;

public class MainDao {

	public List<Notice> getNotice(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<Notice>();
		Notice notice = null;
		try {
			pstmt = conn.prepareStatement("select * from notice_board order by n_num desc limit 0,5");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					notice = new Notice();
					notice.setN_num(rs.getInt("n_num"));
					notice.setWriter(rs.getString("writer"));
					notice.setTitle(rs.getString("title"));
					notice.setContent(rs.getString("content"));
					notice.setReg_date(rs.getDate("reg_date"));
					notice.setMod_date(rs.getDate("mod_date"));
					list.add(notice);
				} while (rs.next());
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int lastNotice(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) AS lastnotice FROM notice_board WHERE MONTH(mod_date) = 07");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
			return num;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<String> getEmails(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		String email = "";
		try {
			pstmt = conn.prepareStatement("SELECT e_email FROM employee");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					email = rs.getString("e_email");
					list.add(email);
				} while (rs.next());
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
}
