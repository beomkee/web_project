package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.Manufactures;
import model.Notice;
import model.Sales;
import model.SendEmail;

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

	public List getWorks(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		Manufactures manufactures = null;
		Sales sale = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from employee where e_id = ? and pl_num in ('p_1','p_2','p_3')");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					pstmt = conn.prepareStatement("select * from manufactures where e_id = ? order by mf_num desc limit 0,5");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						do {
							manufactures = new Manufactures();
							manufactures.setMf_num(rs.getString("mf_num"));
							manufactures.setF_num(rs.getString("f_num"));
							manufactures.setPl_num(rs.getString("pl_num"));
							manufactures.setE_id(rs.getString("e_id"));
							manufactures.setP_num(rs.getString("p_num"));
							manufactures.setMf_count(rs.getString("mf_count"));
							manufactures.setMf_date(rs.getString("mf_date"));
							list.add(manufactures);
						} while (rs.next());
					}
				} else {
					pstmt = conn.prepareStatement("select * from sales where e_id = ? order by s_obtain_date desc limit 0,5");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						do {
							sale = new Sales();
							sale.setS_num(rs.getString("s_num"));
							sale.setMf_num(rs.getString("mf_num"));
							sale.setE_id(rs.getString("e_id"));
							sale.setC_id(rs.getString("c_id"));
							sale.setP_num(rs.getString("p_num"));
							sale.setS_obtain_date(rs.getString("s_obtain_date"));
							sale.setS_obtain_date(rs.getString("s_obtain_date"));
							sale.setS_contract_sum(rs.getString("s_contract_sum"));
							list.add(sale);
						} while (rs.next());
					}
				}
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public String getPl(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pl = "";
		try {
			pstmt = conn.prepareStatement("select count(*) from employee where e_id = ? and pl_num in ('p_1','p_2','p_3')");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					pl = "mf";
				}else {
					pl = "sale";
				}
			}
			return pl;
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

	public int lastWork(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			pstmt = conn.prepareStatement("SELECT pl_num from employee where e_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pl_num").charAt(0) == 'p') {
					pstmt = conn
							.prepareStatement("SELECT count(*) as works from manufactures where MONTH(mf_date) = 07");
					rs = pstmt.executeQuery();
					if (rs.next()) {
						num = rs.getInt(1);
					}
				} else {
					pstmt = conn
							.prepareStatement("SELECT count(*) as works from sales where MONTH(s_obtain_date) = 07");
					rs = pstmt.executeQuery();
					if (rs.next()) {
						num = rs.getInt(1);
					}
				}
			}
			return num;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int lastEmail(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM sendemail WHERE MONTH(reg_date) = 07 and writer = ? order by num desc");
			pstmt.setString(1, id);
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
}
