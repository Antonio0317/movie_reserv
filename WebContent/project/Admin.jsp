<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, jspbook.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body>
<form name = f1 method = post action = Admin_Control.jsp?action=select>
<button type="submit" name ="btn" value="insert">Insert Film</button> <button type="submit" name ="btn" value="member">Member Management</button> <button type="submit" name ="btn" value="out">로그아웃</button> 
<hr>
</form>
<form name = f2 method = post action = Admin_Control.jsp?action=delete>
<table style="border:1px solid black; width:100%; height:100px; margin:auto; text-align:center;">
	<tr>
		<th style="border:1px solid black; color:blue;">Title</th>
		<th style="border:1px solid black; color:blue;">Age</th>
		<th style="border:1px solid black; color:blue;">Total seat</th>
		<th style="border:1px solid black; color:blue;">Date</th>
		<th style="border:1px solid black; color:blue;">Operation</th>
	</tr>
			<%
				for(MovieList ml : (ArrayList<MovieList>)datas) {
			%>
			  <tr>
				<td><%=ml.getName() %></td>
				<td><%=ml.getAge() %></td>
				<td><%=ml.getSeat() %></td>
				<td><%=ml.getDate() %></td>
				<td><button type="submit" name ="movie" value="<%=ml.getId()%>">Remove</button> </td>
			  </tr>
			 <%
				}
			 %>
</table>
</form>
</body>
</html>