package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Manufactures;

public class GridDataDao {
	
	public List<Manufactures> selectManufactures(Connection conn) throws SQLException {
		Manufactures manufactures = null;;
		List<Manufactures> list = new ArrayList<Manufactures>();;
		try (
			PreparedStatement pstmt = conn.prepareStatement("select * from manufactures")) {
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
}
