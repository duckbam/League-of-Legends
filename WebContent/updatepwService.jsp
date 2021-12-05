<%@page import="members.MemberDTO"%>
<%@page import="members.MemberDAO"%>
<%@page import="members.MemberCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    	request.setCharacterEncoding("utf-8");
            	String passcheck = request.getParameter("passcheck");
            	String email = session.getAttribute("email").toString();

            	MemberDAO dao = new MemberDAO();
            	MemberDTO dto = dao.selectEmail(email);
            	if(passcheck.equals(dto.getPass())) {
            		out.print("<script>location.href='update.jsp';</script>");
            	} else {
            		out.print("<script>alert('비밀번호가 맞지 않습니다.'); history.back();</script>");
            	}
    %> 
