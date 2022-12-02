<%@page import="com.exam.DAO.MemberDAO"%>
<%@page import="com.exam.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>index</title>
</head>

<script type="text/javascript">
	function btn() {
		alert("로그인이 필요합니다.");
	}
	
	function logout() {
		alert("로그아웃이 되었습니다.");
	}
</script>

<%
	MemberDTO mDTO = new MemberDTO();
	MemberDAO mDAO = MemberDAO.getInstance();
	
	String userID = (String)session.getAttribute("sessionID");
	mDTO.setUserID(userID);
	
	String userName = mDAO.findUserName(userID);
%>

<body>
<div class="container px-4 text-center" style="margin-right:200px;">
  <div class="row gx-5">
    <div class="col">
     <div class="" style="margin-top:400px;">  
     	<div class="d-grid gap-2 col-6 mx-auto">
     	
<% if (userID == null) { %>

		<button class="btn btn-outline-success" type="button" onclick = "btn()"> 전국 날씨 확인하기 </button>
  		<button class="btn btn-outline-warning" type="button" onclick = "btn()"> 내 위치 날씨 확인하기 </button>
  		
<% } else { %>

		<button class="btn btn-outline-success" type="button" onclick = "location.href='CheckAllBoard.do'"> 전국 날씨 확인하기 </button>
  		<button class="btn btn-outline-warning" type="button" onclick = "location.href='CheckMyLocBoard.do?comman'"> 내 위치 날씨 확인하기 </button>
  		
<% }%>
  		
		</div>
     </div>
    </div>
    
<% if (userID == null) { %>

	<div class="col" style="margin-left:100px;">
	    <div class="" style="margin-top:200px; margin-right:100px;">
    	  	<div class="card" style="width: 18rem;">
  			<img src="WEB-INF/image/nomal.png" class="card-img-top" alt="...">
  				<div class="card-body">
    			<h5 class="card-title">비회원</h5>
    			<p class="card-text"> 로그인이 필요합니다. </p>
    			<a href='login.do' class="btn btn-primary"> 로그인하러 가기 </a>
  				</div>
			</div>
      	</div>
    </div>
    
<%} else { %>

	    <div class="col" style="margin-left:100px;">
	    <div class="" style="margin-top:200px; margin-right:100px;">
    	  	<div class="card" style="width: 18rem;">
  			<img src="https://item.kakaocdn.net/do/305a7ceb81d07db332a5e91691a1707d26397d82c8691bdabf557d1536959d9c" class="card-img-top" alt="..."/>
  				<div class="card-body">
    			<h5 class="card-title"> <%= userName %> 님, 안녕하세요. </h5>
    			<p class="card-text">
    			<button class="btn btn-light" type="button" onclick = "location.href='CheckMyLocBoard.do'">
    			 회원님의 지역 날씨 확인하러 가기 </button> </p>
    			<a href="logout.do" class="btn btn-primary" onclick = "logout()"> 로그아웃 </a>
  				</div>
			</div>
      	</div>
    </div>
    
<% } %>

  </div>
</div>


</body>
</html>