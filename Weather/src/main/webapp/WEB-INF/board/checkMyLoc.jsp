<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.exam.DTO.*" %>
<%@ page import = "com.exam.DAO.*" %>
<%@ page import = "com.exam.API.*" %>
<jsp:include page="/WEB-INF/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 지역 날씨 확인하기</title>
</head>
<body>
<%	
	String imgSrc = "";
	
	MemberDTO mDTO = new MemberDTO();
	MemberDAO mDAO = MemberDAO.getInstance();
	CityLocationDTO cDTO = new CityLocationDTO();
	CityLocationDAO cDAO = CityLocationDAO.getInstance();

	String userID = (String)session.getAttribute("sessionID");
	mDTO.setUserID(userID);
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("M월 d일");
	SimpleDateFormat sdf2 = new SimpleDateFormat("M");
	
	String month = sdf2.format(date);  // 현재 무슨 계절인지 확인할 변수 month
	/* String month = "10"; */
	
	LocalTime now = LocalTime.now();
	int hour = now.getHour() - 1;
	
	String today = sdf.format(date);
	String userName = mDAO.findUserName(userID);
	String userCity = mDAO.findUserCity(userID);
	
	ArrayList<String> cityLoc = cDAO.findCityLoc(userCity);
	
	System.out.println(sdf.format(date) + hour + "시");
	System.out.println(userName +"님의 지역 : " + userCity);
	System.out.println("지역 위치 : " + cityLoc);
	
	double lat = Double.parseDouble(cityLoc.get(0));
	double lon = Double.parseDouble(cityLoc.get(1));
	
	WeatherAPI api = new WeatherAPI();  // API 
	
	String xLat = cityLoc.get(0);  // 지역의 x, y 좌표를 가져와서 
	String yLon = cityLoc.get(1);
	
	api.getAPI(xLat, yLon); // 넘겨주기
	
	System.out.println(xLat + yLon);
	
	 // 0번째에는 category, 1번째에는 value
	ArrayList T1H = new ArrayList(); 
	ArrayList RN1 =new ArrayList();
	ArrayList UUU =new ArrayList();
	ArrayList VVV= new ArrayList();
	ArrayList REH =new ArrayList();
	ArrayList PTY = new ArrayList();
	ArrayList VEC = new ArrayList();
	ArrayList WSD = new ArrayList();
	
	for (int i = 0; i < api.category.size(); i++) {
		String search = api.category.get(i);
		switch(search) {
			case "T1H" :
				T1H.add(0, "기온");
				T1H.add(1, api.value.get(i));
				break;
			
			case "RN1" :
				RN1.add(0, "강수량");
				RN1.add(1, api.value.get(i));
				break;
			
			case "UUU" :
				UUU.add(0, "바람성분(EW)");
				UUU.add(1, api.value.get(i));
				break;
				
			case "VVV" :
				VVV.add(0, "바람성분(NS)");
				VVV.add(1, api.value.get(i));
				break;
			
			case "REH" : 
				REH.add(0, "습도");
				REH.add(1, api.value.get(i));
				break;
			
			case "PTY" :
				PTY.add(0, "강수 형태");
				PTY.add(1, api.value.get(i));
				break;
			
			case "VEC":
				VEC.add(0, "풍향");
				VEC.add(1, api.value.get(i));	
				break;
			
			case "WSD":
				WSD.add(0, "풍속");
				WSD.add(1, api.value.get(i));
				break;
			
			default:
				break;
			
		}
	}
		
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
	
	System.out.println(T1H);
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
 	<%
 		if (month.equals("12") || month.equals("1") || month.equals("2")) {
 			imgSrc = "/Weather/image/snow.png";
 		} else if (month.equals("3") || month.equals("4") || month.equals("5")) {
 			imgSrc = "/Weather/image/spring.png";
 		} else if (month.equals("6") || month.equals("7") || month.equals("8")) {
 			imgSrc = "/Weather/image/summer.jpg";
 		} else if (month.equals("9") || month.equals("10") || month.equals("11")) {
 			imgSrc = "/Weather/image/fall.jpg";
 		}
 	%>
  		<img src=<%=imgSrc %> class="card-img" alt="..." style = "height:100px; object-fit:cover;"/>
  			<div class="d-inline card-img-overlay">
    		<h5 class="card-title"> <%= userCity %></h5>
    			<p class="card-text"><%=today %> &nbsp; <%= hour %>:40 KST 기준 <%= T1H.get(1) %> ℃</p>
  			</div>
	</div>	
