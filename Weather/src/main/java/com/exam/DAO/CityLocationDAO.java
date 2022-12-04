package com.exam.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.exam.DTO.CityLocationDTO;
import com.exam.DTO.MemberDTO;

public class CityLocationDAO {
	
	private static CityLocationDAO cDAO;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	private CityLocationDAO() {
		
	}
	
	public static synchronized CityLocationDAO getInstance() {
		if (cDAO == null) {
			cDAO = new CityLocationDAO();
		}
		return cDAO;
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
	
	// 사용자의 지역 위경도 가져오기
	public ArrayList<String> findCityLoc(String userCity) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList location = new ArrayList();  // 0번째 : 위도, 1번째 : 경도 
		
		System.out.println("회원의 지역 : " + userCity);
		
		query.append("select latitude, longitude from city_table where userCity = ?");
		
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, userCity);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				location.add(0, rs.getString("latitude"));
				location.add(1, rs.getString("longitude"));
				
				return location;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		 
		return location;
	}

}