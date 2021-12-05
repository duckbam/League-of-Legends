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

    <title>리그 오브 레전드</title>
  </head>
  <style>
      body { padding: 0px; margin: 0px; }
      .jb-box { width: 100%; height: 100%; overflow: hidden;margin: 0px auto; position: relative; }
      video { width: 100%; }
    </style>
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
  <body>
   <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <div class="container-fluid">
    <a href="index.jsp"><img src="/lol/img/logo1.png"></img></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >게임정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >챔피언</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            새소식
          </a>
          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item text-light" href="#">전체</a></li>
            <li><a class="dropdown-item text-light" href="#">게임 업데이트</a></li>
            <li><a class="dropdown-item text-light" href="#">공지</a></li>
            <li><a class="dropdown-item text-light" href="#">개발자 블로그</a></li>
            <li><a class="dropdown-item text-light" href="#">세계관</a></li>
            <li><a class="dropdown-item text-light" href="#">미디어</a></li>
            <li><a class="dropdown-item text-light" href="#">온라인 스토어</a></li>
            <li><a class="dropdown-item text-light" href="#">E스포츠</a></li>
            <li><a class="dropdown-item text-light" href="#">라이엇 게임즈</a></li>
            <li><a class="dropdown-item text-light" href="#">커뮤니티</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >패치 노트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >다운로드</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >E스포츠</a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            알아보기
          </a>
          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item text-light" href="#">LOL 디스플레이</a></li>
            <li><a class="dropdown-item text-light" href="#">모바일 상점</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >유니버스</a>
        </li>
		 <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="#" >상점</a>
        </li>
		 <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="center/list.jsp" >고객지원</a>
        </li>
        <form class="d-flex" style="padding-left: 700px">
      	<% if(session.getAttribute("email") == null){ %>
        <a class="nav-link active text-light" aria-current="page" href="login.jsp" >로그인</a>
        <button type="button" class="btn btn-info text-light" onclick="location.href='join.jsp'">회원가입</button>
			<%}else{ %>	
			 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <% String nickname = session.getAttribute("nickname").toString();%>
            <%=nickname %>
          </a>
          <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item text-light" href="logout.jsp">로그아웃</a></li>
            <li><hr class="dropdown-divider text-light"></li>
            <li><a class="dropdown-item text-light" href="updatepw.jsp">정보변경</a></li>
            <li><a class="dropdown-item text-light" href="deletepw.jsp">회원탈퇴</a></li>
          </ul>
        </li>
			<%} %>
      </form>
      </ul>
    </div>
  </div>
</nav>
<main>
<div class="jb-box">
      <video muted autoplay loop>
        <source src="/lol/video/video.mp4" type="video/mp4">
        <strong>Your browser does not support the video tag.</strong>
      </video>
    </div>
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