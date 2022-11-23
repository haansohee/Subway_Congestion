<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/background.css" rel="stylesheet" type="text/css">
<title>index</title>
</head>
<body>

<div class="container px-4 text-center" style="margin-right:200px;">
  <div class="row gx-5">
    <div class="col">
     <div class="" style="margin-top:400px;">  <!-- p-3 border bg-light -->
     	<div class="d-grid gap-2 col-6 mx-auto">
  		<button class="btn btn-outline-success" type="button"> 전국 날씨 확인하기 </button>
  		<button class="btn btn-outline-warning" type="button"> 내 위치 날씨 확인하기 </button>
		</div>
     </div>
    </div>
    <div class="col" style="margin-left:100px;">
	    <div class="" style="margin-top:200px; margin-right:100px;">
    	  	<div class="card" style="width: 18rem;">
  			<img src="..." class="card-img-top" alt="...">
  				<div class="card-body">
    			<h5 class="card-title">비회원</h5>
    			<p class="card-text"> 로그인이 필요합니다. </p>
    			<a href="./member/login.jsp" class="btn btn-primary"> 로그인하러 가기 </a>
  				</div>
			</div>
      	</div>
    </div>
  </div>
</div>

</body>
</html>