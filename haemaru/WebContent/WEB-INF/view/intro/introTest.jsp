<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="manage.doctor.*"%>
<%
	DoctorVO param = (DoctorVO) request.getAttribute("vo");
	ArrayList<DoctorVO> list = (ArrayList) request.getAttribute("list");
%>
<%@ include file="/WEB-INF/view/include/headHtml.jsp"%>
<div class="tab-info clear">
	<% for (int i = 0; i < list.size(); i++) {%>
		<% if (list.get(i).getPosition() == 1) { %>
			<div class="staff1">
		<% } else if (list.get(i).getPosition() == 2) { %>
				<div class="staff1 staff2">
			<% } else if (list.get(i).getPosition() == 3) { %>
				<div class="staff1 staff3">
				<% } else { %>
					<div class="staff1 staff4">
					<% 
					}
					%>
						<img src="/upload/doctor/<%=list.get(i).getDoc_image()%>">
						<h4><%=list.get(i).getDepartment()%>/<%=list.get(i).getPosition()%></h4>
						<h5><%=list.get(i).getName()%></h5>
						<a href="#">MORE</a>
					</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
</div>
