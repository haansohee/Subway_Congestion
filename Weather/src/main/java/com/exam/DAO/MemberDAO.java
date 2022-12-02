package com.exam.DAO;
import java.sql.*;
import com.exam.DTO.MemberDTO;

public class MemberDAO {
	private static MemberDAO mDAO;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	private MemberDAO() {
		
	}
	
	public static synchronized MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		}
		return mDAO;
	}
	
	public Connection getConnection() {
		String dbURL = "jdbc:mysql://127.0.0.1:3306/JSP_Weather?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbID = "sohee_java";
		String dbPassword = "Inha1958";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void close (Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null ) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int join(MemberDTO mDTO) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		if (checkID(mDTO) == 0) {  // 중복 체크 
			return 0;
		}
		
		
		query.append("insert into member_table values (?, ?, ?, ?, ?)");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, mDTO.getUserID());
			pstmt.setString(2, mDTO.getUserPassword());
			pstmt.setString(3, mDTO.getUserName());
			pstmt.setString(4, mDTO.getUserEmail());
			pstmt.setString(5, mDTO.getUserCity());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return result;
	}
	
	public int checkID(MemberDTO mDTO) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("select userID from member_table where userID = ?");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, mDTO.getUserID());
			
			rs = pstmt.executeQuery();		
			
			if(rs.next()) {
				if(mDTO.getUserID().equals(rs.getString("userID"))) {
					return 0;  // 중복이면 0 반환 
				} else {
					return 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return 0;
	}
	
	public int login(String userID, String userPassword) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("select userPassword from member_table where userID = ?");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString("userPassword").equals(userPassword)) {
					return 1;  // 입력받은 아이디 값이 DB에 저장된 데이터라면 1 return
					
					} else {
						return 0;  // 비밀번호 틀렸을 경우 
					}
				} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		
		return -1;  // 아이디 틀렸을 경우 
	}
	
	public String findUserName(String userID) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		String userName = null;
		query.append("select userName from member_table where userID = ?");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userName = rs.getString("userName");
				return userName;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 사용자의 지역 이름 가져오기
		public String findUserCity(String userID) {
			System.out.println(userID);
			con = this.getConnection();
			StringBuffer query = new StringBuffer();
			query.append("select userCity from member_table where userID = ?");
			System.out.println(query.toString());
			String userCity = null;
			
			try {
				pstmt = con.prepareStatement(query.toString());
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					System.out.println(rs.getString("userCity"));
					userCity = rs.getString("userCity");
					return userCity;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(con, pstmt, rs);
			}
			System.out.println(userCity);
			return userCity;
			
		}
}
