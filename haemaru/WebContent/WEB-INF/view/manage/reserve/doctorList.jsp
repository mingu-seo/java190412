<%@ page contentType="text/html; charset=utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="manage.doctor.sched.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<DoctorVO> list = (ArrayList<DoctorVO>) request.getAttribute("list");

%>
<select name="doctor_pk">
<% for (int i=0; i<list.size(); i++) { %>
	<option value="<%=list.get(i).getNo()%>"><%=list.get(i).getName()%></option>
<% } %>
</select>