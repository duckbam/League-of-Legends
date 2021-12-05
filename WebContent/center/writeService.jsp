<%@page import="center.CenterDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="center.CenterDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
%>
제목 : <%=subject%> <br>
내용 : <%=content%><br><br>
<%
	//C:\java_basic\apache-tomcat-9.0.52\wtpwebapps\care\fileStorage\null
	/* String saveFolder = application.getRealPath("/fileStorage/" + session.getAttribute("id")); */
	String saveFolder = "C:\\lol_upfile\\fileStorage\\" + session.getAttribute("email");
	File dirCheck = new File(saveFolder);
	
	if(dirCheck.exists() == false){
		dirCheck.mkdirs();
	}
	
	String encType ="utf-8";
	int maxSize = 1024 * 1024 * 10; // 10MB
	
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
	subject = multi.getParameter("subject");
	content = multi.getParameter("content");
	String original = multi.getOriginalFileName("uploadFileName");
	String fileName = multi.getFilesystemName("uploadFileName");
	
	out.print("제목 : " + subject + "<br>");
	out.print("내용 : " + content + "<br>");
	
	out.print("원본 파일 이름 : " + original + "<br>");
	out.print("업로드 후 파일 이름 : " + fileName + "<br>");
	
	CenterDTO dto = new CenterDTO();
	dto.setNickname((String)session.getAttribute("nickname"));
	dto.setEmail((String)session.getAttribute("email"));
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setFileName(fileName);
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	dto.setWriteTime(sdf.format(date));
	dto.setHit(0);
	CenterDAO dao = new CenterDAO();
	dao.insert(dto);
	
%>
<script>alert('게시글 작성 완료'); location.href='list.jsp';</script>














