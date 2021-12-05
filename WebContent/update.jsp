<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>정보변경</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<style>
body {
	background-image: url('../images/back2.png');
}
</style>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("email");
	if(id == null){
		out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='login.jsp'</script>");
		return;
	}
	%>
<form class="login100-form validate-form" action="updateService.jsp"method="post">
	<div class="limiter">
		<div class="container-login101">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
					<span class="login100-form-title p-b-55"> 정보 변경 </span>
					
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="이메일을 입력해주세요!">
						<input class="input100" type="text" name="email" placeholder="이메일" value="<%=session.getAttribute("email")%>" readonly>
						<span class="focus-input100"></span> <span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="변경할 이름을 입력해주세요!">
						<input class="input100" type="text" name="username"
							placeholder="변경할 이름" maxlength='5' value="<%=session.getAttribute("username")%>"> <span class="focus-input100"></span> <span
							class="symbol-input100"> <span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="변경할 닉네임을 입력해주세요!">
						<input class="input100" type="text" name="nickname"
							placeholder="변경할 닉네임" maxlength='10' value="<%=session.getAttribute("nickname")%>"> <span class="focus-input100"></span> <span
							class="symbol-input100"> <span class="lnr lnr-envelope"></span>
						</span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="변경할 비밀번호를 입력하세요!">
						<input class="input100" type="password" name="pass"
							placeholder="변경할 비밀번호" maxlength='20'> <span class="focus-input100"></span>
						<span class="symbol-input100"> <span class="lnr lnr-lock"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="변경할 비밀번호를 확인하세요!">
						<input class="input100" type="password" name="passcheck"
							placeholder="비밀번호 확인" maxlength='20'> <span class="focus-input100"></span>
						<span class="symbol-input100"> <span class="lnr lnr-lock"></span>
						</span>
					</div>

					<div class="container-login100-form-btn p-t-25">
						<button class="login100-form-btn" class="submit_mem">
							정보 변경</button>
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>
			</div>
		</div>
	</div>
	</div>
	</form>
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>