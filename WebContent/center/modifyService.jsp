<%@page import="center.CenterDTO"%>
<%@page import="center.CenterDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String n = request.getParameter("num");
	if(n == "" || n == null){
		out.print("<script>location.href='list.jsp';</script>");
		return;
	}
	int num = Integer.parseInt(n);

	String saveFolder = "C:\\lol_upfile\\fileStorage\\" + session.getAttribute("email");
	int maxSize = 1024 * 1024 * 10; // 10MB
	String encType ="utf-8";
	File f = new File(saveFolder);
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, saveFolder, maxSize, encType); 
	
	String nickname = session.getAttribute("nickname").toString();
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String fileName = multi.getFilesystemName("uploadFileName");
/* 	
	out.print("게시글 번호 : " + num + "<br>");
	out.print("제목 : " + subject + "<br>");
	out.print("내용 : " + content + "<br>");
	out.print("업로드 후 파일 이름 : " + fileName + "<br>"); */
	
	CenterDAO dao = new CenterDAO();
	CenterDTO dto = dao.selectNum(num);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setNickname(nickname);
	if(fileName != null)
		dto.setFileName(fileName);

	dao.modify(dto);
%>
<script>alert('게시글 수정 완료'); location.href='list.jsp';</script>

