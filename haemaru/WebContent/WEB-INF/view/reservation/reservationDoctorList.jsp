<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="manage.doctor.sched.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<DoctorVO> list = (ArrayList<DoctorVO>) request.getAttribute("list");
%>

	<%
		for (int i = 0; i < list.size(); i++) {
			SchedVO sched = list.get(i).getSlist();
			ArrayList<ReserveVO> tlist = list.get(i).getTlist();
	%>
<div class="doctor-box clear">
	<div>
		<img src="/upload/doctor/<%=list.get(i).getDoc_image()%>">
	</div>
	<div>
		<p>
			<span>담당의사</span><%=list.get(i).getName()%>
			/
			<%=CodeUtil.getDoctorPositionName(list.get(i).getPosition())%>
		</p>
		<p>
			<span>진료과목</span>
			<%=CodeUtil.getDoctorDepartmentName(list.get(i).getDepartment())%>
		</p>
		<p><span>예약가능시간</span>
		<select name="res_hour" class="major-select">
			<%=CodeUtil.getDoctorScheduleOptionForReserve(0, sched.getStart_time(), sched.getEnd_time(), tlist) %>
		</select>
        <div class="doc-btn" data-doctorpk="<%=list.get(i).getNo()%>">
            <a href="#">예약하기</a>
        </div>
        <img src="/img/icon/doctor<%=list.get(i).getGender()==1?"2":"1" %>.jpg">
	</div>
</div>
		<%
			}
		%>
