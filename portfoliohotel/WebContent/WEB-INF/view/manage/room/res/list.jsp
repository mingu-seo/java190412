<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="room.res.*" %>
<%
ArrayList<HashMap> map = (ArrayList<HashMap>)request.getAttribute("map");
Room_resVO vo = (Room_resVO)request.getAttribute("vo");
int month = 0;

// "2019-07"
String yearMonth = (String)request.getAttribute("yearMonth");
String nextMonth = (String)request.getAttribute("nextMonth");
String prevMonth = (String)request.getAttribute("prevMonth");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<style>
th {
	padding : 13px 2px;
	font-size : 13px;
	border-left : 1px solid #cccdd0;
	border-bottom : 1px solid #cccdd0;
}

td {
	padding : 8px 2px;
}

.exist {
	color : #0000ff; 
	font-weight : bold;
}

.full {
	color : #ff0000;
	font-weight : bold;
}

.last {
	border-right : 1px solid #cccdd0;
}

#month {
	font-weight : bold;
	font-size : 20px;
}
</style>
<script>
function goPrev() {
	<%
	month = vo.getMonth_want() - 1;
	%>
	$("#frm").submit();
}

function goNext() {
	<%
	month = vo.getMonth_want() + 1;
	%>
	$("#frm").submit();
}

</script>
<title>관리자 객실 예약 목록</title>
</head>
<body>
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>객실 예약 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<table style="width:50%; margin:0 auto;"> 
								<colgroup>
									<col width="10%"/>
									<col width="18%"/>
									<col width="18%"/>
									<col width="18%"/>
									<col width="18%"/>
									<col width="18%" class="last"/>
								</colgroup>
								<tr>
									<th colspan="6" id="month">
										<a href="list?yearMonth=<%=prevMonth%>"><img name="prev" id="prev" src="/manage/img/goLeft.png" style="float:left;"/></a>
										<%=yearMonth %>월
										<a href="list?yearMonth=<%=nextMonth%>"><img name="next" id="next" src="/manage/img/goRight.png" style="float:right;"/></a>
									</th>
								</tr>
								<tr>
									<th>날짜</th>
									<th>Namsan Pool Deluxe room</th>
									<th>Namsan Pool Premier Suite</th>
									<th>Namsan Presidential Suite</th>
									<th>Spa Sanctuary Suite</th>
									<th>Portfolio Pool Presidential Suite</th>
								</tr>
								<%
								if(map.size() > 0) {
									for(int i=0; i<map.size(); i++) {
										HashMap data = map.get(i);
								%>
								<tr>
									<td><%=data.get("today") %></td>
									
									<%
									if(Integer.parseInt(String.valueOf(data.get("room1"))) == 0) {
									%>
									<td><%=data.get("room1") %></td>
									<%
									} else if(Integer.parseInt(String.valueOf(data.get("room1"))) < 10){
									%>
									<td class="exist"><%=data.get("room1") %></td>
									<%
									} else {
									%>
									<td class="full"><%=data.get("room1") %></td>
									<%
									}
									if(Integer.parseInt(String.valueOf(data.get("room2"))) == 0) {
									%>
									<td><%=data.get("room2") %></td>
									<%
									} else {
									%>
									<td class="exist"><%=data.get("room2") %></td>
									<%
									}
									if(Integer.parseInt(String.valueOf(data.get("room3"))) == 0) {
									%>
									<td><%=data.get("room3") %></td>
									<%
									} else {
									%>
									<td class="exist"><%=data.get("room3") %></td>
									<%
									}
									if(Integer.parseInt(String.valueOf(data.get("room4"))) == 0) {
									%>
									<td><%=data.get("room4") %></td>
									<%
									} else {
									%>
									<td class="exist"><%=data.get("room4") %></td>
									<%
									}
									if(Integer.parseInt(String.valueOf(data.get("room5"))) == 0) {
									%>
									<td><%=data.get("room5") %></td>
									<%
									} else {
									%>
									<td class="exist"><%=data.get("room5") %></td>
									<%
									}
									%>
								</tr>	
								<%
									}
								}
								%>
							</table>
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>