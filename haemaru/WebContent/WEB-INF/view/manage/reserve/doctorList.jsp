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



<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<colgroup>
		<col class="w5" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">의료진</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="1">등록된 의료진이 없습니다</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getName()%></td>
		</tr>
		<%
			}
			}
		%>

	</tbody>
</table>