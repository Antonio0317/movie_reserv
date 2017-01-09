<%@page import="jspbook.MovieList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, jspbook.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seat list</title>
</head>
<jsp:useBean id="data" scope="request" class="jspbook.SeatInfo"/>
<body>
<h2><center>좌석 정보 리스트</center></h2><hr>
<form name = f1 method = post action = Seat_Control.jsp?action=update>
<table style="border:1px solid black; width:100%; height:100px; margin:auto; text-align:center;">
	<tr>
		<th style="border:1px solid black; color:blue;">좌석번호</th>
		<th style="border:1px solid black; color:blue;">좌석현황</th>
		<th style="border:1px solid black; color:blue;">예매</th>
	</tr>
	<tr>
		<td>1</td>
		<td><% if(data.getS1() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS1() == 1) { %>
			<button type="submit" name ="seat" value="1">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="1" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>2</td>
		<td><% if(data.getS2() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS2() == 1) { %>
			<button type="submit" name ="seat" value="2">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="2" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>3</td>
		<td><% if(data.getS3() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS3() == 1) { %>
			<button type="submit" name ="seat" value="3">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="3" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>4</td>
		<td><% if(data.getS4() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS4() == 1) { %>
			<button type="submit" name ="seat" value="4">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="4" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>5</td>
		<td><% if(data.getS5() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS5() == 1) { %>
			<button type="submit" name ="seat" value="5">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="5" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>6</td>
		<td><% if(data.getS6() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS6() == 1) { %>
			<button type="submit" name ="seat" value="6">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="6" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>7</td>
		<td><% if(data.getS7() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS7() == 1) { %>
			<button type="submit" name ="seat" value="7">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="7" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>8</td>
		<td><% if(data.getS8() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS8() == 1) { %>
			<button type="submit" name ="seat" value="8">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="8" disabled>영화 예매</button></td>
		<% }%>
	</tr>
	<tr>
		<td>9</td>
		<td><% if(data.getS9() == 1) out.println("예매 가능"); else out.println("예매 불가능"); %></td>
		<td><% if(data.getS9() == 1) { %>
			<button type="submit" name ="seat" value="9">영화 예매</button></td>		
		<% } else {%>
			<button type="submit" name ="seat" value="9" disabled>영화 예매</button></td>
		<% }%>
	</tr>
</table>
</form>
<form name = f2 method = post action = Change_mem_info.jsp?action=list>
	<BR><center><input type=submit value="회원정보 변경"></center>
</form>
<form name = f2 method = post action = Index.jsp>
	<BR><center><input type=submit value="로그아웃"></center>
</form>
</body>
</html>