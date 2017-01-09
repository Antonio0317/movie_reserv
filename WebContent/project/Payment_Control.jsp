<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="rb" class="jspbook.ReservBeans"/> 
<jsp:useBean id="ri" class="jspbook.ReservInfo"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 영화 목록 요청인 경우
	if(action.equals("list")) {
		pageContext.forward("Payment.jsp");
	}
	else if(action.equals("update")) {
		String tmp = (String)request.getParameter("id");
		String str = (String)session.getAttribute("r_id");
		int reserv_id = Integer.parseInt(str);
		if(tmp.equals("p")) {
			rb.updateDB(reserv_id);
			pageContext.forward("Reserve_Control.jsp?action=list");
		}
		else {
			out.println("<script>history.go(-2);</script>");
		}
	}
%>