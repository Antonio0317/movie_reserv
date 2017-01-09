<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mb" class="jspbook.MovieBeans"/> 
<jsp:useBean id="ml" class="jspbook.MovieList"/>

<jsp:useBean id="sb" class="jspbook.SeatBeans"/> 
<jsp:useBean id="si" class="jspbook.SeatInfo"/>

<jsp:useBean id="rb" class="jspbook.ReservBeans"/> 
<jsp:useBean id="ri" class="jspbook.ReservInfo"/>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 영화 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<MovieList> datas = mb.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("Admin.jsp");
	}
	else if(action.equals("delete")) {
		String str = (String)request.getParameter("movie");
		int movie_num = Integer.parseInt(str);
		mb.deleteDB(movie_num);
		sb.deleteDB(movie_num);
		rb.deleteDB(movie_num);
		pageContext.forward("Admin_Control.jsp?action=list");
	}
	else if(action.equals("select")) {
		String str = (String)request.getParameter("btn");
		if(str.equals("insert")) {
			pageContext.forward("Film_Control.jsp?action=list");
		}
		else if(str.equals("member")){
			pageContext.forward("Member_Control.jsp?action=list");
		}
		else {
			pageContext.forward("Index.jsp");
		}
	}
%>