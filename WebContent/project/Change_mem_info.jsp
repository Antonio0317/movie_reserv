<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="login_data" scope="session" class="jspbook.MemList"/>

<script language="javascript">
function checkNumber(check_form){
    var numPattern = /([^0-9])/;
    var numPattern = check_form.value.match(numPattern);
    if(numPattern != null){
        alert!("숫자만 입력해 주세요!");
        check_form.value = "";
        check_form.focus();
        return false;
    }
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
</head>
<h2><center>회원정보 수정</center></h2><hr>
<form name=f1 method=post action=Change_mem_info_control.jsp?action=check>
<table style="border:1px solid black; margin:auto; width:50%; height:300px; text-align:center; align:center">
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">ID</th>
		<td style="border:1px solid black;"><input type=text disabled name=id size = 50 maxlength=20 value = <%=login_data.getId() %>></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">비밀번호</th>
		<td style="border:1px solid black;"><input type=password name=pw1 size = 50 maxlength=12 value=<%=login_data.getPw1() %>></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">비밀번호 확인</th>
		<td style="border:1px solid black;"><input type=password name=pw2 size = 50 maxlength=20 value=<%=login_data.getPw1() %>></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">이름</th>
		<td style="border:1px solid black;"><input type=text name=name size = 50 maxlength=20 value = <%=login_data.getName() %>></td>
	</tr>
	<tr>
		<th style="border:1px solid black; text-align:center; width:30%;">나이</th>
		<td style="border:1px solid black;"><input type=text onchange="checkNumber(this.form.elements['age'])" name=age size = 50 maxlength=3 value=<%=login_data.getAge() %>></td>
	</tr>
	<tr>
		<th></th>
		<td><input type=submit value="승인"> <input type=reset value="초기화"></td>
	</tr>
</table>
</form>
</body>
</html>