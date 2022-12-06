<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.DAO.*" %>
<%@ page import="com.exam.DTO.*" %>
<%@ page import="com.exam.API.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/header.jsp"/>
<meta charset="UTF-8">
<title>전국 지역 확인하기</title>
</head>

<body>
<br><hr>
<figure class="text-center">
  <figcaption class="blockquote-footer">
   안녕하세요.
  </figcaption>
  <blockquote class="blockquote">
    <p>오늘 전국 날씨 </p>
    
  </blockquote>
</figure>

<%
	CityLocationDTO cDTO = new CityLocationDTO();
	CityLocationDAO cDAO = CityLocationDAO.getInstance();
	
	Map<String, ArrayList<String>> cityInform = new HashMap<>();  // 지역과 위경도를 저장할 map	
	ArrayList<String> city = cDAO.findCity();
	
	System.out.println(city);  // [강원도, 경기도, 경상남도, 경상북도, 광주, 대구, 대전, 부산, 서울, 세종, 울산, 인천, 전라남도, 전라북도, 제주도, 충청남도, 충청북도]
	
	// 각 지역과 지역의 위도 경도 map 에 넣기.
	ArrayList<String> cityLoc;
	for (int i = 0; i < city.size(); i++) {
		System.out.println(city.get(i));
		cityLoc = cDAO.findCityLoc(city.get(i));
		
		cityInform.put(city.get(i), cityLoc);
		System.out.println(cityLoc);
	}
	
	System.out.println(cityInform);
	
	for (int i = 0; i < city.size(); i++) {
		ArrayList<String> latAndlon = cityInform.get(city.get(i));  // 지역 키 값 뽑아 와서 위경도 담기
		/* System.out.println(latAndlon); */
		
		double lat = Double.parseDouble(latAndlon.get(0));  // 위도와 
		double lon = Double.parseDouble(latAndlon.get(1));  // 경도를 따로 저장해서 
		
		GpsTransfer gps = new GpsTransfer(lat, lon);  // 위경도 -> x,y 좌표 변경해 준다. 
		
		gps.transfer(gps, 0);  // 변경 
		
		int latitude = (int)Math.round(gps.getxLat());  // 변경한 값들을 반올림 해 주고 
		int longitude = (int)Math.round(gps.getyLon());
		
		String xLat = Integer.toString(latitude);  // 다시 String 형으로 묶어준 다음 
		String yLon = Integer.toString(longitude);
		latAndlon.set(0, xLat);
		latAndlon.set(1, yLon);  // 좌표값으로 변경된 것으로 리스트 수정.
		
		cityInform.put(city.get(i), latAndlon);  // 해쉬 맵도 수정 
	}
	
	WeatherAPI api = new WeatherAPI();  // API 
	
	out.println("<div class=\"container\">");
	
	for (int i = 0; i < city.size(); i++) {		
		ArrayList<String> latAndlon = cityInform.get(city.get(i));  // 지역 키 값 뽑아 와서 x, y 좌표 담기
		String xLat = latAndlon.get(0);
		String yLon = latAndlon.get(1);
		
		api.getAPI(xLat, yLon);
		
		/* String t1h = api.category.get(3);
		String pty0 = api.category.get(0); */
		
		 // 0번째에는 category, 1번째에는 value
		ArrayList T1H = new ArrayList();
		ArrayList PTY = new ArrayList();
		
		T1H.add(0, "기온");
		T1H.add(1, api.value.get(3));
		PTY.add(0, "강수 형태");
		PTY.add(1, api.value.get(0));
		

		String pty1 = (String)PTY.get(1);
		String pty = null;

			switch(pty1) {
				case "0" :
					pty = "없음"; /* <!-- 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7) --> */
					break;
				case "1" :
					pty = "비";
					break;	
	 			case "2" :
	 				pty = "눈/비";
					break;
				case "3" :
					pty = "눈";
					break;	
 				case "5" :
 					pty = "빗방울";
					break;
 				case "6" :
 					pty = "빗방울 날림";
					break;
 				case "7":
 					pty = "눈 날림";
					break;
		
				default:
					break;
	
		}
		
		System.out.println(PTY);
		
		
		
		out.println("<p class = \"lead\">" + city.get(i) + "의 날씨 </p> <br>");
		out.println("<p class = \"lead\">" + T1H.get(0) +"은 " + T1H.get(1) +"도입니다.");
		out.println(PTY.get(0) +"은 " + pty + "입니다.</p> <br><br>");
	
	}
	
	out.println("</div>");
	
%>


 

</body>
</html>