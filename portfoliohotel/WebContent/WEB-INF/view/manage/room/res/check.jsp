<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="room.*" %>

<%
ArrayList<HashMap> map_c = (ArrayList<HashMap>)request.getAttribute("map_c");
ArrayList<RoomVO> list_r = (ArrayList<RoomVO>)request.getAttribute("list_r");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>예약 가능 객실 체크</title>
</head>
<body>
	<select name="room_pk" id="room_pk">
	<%
	for (int i=0; i<map_c.size(); i++) {
	%>
		<%
		if(Integer.parseInt(String.valueOf(map_c.get(i).get("res_count"))) < 10) {
		%>
		<option value="<%=map_c.get(i).get("no")%>" data-price="<%=list_r.get(i).getPrice()%>"
				data-adult="<%=list_r.get(i).getAdult()%>" data-kid="<%=list_r.get(i).getKid()%>"
				data-name="<%=list_r.get(i).getName()%>">
			<%=map_c.get(i).get("name")%>
		</option>
		<%
		}
		%>
	<%
	}
	%>
	</select>
</body>
</html>