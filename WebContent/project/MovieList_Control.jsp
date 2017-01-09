<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mb" class="jspbook.MovieBeans"/> 
<jsp:useBean id="ml" class="jspbook.MovieList"/>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 영화 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<MovieList> datas = mb.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("Movie_List.jsp");
	}
%>