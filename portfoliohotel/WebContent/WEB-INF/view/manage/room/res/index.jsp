<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.res.*" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ArrayList<Room_resVO> list = (ArrayList)request.getAttribute("list");
Room_resVO param = (Room_resVO)request.getAttribute("vo");
RoomVO rvo = (RoomVO)request.getAttribute("rvo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			$("#frm").submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}

function goDelete(no) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "/manage/room/process_del?no="+no+"&cmd=delete";
	}
}

function goSearch() {
	$("#searchForm").submit();
}

</script>
<title>관리자 객실 목록</title>
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
							<form name="frm" id="frm" action="process_del" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w10" />
									<col class="w10" />
									<col class="w8" />
									<col class="w20" />
									<col class="w5" />
									<col class="w5" />
									<col class="w10" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">체크인</th> 
										<th scope="col">체크아웃</th> 
										<th scope="col">예약 고객</th> 
										<th scope="col">객실</th> 
										<th scope="col">인원_성인</th> 
										<th scope="col">인원_어린이</th> 
										<th scope="col">예약일</th> 
										<th scope="col"></th> 
									</tr>
								</thead>
								<tbody>
									<%
									String targetUrl = "";
									String topClass = "";
									Room_resVO data;
									
									for (int i=0; i<list.size(); i++) {
										data = list.get(i);
										targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";	
									%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<td><%=data.getNo()%></td>
										<td><%=data.getCheckin() %></td>
										<td><%=data.getCheckout() %></td>
										<td><%=data.getGuest_kname() %></td>
										<td><%=data.getRoom_name() %></td>
										<td><%=data.getAdult() %></td>
										<td><%=data.getKid() %></td>
										<td><%=data.getBookdate() %></td>
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
									</tr>
								<%
										}
								%>
								</tbody>
							</table>
								<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
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