package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.Notice;

public class NoticeDao {

	public List<Notice> getNoticeList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<Notice>();
		Notice notice = null;
		try {
			pstmt = conn.prepareStatement("select * from notice_board order by n_num");
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
	
	public int getMaxNum(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			pstmt = conn.prepareStatement("select max(n_num) from notice_board;");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
			return num+1;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