<!-- 	
//        T1H	기온	℃
//  RN1	1시간 강수량	mm
//  UUU	동서바람성분	m/s
//  VVV	남북바람성분	m/s
//  REH	습도	%
//  PTY	강수형태	코드값 
//없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
//  VEC	풍향	deg
//  WSD	풍속	m/s -->
	
	<br><br><hr>
	<br><br>
	<table class="table">
  	<tbody>
    <tr>
      <th scope="row">기온</th>
      <td><%= T1H.get(1) %> ℃ </td>
      <th scope="row">습도</th>
      <td><%= REH.get(1) %> %</td>
    </tr>
    <tr>
      <th scope="row">강수량</th>
      <td><%= RN1.get(1) %> mm </td>
      <th scope="row">강수 형태</th> 
      <td> <%= pty %> </td>
    </tr>
    <tr>
      <th scope="row">동서바람성분</th>
      <td><%= UUU.get(1) %> m/s</td>
      <th scope="row">풍향</th>
      <td><%= VEC.get(1) %> deg</td>
    </tr>
    <tr>
      <th scope="row">남북바람성분</th>
      <td><%= VVV.get(1) %> m/s</td>
      <th scope="row">풍속</th>
      <td><%= WSD.get(1) %> m/s</td>
    </tr>
  </tbody>
</table>

<div class="row"  style="margin-top:6em;">
  <div class="col-4">
    <div id="list-example" class="list-group">
      <a class="list-group-item list-group-item-action" href="#list-item-1"> 강수형태 </a>
      <a class="list-group-item list-group-item-action" href="#list-item-2"> 풍속 </a>
      <a class="list-group-item list-group-item-action" href="#list-item-3"> 풍향 </a>
      <a class="list-group-item list-group-item-action" href="#list-item-4"> 바람 성분 </a>
    </div>
  </div>
  <div class="col-8">
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
      <h4 id="list-item-1"> 강수 형태 </h4>
      <p>강수 형태는 하늘에서 비가 오는지, 눈이 오는지에 대한 정보예요. 비와 눈 혹은 작은 빗방울이라도 하늘에서 내리지 않는다면, <br>
      	강수 형태는 "없음"이라고 표시됩니다. 자세한 정보는 공지사항(notice) 탭을 클릭 하여 확인해 주세요.  </p>
      <br>
      <h4 id="list-item-2"> 풍속 </h4>
      <p> 풍속 구간(m/s)이 4 미만일 경우, 바람이 약한 것을 의미해요. 연기 흐름에 따라 풍향을 감지할 수 있어요.<br>
      	4 이상 9 미만일 경우에는 바람이 약간 강한 것을 의미해요. 안면에 감촉을 느끼면서 나뭇잎이 조금 흔들리는 정도예요. <br>
      	9 이상 14 미만일 경우에는 바람이 강한 것을 의미해요. 나무 가지와 깃발이 가볍게 흔들리는 수준이에요. <br>
      	14 이상일 경우에는 바람이 매우 강한 것을 의미해요. 먼지가 일고, 작은 나무 전체가 흔들리는 정도예요. </p>
      	<br>
      <h4 id="list-item-3">풍향 </h4>
      <p> 풍향 구간별 표현 단위는 다음과 같습니다. </p>
    
    	<img src = "/Weather/image/windInform.png" style="width:550px; height:200px;">
      <br><br>
      <h4 id="list-item-4"> 바람 성분 </h4>
      <p> 풍속을 동서 성분과 남북 성분으로 나눈 것은 기류가 동쪽으로 이동하고 있는 것인지, 서쪽으로 밀리고 있는 것인지 알고 싶을 때,
      		마찬가지로 기류가 남쪽으로 가고 있는 것인지, 북쪽으로 가고 있는 것인지를 알고 싶을 때 사용하기 위해서입니다. </p>
    </div>
  </div>
</div>

</div>

<!-- //        T1H	기온	℃
//        RN1	1시간 강수량	mm
//        UUU	동서바람성분	m/s
//        VVV	남북바람성분	m/s
//        REH	습도	%
//        PTY	강수형태	코드값 
// 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
//        VEC	풍향	deg
//        WSD	풍속	m/s -->


</body>
</html>