<%@page import="java.io.File"%>
<%@page import="center.CenterDTO"%>
<%@page import="center.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String nickname = (String)session.getAttribute("nickname");
	String email = (String)session.getAttribute("email");
	if(nickname == null){
		out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='../login.jsp'</script>");
		return;
	}
	
	String n = request.getParameter("num");
	if(n == "" || n == null){
		out.print("<script>location.href='list.jsp';</script>");
		return;
	}
	int num = Integer.parseInt(n);
	CenterDAO dao = new CenterDAO();
	CenterDTO dto = dao.selectNum(num);
	if(dto == null){
		out.print("<script>location.href='list.jsp';</script>");
		return;
	}
	if(email.equals(dto.getEmail()) == false){
		out.print("<script>alert('작성자만 삭제가 가능합니다.'); location.href='list.jsp';</script>");
		return;
	}
	
	String fileName = dto.getFileName();
	String saveFolder = "C:\\care_upfile\\fileStorage\\" + session.getAttribute("nickname");
	
	File f = new File(saveFolder + "/" + fileName);
	
	if(f.exists()){
		f.delete();
	}

	dao.delete(dto);
%>
<script>alert('게시글 삭제 완료'); location.href='list.jsp';</script>