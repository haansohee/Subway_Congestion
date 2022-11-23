<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> join action</title>
</head>
<body>
<%
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	String userCity = request.getParameter("userCity");
	
	System.out.println(userID + userPassword + userName + userEmail + userCity);
	
	// -1 : 서버 오류, 0 : 이미 존재하는 아이디, 1 : 회원가입 성공
/* 	if (userID == "" || userPassword == "" || userName == "" || userEmail == "" || userCity == "지역 선택") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸을 확인해 주십시오.')");
		script.println("history.back()");
		script.println("</script>");
	} else { */
	UserDAO userDAO = new UserDAO();
		
	userDAO.setUserID(userID);
	userDAO.setUserPassword(userPassword);
	userDAO.setUserName(userName);
	userDAO.setUserEmail(userEmail);
	userDAO.setUserCity(userCity);
	
	int result = userDAO.join(userDAO);
		
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('서버 오류.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href='../index.jsp");
		script.println("</script>");
		}
%>
</body>
</html>