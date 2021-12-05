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
	
	String email = session.getAttribute("email").toString();
	String pass = request.getParameter("pass");
	String passcheck = request.getParameter("passcheck");

	MemberCheck mc = new MemberCheck();
	boolean check = mc.pwEquals(pass, passcheck);
	if(check == false){
		out.print("<script>alert('비밀번호 확인이 일치하지 않습니다.'); history.back();</script>");
		return;
	}
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectEmail(email);
	if(dto.getPass().equals(pass)) {
		dao.delete(email);
		session.invalidate();
		out.print("<script>alert('회원 탈퇴가 완료되었습니다. 지금까지 이용해주셔서 감사합니다.'); location.href='index.jsp';</script>");
	} else {
		out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
	}
%>