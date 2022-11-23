<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript">
	// 아이디와 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!frm.userID.value) {
			alert("아이디를 입력하세요.");
			frm.userID.focus();
			return false;
		}
		
		if (!frm.userPassword.value) {
			alert("비밀번호를 입력하세요.");
			frm.userPassword.focus();
			return false;
		}
		
		if (!frm.userName.value) {
			alert("이름을 입력하세요.");
			frm.userName.focus();
			return false;
		}
		
		if (!frm.userEmail.value) {
			alert("이메일을 입력하세요.");
			frm.userEmail.focus();
			return false;
		}
		
		if (!frm.useCity.value) {
			alert("지역을 선택하세요.");
			frm.userCity.focus();
			return false;
		}
	}
	
	function goHome() {
		location.href="../index.jsp";
	}
</script>

<body>

<h3 style = "text-align:center; margin-top:10px;"> Join the (플젝이름) </h3>

<div class="col align-self-center">

<form name = "frm" class="row g-3" action="./join_Action.jsp" onsubmit="return checkValue()">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">ID</label>
    <input type="text" class="form-control" id="inputEmail4" name="userID">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control" id="inputPassword4" name="userPassword">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Name</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="홍길동" name="userName">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">Email</label>
    <input type="Email" class="form-control" id="inputAddress2" placeholder="abc@example.com" name="userEmail">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState" class="form-select" name="userCity" onchange="selectBoxChange();">
      <option selected disabled value = "none">지역 선택</option>
      <option value="인천">인천</option>
      <option value="서울">서울</option>
      <option value="경기도">경기도</option>
      <option value="강원도">강원도</option>
      <option value="충청남도">충청남도</option>
      <option value="충청북도">충청북도</option>
      <option value="세종">세종</option>
      <option value="대전">대전</option>
      <option value="경상북도">경상북도</option>
      <option value="대구">대구</option>
      <option value="전라북도">전라북도</option>
      <option value="전라남도">전라남도</option>
      <option value="경상남도">경상남도</option>
      <option value="광주">광주</option>
      <option value="울산">울산</option>
      <option value="부산">부산</option>
      <option value="제주도">제주도</option>
    </select>
  </div>
  <div class="col-12">
  <!-- <input type = "submit" value = "sign in"> -->
   <button type="submit" class="btn btn-primary">Sign in</button>
   <button type="submit" class="btn btn-secondary" onclick = "goHome()">Cancle</button>
  </div>
</form>
</div>
</head>
</body>
</html>