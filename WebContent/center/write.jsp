<%@page import="center.CenterList"%>
<%@page import="center.CenterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="center.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>문의하기</title>
  </head>
  <style>
      body { padding: 0px; margin: 0px; }
      body {
     font-family: 'Calibri', sans-serif !important
 }

 .mt-100 {
     margin-top: 0px
 }

 .mb-100 {
     margin-bottom: 100px
 }

 .card {
     position: relative;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex;
     -webkit-box-orient: vertical;
     -webkit-box-direction: normal;
     -ms-flex-direction: column;
     flex-direction: column;
     min-width: 0;
     word-wrap: break-word;
     background-color: #fff;
     background-clip: border-box;
     border: 0px solid transparent;
     border-radius: 0px
 }

 .card-body {
     -webkit-box-flex: 1;
     -ms-flex: 1 1 auto;
     flex: 1 1 auto;
     padding: 1.25rem
 }

 .card .card-title {
     position: relative;
     font-weight: 600;
     margin-bottom: 10px
 }

 ul.list-style-none li {
     list-style: none
 }

 ul.list-style-none li a {
     color: #673AB7;
     padding: 8px 0px;
     display: block;
     text-decoration: none
 }

 .m-t-5 {
     margin-top: 5px
 }

 .w-30px {
     width: 30px
 }
    </style>
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
  <body>
  <%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	if(email == null){
		out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='../login.jsp'</script>");
		return;
	}
	%>
   <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <div class="container-fluid">
    <a href="../index.jsp"><img src="/lol/img/logo1.png"></img></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <a class="navbar-brand text-light" href="list.jsp">고객지원</a>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="list.jsp" >문의 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="write.jsp" >문의하기</a>
        </li>
        <form class="d-flex" style="padding-left: 1100px">
			<li class="nav-item dropdown">
         	<a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <% String nickname = session.getAttribute("nickname").toString();%>
            <%=nickname %>
          </a>
          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item text-light" href="../logout.jsp">로그아웃</a></li>
            <li><hr class="dropdown-divider text-light"></li>
            <li><a class="dropdown-item text-light" href="../updatepw.jsp">정보변경</a></li>
            <li><a class="dropdown-item text-light" href="../deletepw.jsp">회원탈퇴</a></li>
          </ul>
        </li>
      </form>
      </ul>
    </div>
  </div>
</nav>
<main style="text-align: center;">
<img src="/lol/img/header.png" style="width: 100%"></img>
<form action="writeService.jsp" method="post" enctype="multipart/form-data">
	<h1 style="margin-bottom: 30px;">문의 하기</h1>
		<div class="line"></div>
		<table id="write_table" style="margin: auto;" class="table table-hover w-50"> 	
			<tr id="write_row1">
				<td class="col1">닉네임</td>
				<td class="col2"><%=session.getAttribute("nickname") %></td>
			</tr>
			
			<tr id="write_row2">
				<td class="col1">제목</td>
				<td class="col2"><input class="form-control" type="text" name="subject"></td>
			</tr>
			
			<tr id="write_row3">
				<td class="col1">내용</td>
				<td class="col2" style="height: 300px;"><textarea wrap="hard" class="form-control h-100" name="content"></textarea></td>
			</tr>
			
			<tr id="write_row4">
				<td class="col1">파일</td>
				<td class="col2"><input class="form-control" type="file" name="uploadFileName"></td>
			</tr>
		</table>
			<input type="image" src="/lol/img/ok.png" style="margin-top: 20px;">
	</form>
</main>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
  </body>
</html>