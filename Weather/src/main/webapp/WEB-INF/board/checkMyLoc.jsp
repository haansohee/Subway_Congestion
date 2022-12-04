<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.exam.DTO.MemberDTO" %>
<%@ page import = "com.exam.DAO.MemberDAO" %>
<%@ page import = "com.exam.DTO.CityLocationDTO" %>
<%@ page import = "com.exam.DAO.CityLocationDAO" %>
<%@ page import = "com.exam.API.*" %>
<jsp:include page="/WEB-INF/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	
	ArrayList<String> cityLoc = cDAO.findCityLoc(userCity);
	
	System.out.println(sdf.format(date) + hour + "시");
	System.out.println(userName +"님의 지역 : " + userCity);
	System.out.println("지역 위치 : " + cityLoc);
	
	double lat = Double.parseDouble(cityLoc.get(0));
	double lon = Double.parseDouble(cityLoc.get(1));
	
	WeatherAPI api = new WeatherAPI();
	GpsTransfer gps = new GpsTransfer(lat, lon);
	
	gps.transfer(gps, 0);
	int latitude = (int)Math.round(gps.getxLat());
	int longitude = (int)Math.round(gps.getyLon());
	
	String xLat = Integer.toString(latitude);
	String yLon = Integer.toString(longitude);
	
	System.out.println(xLat + yLon);
	
	api.getAPI(xLat, yLon);
	
	String temp = null;
	
	for (int i = 0; i < api.getCategory.size(); i++) {
		if (api.getCategory.get(i).equals("기온")) {
			temp = (api.getValue.get(i)) + "℃";
		}
	}
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
    			<p class="card-text"><%=today %> &nbsp; <%= hour %>:00 KST 기준</p>
    			<p class="card-text" style="text-align:left;"> <%= temp %></p>
  			</div>
	</div>	
</div>
<!-- //        T1H	기온	℃
//        RN1	1시간 강수량	mm
//        UUU	동서바람성분	m/s
//        VVV	남북바람성분	m/s
//        REH	습도	%
//        PTY	강수형태	코드값
//        VEC	풍향	deg
//        WSD	풍속	m/s -->


</body>
</html>