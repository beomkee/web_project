package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import model.ChangePwRequest;
import model.Manufactures;
import model.Sales;

public class ProfileDao {
	
	public List getWorks(Connection conn, String id, String pl) throws SQLException {
		List list = new ArrayList();
		Manufactures manufactures = null;
		Sales sale = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if (pl.equals("mf")) {
				pstmt = conn.prepareStatement("select * from manufactures where e_id = ? order by mf_num desc");
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
				pstmt = conn.prepareStatement("select * from sales where e_id = ? order by s_obtain_date desc");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					do {
						sale = new Sales();
						sale.setS_num(rs.getString("s_num"));
						sale.setMf_num(rs.getString("mf_num"));
						sale.setE_id(rs.getString("e_id"));
						sale.setE_id(rs.getString("c_id"));
						sale.setC_id(rs.getString("p_num"));
						sale.setP_num(rs.getString("s_obtain_date"));
						sale.setS_obtain_date(rs.getString("s_obtain_date"));
						sale.setS_contract_sum(rs.getString("s_contract_sum"));
						list.add(sale);
					} while (rs.next());
				}
			}
			return list;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}	
}
