<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="member.*"%>  
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<MypetVO> list = (ArrayList<MypetVO>) request.getAttribute("list");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<colgroup>
		<col class="w5" />
		<col class="w10" />
		<col class="" />
		<col class="w10" />
		<col class="w5" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="first">이름</th>
			<th scope="col">나이</th>
			<th scope="col">성별</th>
			<th scope="col">종류</th>
			<th scope="col">접종현황</th>
			<th scope="col" class="last">메모</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<%
	if(list.size() == 0) {
	%>
		<tr>
			<td colspan="4">등록된 반려동물이 없습니다.</td>
		</tr>
	<%
	} else {
		for (int i=0; i<list.size(); i++) {
	%>
		<tr>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getAge() %></td>
			<td><%=list.get(i).getGender() %></td>
			<td><%=list.get(i).getBreed() %></td>
			<td><%=list.get(i).getVac() %></td>
			<td><%=list.get(i).getMemo() %></td>
			<td><input type="button" value="삭제" onclick="delMypet(<%=list.get(i).getNo()%>);"/></td>
		</tr>
	<%
		}
	}
	%>
	</tbody>
</table>