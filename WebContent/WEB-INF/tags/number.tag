<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="color" %>
<%@ attribute name="size" type="java.lang.Integer" %>
<FONT color="${color}">
<%
	for(int cnt=0; cnt<size; cnt++) {
		out.print("-");
	}
%>

</FONT><BR>