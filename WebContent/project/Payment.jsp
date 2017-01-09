<%@page import="jspbook.MovieList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, jspbook.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<body>
<%=session.getAttribute("r_id") %>
<h2><center>카드 결제</center></h2><hr>
<form name = f1 method = post action = Payment_Control.jsp?action=update>
<table style="border:1px solid black; width:60; height:100px; margin:auto; text-align:center;">
	<tr>
		<th style="border:1px solid black; color:blue;">카드 번호</th>
		<td style="border:1px solid black;"><input type=text name=card_no size = 50 maxlength=19 align=middle></td>
	</tr>
	<tr>
		<th style="border:1px solid black; color:blue;">유효 날짜</th>
		<td style="border:1px solid black;"><input type=text name=invalid_date size = 50 maxlength=19 align=middle></td>
	</tr>
	<tr>
		<th style="border:1px solid black; color:blue;">CVC번호</th>
		<td style="border:1px solid black;"><input type=text name=cvc size = 20 maxlength=3 align=middle></td>
	</tr>
	<tr>
		<th></th>
		<td><button type="submit" name ="id" value="p">결제</button> <button type="submit" name ="id" value="c">취소</button></td>
</table>
</form>
</body>
</html>