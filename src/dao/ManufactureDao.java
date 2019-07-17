package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.Manufactures;

public class ManufactureDao {

	// 생산데이터
	// 조회============================================================================================================
	public List<Manufactures> selectManufactures(Connection conn) throws SQLException {
		Manufactures manufactures = null;
		List<Manufactures> list = new ArrayList<Manufactures>();

		try (PreparedStatement pstmt = conn.prepareStatement("select * from manufactures")) {
			ResultSet rs = pstmt.executeQuery();
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
			return list;
		}
	}

	// 검색결과
	// 조회=======================================================================================
	public List<Manufactures> searchMf(Connection conn, String[] searchOption) throws SQLException {
		Manufactures manufactures = null;
		List<Manufactures> list = new ArrayList<Manufactures>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from manufactures "
					+ "where mf_num = ? or f_num = ? or pl_num = ? or e_id = ? or p_num = ? or mf_count = ? or mf_date = ?");
			for (int i = 0; i < searchOption.length; i++) {
				pstmt.setString(i + 1, searchOption[i]);
			}
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
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// 입력 &
	// 수정======================================================================================================
	public boolean isExist(Connection conn, String num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from manufactures where mf_num = ?");
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} finally {
		}
		return false;
	}

	// 삭제======================================================================================================
	public void delete(Connection conn, String num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from manufactures where mf_num = ?");
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} finally {
		}
	}

	public int maxNum(Connection conn, String num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;
		try {
			pstmt = conn.prepareStatement("select max(mf_num) from manufactures");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
			return maxNum + 1;
		} finally {
		}
	}

	public void insert(Connection conn, String[] dataset, int num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into manufactures values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, num);
			for (int i = 1; i < dataset.length; i++) {
				pstmt.setString(i + 1, dataset[i]);
			}
			pstmt.executeUpdate();
		} finally {
		}
	}

	public void update(Connection conn, String[] dataset) throws SQLException {
		PreparedStatement pstmt = null;
		String mfId = dataset[0];
		try {
			pstmt = conn.prepareStatement("update manufactures "
					+ "set f_num = ?, pl_num = ?,e_id = ?,p_num = ?, mf_count = ?, mf_date = ? where mf_num = ?");
			for (int i = 1; i < dataset.length; i++) {
				pstmt.setString(i, dataset[i]);
			}
			pstmt.setString(7, mfId);
			pstmt.executeUpdate();
		} finally {
		}
	}

	// ====================================단일항목 조회
	// 쿼리들========================================
	public List<String> selectENum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select e_id from employee where pl_num in ('p_1','p_2','p_3')");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("e_id"));
				} while (rs.next());
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public List<String> selectCNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select c_id from customer");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("c_id"));
				} while (rs.next());
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public List<String> selectFNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		try (PreparedStatement pstmt = conn.prepareStatement("select f_num from factory")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("f_num"));
				} while (rs.next());
			}
			return list;
		}
	}

	public List<String> selectProNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		try (PreparedStatement pstmt = conn.prepareStatement("select p_num from product")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("p_num"));
				} while (rs.next());
			}
			return list;
		}
	}

	public List<String> selectSaleNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		try (PreparedStatement pstmt = conn.prepareStatement("select s_num from sales")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("s_num"));
				} while (rs.next());
			}
			return list;
		}
	}

	public List<String> selectManuNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();
		try (PreparedStatement pstmt = conn.prepareStatement("select mf_num from manufactures")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("s_num"));
				} while (rs.next());
			}
			return list;
		}
	}
}
