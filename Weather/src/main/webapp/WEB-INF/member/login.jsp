<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

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
	}
</script>

<form name = "frm" action="login.do" method="post" onsubmit="return checkValue()" >
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="userID">
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" name="userPassword">
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Sign in</button>
</form>


<c:if test="${loginResult == 1 }">
		<script>
			alert("회원님, 안녕하세요.");
			location.href='../main.jsp';
		</script>
	</c:if>
	<c:if test="${loginResult == 0 || loginResult == -1 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다");
			history.back();
		</script>	
	</c:if>

</body>
</html>