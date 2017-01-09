<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="movie_data" scope="session" class="jspbook.MovieList"/>
<jsp:useBean id="login_data" scope="session" class="jspbook.MemList"/>

<jsp:useBean id="sb" class="jspbook.SeatBeans"/> 
<jsp:useBean id="si" class="jspbook.SeatInfo"/>

<jsp:useBean id="rb" class="jspbook.ReservBeans"/> 
<jsp:useBean id="ri" class="jspbook.ReservInfo"/>
<jsp:setProperty property="*" name="ri"/>
<%
	String action = request.getParameter("action");
	
	if(action.equals("list")) {
		ArrayList<ReservInfo> datas = rb.getDBList(login_data.getId());
		request.setAttribute("datas", datas);
		pageContext.forward("Reserve.jsp");
	}
	else if(action.equals("insert")){
		int no = Integer.parseInt((String)session.getAttribute("seat_no"));
		rb.insertDB(rb.Calc_resv_id(), login_data.getId(), movie_data.getId(), movie_data.getName(), movie_data.getDate(), no);
		pageContext.forward("Reserve_Control.jsp?action=list");
	}
	else if(action.equals("select")) {
		String tmp = request.getParameter("resv");
		if(tmp.substring(0, 1).equals("d")) {
			//upate
			int seat_num = Integer.parseInt(tmp.substring(1));
			ReservInfo resv = new ReservInfo();
			resv = rb.getDB(seat_num);
			sb.updateDB(resv.getSeatno(), resv.getF_id(), 1);
			
			//delete
			int id = Integer.parseInt(tmp.substring(1));
			rb.deleteDB_R(id);
				
			pageContext.forward("Reserve_Control.jsp?action=list");
		} else {
			session.setAttribute("r_id", tmp.substring(1));
			pageContext.forward("Payment_Control.jsp?action=list");
		}
	}
%>