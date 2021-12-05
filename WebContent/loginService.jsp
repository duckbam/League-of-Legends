<%@page import="members.MemberDTO"%>
<%@page import="members.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

MemberDAO dao = new MemberDAO();
MemberDTO checkDTO = dao.selectEmail(email);
if (checkDTO != null && checkDTO.getPass().equals(pass)) {
	session.setAttribute("email", email);
	session.setAttribute("username", checkDTO.getUsername());
	session.setAttribute("nickname", checkDTO.getNickname());
	session.setAttribute("pass", checkDTO.getPass());
	out.print("<script>alert('" + checkDTO.getNickname() + "님 환영합니다.'); location.href='index.jsp';</script>");
} else {
	out.print("<script>alert('이메일 혹은 비밀번호가 잘못되었습니다.');history.back();</script>");
}
%>