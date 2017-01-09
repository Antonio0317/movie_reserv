<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="memb" class="jspbook.MemBeans"/> 
<jsp:useBean id="meml" class="jspbook.MemList"/>
<jsp:useBean id="movieb" class="jspbook.MovieBeans"/>
<jsp:useBean id="moviel" class="jspbook.MovieList"/>
<jsp:setProperty name="meml" property="*"/> 
<% 
	// 파라미터에 따른 요청 처리
	String action = request.getParameter("action");

	// 영화 목록 요청인 경우
	if(action.equals("check")) {
		if(memb.CheckUser(meml)) {
			if(meml.getId().equals("admin")) {
				pageContext.forward("Admin_Control.jsp?action=list");
			}
			else {
				MemList login_data = memb.getDB(meml.getId());
				session.setAttribute("login_data", login_data);
				pageContext.forward("Seat_Control.jsp?action=list");
			}
		}
		else {
			out.println("<script>alert('로그인 실패! 아이디나 비밀번호를 확인해 주세요.'); history.go(-1);</script>");
		}
	}
	else if(action.equals("list")) {
		MovieList movie_data = movieb.getDB((String)request.getParameter("f_id"));
		session.setAttribute("movie_data", movie_data);
		pageContext.forward("Login.jsp");
	}
%>