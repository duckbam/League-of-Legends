<%@page import="members.MemberDTO"%>
<%@page import="members.MemberDAO"%>
<%@page import="members.MemberCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("email");
	if(id == null){
		out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='login.jsp'</script>");
		return;
	}
	
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	String nickname = request.getParameter("nickname");
	String pass = request.getParameter("pass");
	String passcheck = request.getParameter("passcheck");

	MemberCheck mc = new MemberCheck();
	boolean check = mc.pwEquals(pass, passcheck);
	if(check == false){
		out.print("<script>alert('비밀번호 확인이 일치하지 않습니다.'); history.back();</script>");
		return;
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO checkDTO = dao.selectNickname(nickname);
	if (checkDTO != null) {
		out.print("<script>alert('존재하는 닉네임입니다.'); history.back();</script>");
		return;
	}
	
	MemberDTO dto = new MemberDTO();
	dto.setEmail(email);
	dto.setUsername(username);
	dto.setNickname(nickname);
	dto.setPass(pass);
	
	dao.update(dto);
	session.invalidate();
%>
<script>alert('회원 수정이 완료되었습니다. 다시 로그인해주세요.'); location.href='index.jsp';</script>