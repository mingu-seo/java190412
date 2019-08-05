<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="room.res.*" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>

<%
Room_resVO read = (Room_resVO)request.getAttribute("read");
Room_resVO vo = (Room_resVO)request.getAttribute("vo");
ArrayList<Room_opt_resVO> list_o = (ArrayList<Room_opt_resVO>)request.getAttribute("list_o");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function goCancel() {
	var cancel = confirm('예약을 취소하시겠습니까?');
	if(cancel) {
		<%-- document.location.href = "/manage/room/res/process?no=<%=read.getNo()%>&cmd=cancel"; --%>
		$.ajax({
			type : "GET",
			url : "/room/res/cancel?no=<%=read.getNo()%>",
			async : false,
			success : function(data) {
				if (data.trim() == "1") {
					$("#res_state").text("취소");
				}
			}
		});
	} else {
		return false;
	}
}

$(function() {
	console.log('<%=read.getCheckin()%>');
	console.log('<%=read.getCheckout()%>');
	<%
	String arri[] = read.getCheckin().split("-");
	String arro[] = read.getCheckout().split("-");
	%>
	
	var time_in = new Date(<%=arri[0]%>, <%=arri[1]%>, <%=arri[2]%>);
	var time_out = new Date(<%=arro[0]%>, <%=arro[1]%>, <%=arro[2]%>);
	day_stay = (time_out.getTime() - time_in.getTime())/(1000*60*60*24);
	console.log(day_stay);
	console.log(<%=arri[0]%>);
	console.log(<%=arri[1]%>);
	console.log(<%=arri[2]%>);
	console.log(Date());
});

</script>
<title>관리자 객실 예약 상세</title>
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
					<h2>객실 예약 관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
								</colgroup>
								<tbody>
									<tr>
										<th colspan="2">체크인</th>
										<td colspan="3"><%=Function.toDateKorean(read.getCheckin()) %></td>
										<th colspan="2">체크아웃</th>
										<td colspan="3"><%=Function.toDateKorean(read.getCheckout()) %></td>
									</tr>
									<tr>	
										<th colspan="2">객실 종류</th>
										<td colspan="3"><%=read.getRoom_name() %></td>
										<th>숙박 인원</th>
										<th>성인</th>
										<td><%=read.getAdult() %></td>
										<th>어린이</th>
										<td><%=read.getKid() %></td>
									</tr>
									<tr>
										<th colspan="2">추가 옵션</th>
										<td colspan="8">
											<table style="width:500px; padding:0; margin:0;">
												<colgroup>
													<col width="50%"/>
													<col width="10%"/>
													<col width="15%"/>
													<col width="15%"/>
												</colgroup>
												<tbody>
													<%
													for(int i=0; i<list_o.size(); i++) {
													%>
													<tr style="height:30px;">
														<td><%=list_o.get(i).getName() %></td>
														<td><%=list_o.get(i).getCount() %> 개</td>
														<td><%=list_o.get(i).getPrice() %> 원</td>
														<td><%=list_o.get(i).getTotal_price() %> 원</td>
													</tr>
													<%
													}
													%>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<th colspan="2">숙박 고객 성명</th>
										<td colspan="3"><%=read.getGuest_lastname() + read.getGuest_firstname() %></td>
										<td colspan="5"></td>
									</tr>
									<tr>	
										<th colspan="2">숙박 고객 연락처</th>
										<td colspan="3"><%=read.getGuest_tel1() %> - <%=read.getGuest_tel2() %> - <%=read.getGuest_tel3() %></td>
										<th colspan="2">숙박 고객 이메일</th>
										<td colspan="3"><%=read.getGuest_email() %></td>
									</tr>
									<tr>
										<th>객실 금액</th>
										<td style="color:#4C9A2A;"><b><%=read.getRoom_price() %></span></b></td>
										<th>추가 인원 금액</th>
										<td style="color:#4C9A2A;"><b><%=read.getPerson_price() %></span></b></td>
										<th>추가 옵션 금액</th>
										<td style="color:#4C9A2A;"><b><%=read.getOption_price() %></span></b></td>
										<th>세금 및 수수료</th>
										<td style="color:#4C9A2A;"><b><%=read.getCharge_price() %></span></b></td>
										<th>총 결제 금액</th>
										<td style="color:#4C9A2A;"><b><%=read.getTotal_price() %></span></b></td>
									</tr>
									<tr id="res_state_tr">
										<th>예약 상태</th>
										<td><span id="res_state"><%=CodeUtil.getResState(read.getRes_state()) %></span></td>
										<th>예약일</th>
										<td><%=sdf.format(read.getBookdate())%></td>
										<th>결제 방법</th>
										<td><%=CodeUtil.getPayMethod(read.getPay_method()) %></td>
										<th>결제 상태</th>
										<td><%=CodeUtil.getPayState(read.getPay_state()) %></td>
										<th>결제일</th>
										<%
										if(read.getPaydate().equals("") || read.getPaydate().equals("-")) {
										%>
										<td> - </td>
										<%
										} else {
										%>
										<td><%=read.getPaydate() %></td>
										<%
										}
										%>
									</tr>									
								</tbody>
							</table>
							<table>
								<colspan>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
								</colspan>
								<tbody>
									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=vo.getTargetURLParam("index", vo, 0)%>"><strong>목록</strong></a>
									
								</div>
								<div class="btnRight">
									<%
									if(read.getRes_state() == 1) {
									%>
									<a class="btns" onclick="goCancel()"><strong>예약 취소</strong></a>
									<%
									}
									%>
									<a class="btns" href="<%=vo.getTargetURLParam("edit", vo, read.getNo())%>"><strong>수정</strong></a>
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