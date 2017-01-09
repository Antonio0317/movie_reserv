<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mb" class="jspbook.MovieBeans"/> 
<jsp:useBean id="ml" class="jspbook.MovieList"/>

<jsp:useBean id="sb" class="jspbook.SeatBeans"/> 
<jsp:useBean id="si" class="jspbook.SeatInfo"/>

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 영화 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<MovieList> datas = mb.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("Film.jsp");
	}
	else if(action.equals("set")) {
		String title = (String)request.getParameter("title");
		String age = (String)request.getParameter("age");
		String seat = (String)request.getParameter("seat");
		String date = (String)request.getParameter("date");
		if(title.equals("")) {
			out.println("<script>alert('title을 입력해주세요'); history.go(-1);</script>");
		}
		else if(age.equals("")) {
			out.println("<script>alert('age을 입력해주세요'); history.go(-1);</script>");
		}
		else if(seat.equals("")) {
			out.println("<script>alert('seat을 입력해주세요'); history.go(-1);</script>");
		}
		else if(date.equals("")) {
			out.println("<script>alert('date을 입력해주세요'); history.go(-1);</script>");
		} 
		else {
			int n = mb.Calc_movie_id();
			MovieList m = new MovieList();
			SeatInfo s = new SeatInfo();
			m.setAge(Integer.parseInt(age));
			m.setDate(date);
			m.setSeat(Integer.parseInt(seat));
			m.setName(title);
			m.setId(n);
			mb.insertDB(m);
			s.setF_id(n);
			s.setS_id(n);
			if(1<=Integer.parseInt(seat)) {
				s.setS1(1);
			}
			if(2<=Integer.parseInt(seat)) {
				s.setS2(1);
			}
			if(3<=Integer.parseInt(seat)) {
				s.setS3(1);
			}
			if(4<=Integer.parseInt(seat)) {
				s.setS4(1);
			}
			if(5<=Integer.parseInt(seat)) {
			s.setS5(1);
			}
			if(6<=Integer.parseInt(seat)) {
				s.setS6(1);
			}
			if(7<=Integer.parseInt(seat)) {
				s.setS7(1);
			}
			if(8<=Integer.parseInt(seat)) {
				s.setS8(1);
			}
			if(9<=Integer.parseInt(seat)) {
				s.setS9(1);
			}
			sb.insertDB(s);
			pageContext.forward("Admin_Control.jsp?action=list");
		}
	}
%>