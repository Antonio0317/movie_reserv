<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*, jspbook.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mb" class="jspbook.MemBeans"/> 
<jsp:useBean id="ml" class="jspbook.MemList"/>

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
		ArrayList<MemList> datas = mb.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("Member.jsp");
	}
	else if(action.equals("delete")) {
		String m_id = (String)request.getParameter("mem");
		ArrayList<ReservInfo> datas = rb.getDBList(m_id);
		mb.deleteDB(m_id);
		for(ReservInfo resv : datas) {
			sb.updateDB_M(resv.getF_id(), resv.getSeatno());
		}
		rb.deleteDB_M(m_id);
		pageContext.forward("Member_Control.jsp?action=list");
	}
	else if(action.equals("select")) {
		String str = (String)request.getParameter("btn");
		if(str.equals("out")) {
			pageContext.forward("Index.jsp");
		}
		else {
			out.println("<script>history.go(-2);</script>");
	
		}
	}
%>