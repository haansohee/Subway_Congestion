<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.exam.DTO.MemberDTO" %>
<%@ page import = "com.exam.DAO.MemberDAO" %>
<%@ page import = "com.exam.DTO.CityLocationDTO" %>
<%@ page import = "com.exam.DAO.CityLocationDAO" %>
<jsp:include page="/WEB-INF/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
img{
  position: absolute; top:0; left: 0;
  width: 100%;
  height: 100%;
   object-fit: cover; }
</style>
<body>
<%
	MemberDTO mDTO = new MemberDTO();
	MemberDAO mDAO = MemberDAO.getInstance();
	CityLocationDTO cDTO = new CityLocationDTO();
	CityLocationDAO cDAO = CityLocationDAO.getInstance();

	String userID = (String)session.getAttribute("sessionID");
	mDTO.setUserID(userID);
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("M월 d일");
	
	LocalTime now = LocalTime.now();
	
	int hour = now.getHour();
	String today = sdf.format(date);
	String userName = mDAO.findUserName(userID);
	String userCity = mDAO.findUserCity(userID);
	
	System.out.println(sdf.format(date) + hour + "시");
	System.out.println(userName +"님의 지역 : " + userCity);
%>

<br><hr>
<figure class="text-center">
  <figcaption class="blockquote-footer">
   <%= userName %> 님, 안녕하세요.
  </figcaption>
  <blockquote class="blockquote">
    <p>오늘 <%= userCity %>의 날씨 </p>
  </blockquote>
</figure>

<div class="container">
 	<div class="card text-bg-white" style="height:100px; box-shadow: 0 .5rem 1rem rgba(153, 153, 153, 1);">
  		<img src="https://static01.nyt.com/images/2022/01/28/sports/olympics/snow-wind-weather-athletes-1643405866171/snow-wind-weather-athletes-1643405866171-superJumbo-v2.png" class="card-img" alt="..."/>
  			<div class="card-img-overlay">
    		<h5 class="card-title"> <%= userCity %></h5>
    			<p class="card-text"><%=today %> &nbsp; <%= hour %>:00 KST 기준 </p>
  			</div>
	</div>	
</div>




</body>
</html>