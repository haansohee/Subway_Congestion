<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br><br><hr><br><br>

<div class="container">
<div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        참고 자료
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <strong>API </strong> <a href = "https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15084084"">공공데이터포털</a>의 초단기실황을 사용하였다. 초단기실황은 매시간 30분에 생성되고, 10분마다 최신 정보로 업데이트된다.
        예를 들어, 00시 기준으로 00시 30분에 자료가 생성되고, API 제공 시간은 00:40 이후이다. <br><br>
        Weather Information 사이트의 날씨 정보는 현재 시각의 1시간 전 40분의 정보로 제공된다. 예를 들어, 사용자가 15시 20분에 사이트에 접속하였다면, 해당 사용자에게 제공되는 것은 14시 40분의 날씨 정보이다. 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        벤치마킹 사이트
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <strong>사이트</strong> <a href = "https://weather.com/ko-KR/weather/today/l/37.55,126.97?par=apple_widget"> IBM </a>, 개인 노트북의 OS에서 지원되고 있는 날씨 정보 사이트를 참고하였다. <br>
        날씨 정보를 비교할 땐 <a href = "https://www.weather.go.kr/w/index.do"> 기상청 날씨누리</a>의 정보와 비교하였다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        202144020 한소희
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
        <strong>겨울</strong>이 찾아오면서 일교차가 심한 날도 있고, 일기예보와는 달리 갑자기 비도 내리기에 한번 날씨 정보를 알려 주는 사이트를 개발해 보고 싶었다. 미숙하고 불완전한 점은 많지만, 내가 할 수 있는 선에서 많은 노력을 심어 개발하였기에 뿌듯하다.
        어려웠었던 점이 있었다면, 우선 첫 번째는 API를 활용하는 것, 그리고 두 번째는 위경도를 x, y좌표로 변환하는 것이었다. API를 이번 프로젝트를 통해 처음 활용한 것이어서 어려운 부분들이 많았다. API를 JSON으로 파싱하는 것, 파싱한 것들을 웹 페이지로 불러오는 것 등
        어려운 부분들이 많았다. 처음 접해 보는 것들이 많아서 힘들었지만, 이렇게 하나씩 배워가며 프로젝트를 진행할 수 있어서 뜻깊었다.
      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>