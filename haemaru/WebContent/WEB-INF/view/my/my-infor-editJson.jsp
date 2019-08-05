<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
	MemberVO mdata = (MemberVO)request.getAttribute("data");
%>
	{
		"no":"<%=mdata.getNo() %>",
		"email":"<%=mdata.getEmail2() %>",
		"pw":"<%=mdata.getPw() %>",
		"name":"<%=mdata.getName() %>",
		"birth":"<%=mdata.getBirth() %>",
		"tel":"<%=mdata.getTel2() %>"+"<%=mdata.getTel3() %>"
	}
