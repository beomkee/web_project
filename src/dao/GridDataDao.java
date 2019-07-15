package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Manufactures;

public class GridDataDao {
	
	//생산데이터 조회
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
	
	
	//====================================단일항목 조회 쿼리들========================================
	public List<String> selectENum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();;
		try (
			PreparedStatement pstmt = conn.prepareStatement("select e_id from employee where pl_num in ('p_1','p_2','p_3')")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("e_id"));
				} while (rs.next());
			}
			return list;
		}
	}
	public List<String> selectCNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();;
		try (
				PreparedStatement pstmt = conn.prepareStatement("select c_id from customer")) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					list.add(rs.getString("c_id"));
				} while (rs.next());
			}
			return list;
		}
	}
	
	public List<String> selectFNum(Connection conn) throws SQLException {
		List<String> list = new ArrayList<String>();;
		try (
				PreparedStatement pstmt = conn.prepareStatement("select f_num from factory")) {
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
		List<String> list = new ArrayList<String>();;
		try (
				PreparedStatement pstmt = conn.prepareStatement("select p_num from product")) {
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
		List<String> list = new ArrayList<String>();;
		try (
				PreparedStatement pstmt = conn.prepareStatement("select s_num from sales")) {
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
		List<String> list = new ArrayList<String>();;
		try (
				PreparedStatement pstmt = conn.prepareStatement("select mf_num from manufactures")) {
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
