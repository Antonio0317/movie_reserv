<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="login_data" scope="session" class="jspbook.MemList"/>
<jsp:useBean id="mb" class="jspbook.MemBeans"/> 
<jsp:useBean id="ml" class="jspbook.MemList"/>
<jsp:useBean id="memb" class="jspbook.MemBeans"/> 
<jsp:useBean id="meml" class="jspbook.MemList"/>
<jsp:setProperty name="ml" property="*"/> 
<%
	String action = request.getParameter("action");
	
	if(action.equals("list")) {
		pageContext.forward("Change_mem_info.jsp");
	}
	else if(action.equals("check")) {
		if(ml.getPw1()==null) {
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
			if(mb.CheckPw(ml.getPw1(), ml.getPw2())) {
					mb.updateDB(login_data.getId(), ml);
					MemList login_data_new = memb.getDB(login_data.getId());
					session.setAttribute("login_data", login_data_new);
					out.println("<script>alert('성공적으로 변경되었습니다.'); history.go(-2);</script>");
			}
			else {
				out.println("<script>alert('비밀번호 중복확인에 실패하였습니다.'); history.go(-1);</script>");
			}
		}
	}
%>