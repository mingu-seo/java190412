<%@page import="manage.reserve.ReserveVO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="manage.doctor.sched.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
SchedVO sched = (SchedVO) request.getAttribute("slist");
ArrayList<ReserveVO> tlist = (ArrayList) request.getAttribute("tlist");
String arg = (String) request.getAttribute("arg");
int argInt = Function.getIntParameter(arg);
%>
<select name="res_hour" >
	<%=CodeUtil.getDoctorScheduleOptionForReserve(argInt, sched.getStart_time(), sched.getEnd_time(), tlist) %>
</select>
