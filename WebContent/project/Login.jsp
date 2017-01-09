<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<%session.setAttribute("f_id", request.getParameter("id")); %>
<body>
	<form name=f1 method=post action=Login_Control.jsp?action=check>
	<h2><center>로그인</center></h2><hr>
	<center>아 이 디  : <input type=text name=id size = 20 maxlength=12></center><BR>
	<center>비밀번호 : <input type=password name=pw1 size = 20 maxlength=20></center><BR>
	<center><input type=submit value="로그인"> <input type="reset" value="초기화"></center><BR>
	</form>
	<form name=f2 method=post action=Join_Control.jsp?action=list>
	<center><input type=submit value="회원가입"></center>
	</form>
</body>
</html>