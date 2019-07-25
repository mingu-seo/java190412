<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="member.*"%>  
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<MypettVO> list = (ArrayList<MypettVO>) request.getAttribute("list");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<colgroup>
		<col class="w15" />
		<col class="w10" />
		<col class="w10" />
		<col class="w10" />
		<col class="w10" />
		<col class="w15" />
		<col class="" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="first">이미지</th>
			<th scope="col">이름</th>
			<th scope="col">나이</th>
			<th scope="col">성별</th>
			<th scope="col">종류</th>
			<th scope="col">접종현황</th>
			<th scope="col" class="last">메모</th>
		</tr>
	</thead>
	<tbody>
	<%
	if(list.size() == 0) {
	%>
		<tr>
			<td colspan="7">등록된 반려동물이 없습니다.</td>
		</tr>
	<%
	} else {
		for (int i=0; i<list.size(); i++) {
	%>
		<tr>
			<td><img src ="/upload/mypet/<%=list.get(i).getMypet_image()%>" width="40px" height="40px"></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getAge() %></td>
			<td><%=list.get(i).getGender() %></td>
			<td><%=list.get(i).getBreed() %></td>
			<td><%=list.get(i).getVac() %></td>
			<td><%=list.get(i).getMemo() %></td>
		</tr>
	<%
		}
	}
	%>
	</tbody>
</table>