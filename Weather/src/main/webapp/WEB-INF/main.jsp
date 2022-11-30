<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.exam.DTO.MemberDTO" %>
<%@ page import = "com.exam.DAO.MemberDAO" %>
<jsp:include page="./header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>main</title>
</head>
<body>
<%
	MemberDTO mDTO = new MemberDTO();
	MemberDAO mDAO = MemberDAO.getInstance();
	
	String userID = (String)session.getAttribute("sessionID");
	mDTO.setUserID(userID);
	
	String userName = mDAO.findUserName(userID);

	/* System.out.println(mDTO.getUserID()); */
	
	String cp = request.getContextPath();
	System.out.println(cp);
	pageContext.setAttribute("cp", cp);
	
%>

<div class="container px-4 text-center" style="margin-right:200px;">
  <div class="row gx-5">
    <div class="col">
     <div class="" style="margin-top:400px;">  <!-- p-3 border bg-light -->
     	<div class="d-grid gap-2 col-6 mx-auto">
  		<button class="btn btn-outline-success" type="button" onclick = "location.href='${cp}/CheckBoardController?cmd=checkAll'"> 전국 날씨 확인하기 </button>
  		<button class="btn btn-outline-warning" type="button" onclick = "location.href='${cp}/CheckBoardController?cmd=checMyLoc'"> 내 위치 날씨 확인하기 </button>
		</div>
     </div>
    </div>
    <div class="col" style="margin-left:100px;">
	    <div class="" style="margin-top:200px; margin-right:100px;">
    	  	<div class="card" style="width: 18rem;">
  			<img src="./image/test.png" class="card-img-top" alt="...">
  				<div class="card-body">
    			<h5 class="card-title"> <%= userName %> 님, 안녕하세요. </h5>
    			<p class="card-text">
    			<button class="btn btn-light" type="button">
    			 회원님의 지역 날씨 확인하러 가기 </button> </p>
    			<a href="logout.do" class="btn btn-primary"> 로그아웃 </a>
  				</div>
			</div>
      	</div>
    </div>
  </div>
</div>
</body>
</html>