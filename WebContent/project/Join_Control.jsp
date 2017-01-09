<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mb" class="jspbook.MemBeans"/> 
<jsp:useBean id="ml" class="jspbook.MemList"/>
<jsp:setProperty name="ml" property="*"/> 
<%
	String action = request.getParameter("action");

	if(action.equals("check")) {
		if(ml.getId()==null) {
			out.println(ml.getAge()+"<script>alert('아이디를 입력해주세요.'); history.go(-1);</script>");
		}
		else if(ml.getPw1()==null) {
			out.println("<script>alert('패스워드를 입력해주세요.'); history.go(-1);</script>");
		}
		else if(ml.getPw2()==null) {
			out.println("<script>alert('패스워드 확인을 입력해주세요.'); history.go(-1);</script>");
		}
		else if(ml.getName()==null) {
			out.println("<script>alert('이름을 입력해주세요.'); history.go(-1);</script>");
		}
		else if(ml.getAge()==0) {
			out.println("<script>alert('나이를 입력해주세요.'); history.go(-1);</script>");
		}
		else {
			if(!mb.CheckId(ml.getId())) {
				if(mb.CheckPw(ml.getPw1(), ml.getPw2())) {
					mb.insertDB(ml);
					out.println("<script>alert('성공적으로 가입되었습니다. 다시 로그인 해주세요!'); history.go(-2);</script>");
				}
				else {
					out.println("<script>alert('비밀번호 중복확인에 실패하였습니다.'); history.go(-1);</script>");
				}
			}
			else {
				out.println("<script>alert('중복된 아이디가 있습니다.'); history.go(-1);</script>");
			}
		}
	}
	else if(action.equals("list")) {
		pageContext.forward("Join.jsp");
	}
%>