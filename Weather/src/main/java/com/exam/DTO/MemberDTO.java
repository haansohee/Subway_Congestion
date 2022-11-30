// 테이블의 데이터를 저장할 MemberDTO 클래스를 com.exam.DTO 패키지에 생성.
package com.exam.DTO;

public class MemberDTO {
//	private String userID, userPassword, userName, userEmail, userCity;
	private String userID;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userCity;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
}
