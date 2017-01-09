<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert_film</title>
</head>
<body>
<h2><center>Insert Film</center></h2><hr>
<form name=f1 method=post action=Film_Control.jsp?action=set>
<table style="border:1px solid black; margin:auto; width:50%; height:300px; text-align:center; align:center">
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">Title</th>
		<td style="border:1px solid black;"><input type=text name=title size = 50 maxlength=20></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">Age</th>
		<td style="border:1px solid black;"><input type=text name=age size = 50 maxlength=3></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">Total seat</th>
		<td style="border:1px solid black;"><input type=text name=seat size = 50 maxlength=1></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">Date</th>
		<td style="border:1px solid black;"><input type=text name=date size = 50 maxlength=20></td>
	</tr>
	<tr>
		<th></th>
		<td><input type=submit value="승인"> <input type=reset value="초기화"></td>
	</tr>
</table>
</form>
</body>
</html>