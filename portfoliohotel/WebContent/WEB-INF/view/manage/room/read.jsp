<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%
RoomVO param = (RoomVO)request.getAttribute("vo");
RoomVO read = (RoomVO)request.getAttribute("read");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
$(function() {
	$("#delBtn").click(function() {
		goDelete();
	});
});
	
function goDelete() {
	var del = confirm ('삭제하시겠습니까?');
	if (del){
		document.location.href = "/manage/room/process?no=<%=read.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	}
	
</script>
<title>관리자 객실 상세</title>
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
					<h2>객실 관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
							
								</colgroup>
								<tbody>
									<tr>
										<th>객실 종류</th>
										<td colspan="5"><%=CodeUtil.getRoomName(read.getName())%> [<%=read.getName() %>]</td>
									</tr>
									<tr>
										<th>객실 가격</th>
										<td colspan="2"><%=read.getPrice() %></td>
										<th>객실 수량</th>
										<td colspan="2"><%=read.getCount() %></td>
									</tr>
									<tr>
										<th>성인(기본정원)</th>
										<td colspan="2"><%=read.getAdult() %></td>
										<th>어린이(기본정원)</th>
										<td colspan="2"><%=read.getKid() %></td>
									</tr>
									<tr>
										<th scope="row" rowspan="2"><label for="">객실 이미지</label></th>
										<td>
											<% if (read.getImage1() != null && !"".equals(read.getImage1())) { %>
											<img src="/upload/room/<%=read.getImage1()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage2() != null && !"".equals(read.getImage2())) { %>
											<img src="/upload/room/<%=read.getImage2()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage3() != null && !"".equals(read.getImage3())) { %>
											<img src="/upload/room/<%=read.getImage3()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage4() != null && !"".equals(read.getImage4())) { %>
											<img src="/upload/room/<%=read.getImage4()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage5() != null && !"".equals(read.getImage5())) { %>
											<img src="/upload/room/<%=read.getImage5()%>" width="270px" height="auto"/>
											<% } %>
										</td>
									</tr>
									<tr>
										<td>
											<% if (read.getImage6() != null && !"".equals(read.getImage6())) { %>
											<img src="/upload/room/<%=read.getImage6()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage7() != null && !"".equals(read.getImage7())) { %>
											<img src="/upload/room/<%=read.getImage7()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage8() != null && !"".equals(read.getImage8())) { %>
											<img src="/upload/room/<%=read.getImage8()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage9() != null && !"".equals(read.getImage9())) { %>
											<img src="/upload/room/<%=read.getImage9()%>" width="270px" height="auto"/>
											<% } %>
										</td>
										<td>
											<% if (read.getImage10() != null && !"".equals(read.getImage10())) { %>
											<img src="/upload/room/<%=read.getImage10()%>" width="270px" height="auto"/>
											<% } %>
										</td>
									</tr>
									<tr>
										<th>객실 소개</th>
										<td colspan="5"><%=read.getInstruction() %></td>
									</tr>
									<tr>
										<th>체크인 시간</th>
										<td colspan="2"><%=read.getCheckin_time() %></td>
										<th>체크아웃 시간</th>
										<td colspan="2"><%=read.getCheckout_time() %></td>
									</tr>
									<tr>
										<th>객실 위치</th>
										<td colspan="5"><%=read.getLocation() %></td>
									</tr>
									<tr>
										<th>객실 전망</th>
										<td colspan="2"><%=read.getLandscape() %></td>
										<th>객실 타입</th>
										<td colspan="2"><%=read.getType() %></td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="<%=param.getTargetURLParam("edit", param, read.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
									</div>
								</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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