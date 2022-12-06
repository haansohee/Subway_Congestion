<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.exam.DTO.MemberDTO" %>
<%@ page import = "com.exam.DAO.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Header</title>
</head>
<body>

<%
MemberDTO mDTO = new MemberDTO();
MemberDAO mDAO = MemberDAO.getInstance();

String userID = (String)session.getAttribute("sessionID");
mDTO.setUserID(userID);

String userName = mDAO.findUserName(userID);

System.out.println(mDTO.getUserID());

%>	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg bg-light" style = "margin-top:5px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.do" style = "margin-left:50px;">Weather Information</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        <a class="nav-link" href="notice.do">notice</a> <%--  "<%=application.getContextPath()%>/include/top.jsp" --%>
<%
	if(userID == null) {
%>
        <a class="nav-link" href="login.do">Login</a>
        <a class="nav-link" href="join.do">Join</a>
<%	} else {
%>		
		<a class="nav-link" href="logout.do">Logout</a>
		<a class="nav-link disabled"> <%= userName %> 님, 안녕하세요. </a>
<% } %>
        <a class="nav-link disabled"> :) </a>
      </div>
    </div>
  </div>
</nav>

</body>
</html>