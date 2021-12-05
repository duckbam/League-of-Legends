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

    <title>고객지원</title>
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
<%
	request.setCharacterEncoding("utf-8");
	String pn = request.getParameter("pageNumber");
	String mode = request.getParameter("mode");
	String find = request.getParameter("find");
	String data = request.getParameter("data");
	
	CenterDAO dao = new CenterDAO();
	ArrayList<CenterDTO> list = null;
	
	if(mode != null && mode.equals("search")){
		if(data == "" || data == null){
			out.print("<script>alert('검색어를 입력하세요'); history.back(); </script>");
			return;
		}
		list = dao.search(find, data);
	}else{
		list = dao.selectAll();
	}
	
	CenterList cl = new CenterList();
	cl.setPageNumber(pn);
	cl.setTotalRecord(list.size());
%>
	<h1 style="margin-top: 70px;">문의 목록</h1>
		<table style="margin: auto;" class="table table-hover w-50">
		 <tr>
		 	<th class="no">번호</th>
		 	<th class="title">제목</th>
		 	<th class="writer">작성자</th>
		 	<th class="date">날짜</th>
		 	<th class="hit">조회수</th>
		 </tr>
		 <%for(int i = cl.getStart(); i < (cl.getScroll() + cl.getStart()) && i < cl.getTotalRecord(); i++){ 
		 	CenterDTO dto = list.get(i);
		 %>
			 <tr>
			 	<td><%=dto.getNum()%></td>
			 	<td class="subject">	
			 		<a href="view.jsp?num=<%=dto.getNum()%>&pageNumber=<%=cl.getPageNumber()%>"><%=dto.getSubject()%></a>
			 	</td>
			 	<td><%=dto.getNickname()%></td>
			 	<td><%=dto.getWriteTime() %></td>
			 	<td><%=dto.getHit() %></td>
			</tr>
		<%} %>
		</table>
		
		<form style="margin-top: 60px;" action="list.jsp?mode=search" method="post" id="list_form">
			<select name="find">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="nickname">작성자</option>
			</select>
			<input type="text" name="data">
			<input type="submit" value="검색">
		</form>
		
		<div class="clear"></div>
		<div id="page_control" >
			<%
				if(cl.getPageNumber() <= 1){
					out.print("<a href='#'>Prev </a>");
				}else{
					int tmp = cl.getPageNumber() - 1;
					out.print("<a href='list.jsp?pageNumber=" + tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "'>Prev </a>");
				}
			
				for(int i = 1; i <= cl.getTotalPage(); i++){
					if(cl.getPageNumber() == i)
						out.print("<b> " + i + " </b>");
					else
						out.print("<a href='list.jsp?pageNumber=" + i + "&mode=" + mode + "&find=" + find + "&data=" + data + "'> " + i + " </a>");
				}
			
				if(cl.getPageNumber() >= cl.getTotalPage()){
					out.print("<a href='#'>Next </a>");
				}else{
					int tmp = cl.getPageNumber() + 1;
					out.print("<a href='list.jsp?pageNumber=" + tmp + "&mode=" + mode + "&find=" + find + "&data=" + data + "'>Next </a>");
				}
			%>
			
		</div>
		<div id="center_button">
			<a href="write.jsp"> <img src="/lol/img/write.png"> </a>
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