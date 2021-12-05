<%@page import="members.MemberDTO"%>
<%@page import="members.MemberDAO"%>
<%@page import="members.MemberCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    	request.setCharacterEncoding("utf-8");
            	String email = request.getParameter("email");
            	String username = request.getParameter("username");
            	String nickname = request.getParameter("nickname");
            	String pass = request.getParameter("pass");
            	String passcheck = request.getParameter("passcheck");

            	MemberCheck mc = new MemberCheck();
            	boolean check = mc.emailCheck(email);
            	if (check == false) {
            		out.print("<script>alert('이메일의 형식으로 다시 입력해주세요.'); history.back();</script>");
            		return;
            	}

            	check = mc.pwEquals(pass, passcheck);
            	if (check == false) {
            		out.print("<script>alert('비밀번호 확인이 맞지 않습니다. 다시 한 번 확인해주세요.'); history.back();</script>");
            		return;
            	}

            	MemberDAO dao = new MemberDAO();
            	MemberDTO checkDTO = dao.selectEmail(email);
            	if (checkDTO != null) {
            		out.print("<script>alert('이미 가입하신 이메일입니다.'); history.back();</script>");
            		return;
            	}
            	
            	checkDTO = dao.selectNickname(nickname);
            	if (checkDTO != null) {
            		out.print("<script>alert('존재하는 닉네임입니다.'); history.back();</script>");
            		return;
            	}
            	
            	MemberDTO dto = new MemberDTO();
            	dto.setEmail(email);
            	dto.setUsername(username);
            	dto.setNickname(nickname);
            	dto.setPass(pass);
            	dao.insert(dto);
    %> 
<script>alert('회원가입이 완료되었습니다.'); location.href='index.jsp';</script>

