<%@page import="jspbook.MovieList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, jspbook.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Reservation</title>
</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<body>
<h2><center>영화 결재 페이지</center></h2><hr>
<form name = f1 method = post action = Reserve_Control.jsp?action=select>
<table style="border:1px solid black; width:100%; height:100px; margin:auto; text-align:center;">
	<tr>
		<th style="border:1px solid black; color:blue;">영화 제목</th>
		<th style="border:1px solid black; color:blue;">상영 기간</th>
		<th style="border:1px solid black; color:blue;">예 약 일</th>
		<th style="border:1px solid black; color:blue;">좌석 번호</th>
		<th style="border:1px solid black; color:blue;">예약 상황</th>
		<th style="border:1px solid black; color:blue;">결제 및 취소</th>
	</tr>
			<%
				for(ReservInfo ri : (ArrayList<ReservInfo>)datas) {
			%>
			  <tr>
				<td><%=ri.getF_name() %></td>
				<td><%=ri.getF_date() %></td>
				<td><%=ri.getR_date() %></td>
				<td><%=ri.getSeatno() %></td>
				<td><%=ri.getStatus() %></td>
				<td><% if(ri.getStatus().equals("OK")) { %>
					<button type="submit" disabled name ="resv" value="p<%=ri.getR_id()%>">결제</button>		
					<% } else {%>
					<button type="submit" name ="resv" value="p<%=ri.getR_id()%>">결제</button>
					<% }%> 
					<button type="submit" name ="resv" value="d<%=ri.getR_id()%>">예매내역 삭제</button></td>
			  </tr>
			 <%
				}
			 %>
</table>
</form>
</body>
</html>