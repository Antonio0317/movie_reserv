<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="movie_data" scope="session" class="jspbook.MovieList"/>
<jsp:useBean id="login_data" scope="session" class="jspbook.MemList"/>

<jsp:useBean id="sb" class="jspbook.SeatBeans"/> 
<jsp:useBean id="si" class="jspbook.SeatInfo"/>
<jsp:setProperty name="si" property="*"/> 
<% 
	String action = request.getParameter("action");
	int film = movie_data.getId();
	SeatInfo data = sb.getDB(film);
	if(action.equals("list")) {
		if(login_data.getAge() >= movie_data.getAge()) {
			request.setAttribute("data", data);
			pageContext.forward("Seat.jsp");
		}
		else {
			out.println("<script>alert('나이제한에 맞지 않습니다.'); location.href='Index.jsp'</script>");
		}
	}
	else if(action.equals("update")) {	
		String tmp = request.getParameter("seat");
		int id = Integer.parseInt(tmp);
		int i=0;
		switch (id) {
			case 1:
				i=data.getS1();
				break;
			case 2:
				i=data.getS2();
				break;
			case 3:
				i=data.getS3();
				break;
			case 4:
				i=data.getS4();
				break;
			case 5:
				i=data.getS5();
				break;
			case 6:
				i=data.getS6();
				break;
			case 7:
				i=data.getS7();
				break;
			case 8:
				i=data.getS8();
				break;
			case 9:
				i=data.getS9();
				break;
		}
		if(i==1) {
			sb.updateDB(id, data.getS_id(), 0);
			session.setAttribute("seat_no", tmp);
			pageContext.forward("Reserve_Control.jsp?action=insert");
		}else {
			out.println("<script>alert('이미 예약된 좌석입니다.'); history.go(-1);</script>");
		}
	}
%>