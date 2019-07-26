<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypet.*" %>
<%
MypetVO data = (MypetVO)request.getAttribute("data");
%>
	{
		"name":"<%=data.getName() %>",
		"age":"<%=data.getAge() %>",
		"gender":"<%=data.getGender() %>",
		"breed":"<%=data.getBreed() %>",
		"vac":"<%=data.getVac() %>"
	}
