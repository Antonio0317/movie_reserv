<%@page import="jspbook.MovieList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, jspbook.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie_list</title>
</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="sb" class="jspbook.SeatBeans"/> 
<jsp:useBean id="si" class="jspbook.SeatInfo"/>
<body>
<h2><center>상영 영화 리스트</center></h2><hr>
<form name = f1 method = post action = Login_Control.jsp?action=list>
<table style="border:1px solid black; width:100%; height:100px; margin:auto; text-align:center;">
	<tr>
		<th style="border:1px solid black; color:blue;">타이틀</th>
		<th style="border:1px solid black; color:blue;">관람가</th>
		<th style="border:1px solid black; color:blue;">총 좌석 수</th>
		<th style="border:1px solid black; color:blue;">남은 좌석 수</th>
		<th style="border:1px solid black; color:blue;">상영기간</th>
		<th style="border:1px solid black; color:blue;">예매</th>
	</tr>
			<%
				for(MovieList ml : (ArrayList<MovieList>)datas) {
			%>
			  <tr>
				<td><%=ml.getName() %></td>
				<td><%=ml.getAge() %></td>
				<td><%=ml.getSeat() %></td>
				<td><%=sb.remain_seat(ml.getId()) %>
				<td><%=ml.getDate() %></td>
				<td><% if(sb.remain_seat(ml.getId()) != 0) { %>
					<button type="submit" name =f_id value="<%=ml.getId()%>">선택</button></td>		
				<% } else {%>
					<button type="submit" name =f_id value="<%=ml.getId()%>" disabled>선택</button></td>
				<% }%>
			  </tr>
			 <%
				}
			 %>
</table>
</form>
</body>
</html>