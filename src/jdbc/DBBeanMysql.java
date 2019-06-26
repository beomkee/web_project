package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.SaleDataBean;
import member.LoginUserDataBean;

public class DBBeanMysql {

	private static DBBeanMysql instance = new DBBeanMysql();

	public static DBBeanMysql getInstance() {
		return instance;
	}

	private DBBeanMysql() {
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/projectdb";
		String dbId = "scott";
		String dbPasswd = "1111";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPasswd);
		return conn;
	}

	public int userCheck(String id, String passwd) {
		Connection conn = null;
		Statement stmtE = null;
		Statement stmtC = null;
		ResultSet rsE = null;
		ResultSet rsC = null;
		String answer = null;
		try {
			conn = getConnection();
			String queryE = "select * from employee where e_id =" + id;
			String queryC = "select * from customer where c_id =" + id;
			stmtE = conn.createStatement();
			stmtC = conn.createStatement();
			rsE = stmtE.executeQuery(queryE);
			rsC = stmtC.executeQuery(queryC);
			if (rsE.next()) {
				answer = (String) rsE.getString("e_passwd");
				if (passwd.equals(answer)) {
					return 1;
				} else {
					return 0;
				}
			} else if (rsC.next()) {
				answer = (String) rsC.getString("c_passwd");
				if (passwd.equals(answer)) {
					return 1;
				} else {
					return 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmtE != null || stmtC != null) {
				try {
					stmtE.close();
					stmtC.close();
				} catch (SQLException e2) {
				}
			}
			if (rsE != null || rsC != null) {
				try {
					rsE.close();
					rsC.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return 2;
	}

	public LoginUserDataBean getUserInfo(String id) {
		LoginUserDataBean member = new LoginUserDataBean();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int div = -1;
		try {
			conn = getConnection();
			String query1 = "select * from employee where e_id = ?";
			String query2 = "select * from customer where c_id = ?";
			if (id.charAt(0) == '3') {
				stmt = conn.prepareStatement(query2);
				div = 3;
			} else {
				stmt = conn.prepareStatement(query1);
			}
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (div == 3) {
				if (rs.next()) {
					member.setId(rs.getString("c_id"));
					member.setPasswd(rs.getString("c_passwd"));
					member.setName(rs.getString("c_name"));
					member.setContract_date(rs.getString("c_contract_date"));
				}
			} else {
				if (rs.next()) {
					member.setId(rs.getString("e_id"));
					member.setPasswd(rs.getString("e_passwd"));
					member.setName(rs.getString("e_name"));
					member.setTel(rs.getString("e_tel"));
					member.setBirth(rs.getString("e_birth"));
					member.setManager_num(rs.getString("manager_num"));
					member.setF_num(rs.getString("f_num"));
					member.setPl_num(rs.getString("pl_num"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return member;
	}

	public List<SaleDataBean> getSalesList(String id) {
		SaleDataBean sale = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<SaleDataBean> salesList = new ArrayList<SaleDataBean>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement("select * from sales where e_id = ?");
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				do {
					sale = new SaleDataBean();
					sale.setS_num(rs.getString("s_num"));
					sale.setMf_num(rs.getString("mf_num"));
					sale.setE_id(rs.getString("e_id"));
					sale.setC_id(rs.getString("c_id"));
					sale.setP_num(rs.getString("p_num"));
					sale.setS_obtain_date(rs.getString("s_obtain_date"));
					sale.setS_contract_sum(rs.getString("s_contract_sum"));
					sale.setS_complete_date(rs.getString("s_complete_date"));
					salesList.add(sale);
				} while (rs.next());

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return salesList;
	}

	public int insertUpdate(LoginUserDataBean dataBean, String target) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int stat = -1;
		try {
			System.out.println(dataBean);
			conn = getConnection();
			if (target.equals("직원")) {
				System.out.println("1");
				pstmt = conn.prepareStatement("select * from employee where e_id = ?");
				System.out.println("2");
				pstmt.setString(1, dataBean.getId());
				rs = pstmt.executeQuery();
				System.out.println("3");
				if (rs.next()) {
					System.out.println("4");
					String dbpass = rs.getString("e_passwd");
					if (dbpass.equals(dataBean.getPasswd())) {
						System.out.println("5");
						pstmt = conn.prepareStatement("update employee set "
								+ " e_passwd=?, e_name=?, e_tel=?, e_birth=?, manager_num=?, f_num=?,"
								+ "pl_num=? where e_id = ?");
						pstmt.setString(1, dataBean.getPasswd());
						pstmt.setString(2, dataBean.getName());
						pstmt.setString(3, dataBean.getTel());
						pstmt.setString(4, dataBean.getBirth());
						pstmt.setString(5, dataBean.getManager_num());
						pstmt.setString(6, dataBean.getF_num());
						pstmt.setString(7, dataBean.getPl_num());
						pstmt.setString(8, dataBean.getId());
						pstmt.executeUpdate();
						System.out.println("6");
						stat = 2;
					} else {
						stat = 3;
					}
				} else {
					System.out.println("7");
					pstmt = conn.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?)");
					pstmt.setString(1, dataBean.getId());
					pstmt.setString(2, dataBean.getPasswd());
					pstmt.setString(3, dataBean.getName());
					pstmt.setString(4, dataBean.getTel());
					pstmt.setString(5, dataBean.getBirth());
					pstmt.setString(6, dataBean.getManager_num());
					pstmt.setString(7, dataBean.getF_num());
					pstmt.setString(8, dataBean.getPl_num());
					pstmt.executeUpdate();
					stat = 1;
				}
			} else {
				System.out.println("8");
				pstmt = conn.prepareStatement("select * from customer where c_id = ?");
				pstmt.setString(1, dataBean.getId());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					System.out.println("9");
					String dbpass = rs.getString("e_passwd");
					if (dbpass.equals(dataBean.getPasswd())) {
						pstmt = conn.prepareStatement(
								"update customer set " + ", c_passwd=?, c_name=?, c_contract_date=? where c_id = ?");
						pstmt.setString(1, dataBean.getPasswd());
						pstmt.setString(2, dataBean.getName());
						pstmt.setString(3, dataBean.getContract_date());
						pstmt.setString(8, dataBean.getId());
						pstmt.executeUpdate();
						stat = 2;
					} else {
						stat = 3;
					}
				} else {
					System.out.println("10");
					pstmt = conn.prepareStatement("insert into employee values(?,?,?,?)");
					pstmt.setString(1, dataBean.getId());
					pstmt.setString(2, dataBean.getPasswd());
					pstmt.setString(3, dataBean.getName());
					pstmt.setString(4, dataBean.getContract_date());
					pstmt.executeUpdate();
					stat = 1;
				}
			}
			System.out.println("11");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
		}
		return stat;
	}
	public List<LoginUserDataBean> getEmpCusList(String target) {
		LoginUserDataBean user = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<LoginUserDataBean> userList = new ArrayList<LoginUserDataBean>();
		try {
			conn = getConnection();
			if (target.equals("직원")) {
				stmt = conn.prepareStatement("select * from employee");
				rs = stmt.executeQuery();
				if (rs.next()) {
					do {
						user = new LoginUserDataBean();
						user.setId(rs.getString("e_id"));
						user.setPasswd(rs.getString("e_passwd"));
						user.setName(rs.getString("e_name"));
						user.setTel(rs.getString("e_tel"));
						user.setBirth(rs.getString("e_birth"));
						user.setManager_num(rs.getString("manager_num"));
						user.setF_num(rs.getString("f_num"));
						user.setPl_num(rs.getString("pl_num"));
						userList.add(user);
					} while (rs.next());
				}
			}else {
				stmt = conn.prepareStatement("select * from customer");
				rs = stmt.executeQuery();
				if (rs.next()) {
					do {
						user = new LoginUserDataBean();
						user.setId(rs.getString("c_id"));
						user.setPasswd(rs.getString("c_passwd"));
						user.setName(rs.getString("c_name"));
						user.setContract_date(rs.getString("c_contract_date"));
						userList.add(user);
					} while (rs.next());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return userList;
	}
	public List<LoginUserDataBean> serchEmpCusList(String colum, String serchVar, String target) {
		System.out.println(colum+","+serchVar+","+target);
		LoginUserDataBean user = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<LoginUserDataBean> userList = new ArrayList<LoginUserDataBean>();
		try {
			conn = getConnection();
			if (target.equals("직원")) {
				stmt = conn.prepareStatement("select * from employee where ? = ?");
				stmt.setString(1, colum);
				stmt.setString(2, serchVar);
				rs = stmt.executeQuery();
				if (rs.next()) {
					do {
						user = new LoginUserDataBean();
						user.setId(rs.getString("e_id"));
						user.setPasswd(rs.getString("e_passwd"));
						user.setName(rs.getString("e_name"));
						user.setTel(rs.getString("e_tel"));
						user.setBirth(rs.getString("e_birth"));
						user.setManager_num(rs.getString("manager_num"));
						user.setF_num(rs.getString("f_num"));
						user.setPl_num(rs.getString("pl_num"));
						userList.add(user);
					} while (rs.next());
				}
			}else {
				stmt = conn.prepareStatement("select * from customer where ? = ?");
				stmt.setString(1, colum);
				stmt.setString(2, serchVar);
				rs = stmt.executeQuery();
				if (rs.next()) {
					do {
						user = new LoginUserDataBean();
						user.setId(rs.getString("c_id"));
						user.setPasswd(rs.getString("c_passwd"));
						user.setName(rs.getString("c_name"));
						user.setContract_date(rs.getString("c_contract_date"));
						userList.add(user);
					} while (rs.next());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}
		}
		return userList;
	}
}
