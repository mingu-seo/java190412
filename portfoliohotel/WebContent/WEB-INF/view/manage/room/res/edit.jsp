<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="room.res.*" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>

<%
Room_resVO vo = (Room_resVO)request.getAttribute("vo");
Room_resVO read = (Room_resVO)request.getAttribute("read");
ArrayList<Room_opt_resVO> list_o = (ArrayList<Room_opt_resVO>)request.getAttribute("list_o");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function goSave() {
	return true;
}

$(function() {
	$("#pay_state").change(function() {
		if($("#pay_state option:selected").val() == 1) {
			console.log($("#pay_state option:selected").val());
			$("#paydate_span").text("<%=DateUtil.getToday()%>");
			$("#paydate").val("<%=DateUtil.getToday()%>");
			console.log($("#paydate").val());
		} else if($("#pay_state option:selected").val() != 1) {
			$("#paydate").val("");
		}
	});
});


</script>
<title>관리자 객실 예약 등록</title>
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
					<h2>객실 예약 관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="/manage/room/res/process?no=<%=read.getNo() %>" onsubmit="return goSave();">
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
										<td colspan="3"><%=read.getCheckin() %></td>
										<th colspan="2">체크아웃</th>
										<td colspan="3"><%=read.getCheckout() %></td>
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
										<th colspan="2">숙박 고객 한글명</th>
										<td colspan="3"><input type="text" id="guest_kname" name="guest_kname" class="w90" value="<%=read.getGuest_kname() %>"/></td>
										<th colspan="5"></th>
									</tr>
									<tr>	
										<th colspan="2">숙박 고객 연락처</th>
										<td colspan="3"><input type="text" id="guest_tel" name="guest_tel" class="w90" value="<%=read.getGuest_tel() %>"/></td>
										<th colspan="2">숙박 고객 이메일</th>
										<td colspan="3"><input type="text" id="guest_email" name="guest_email" class="w90" value="<%=read.getGuest_email() %>"/></td>
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
									<tr>
										<th>예약 상태</th>
										<td>
											<select name="res_state" id="res_state">
												<option value="0" <%=Function.getSelected(read.getRes_state(), 0) %>><%=CodeUtil.getResState(0) %></option>
												<option value="1" <%=Function.getSelected(read.getRes_state(), 1) %>><%=CodeUtil.getResState(1) %></option>
											</select>
										</td>
										<th>예약일</th>
										<td><%=sdf.format(read.getBookdate()) %></td>
										<th>결제 방법</th>
										<td>
											<select name="pay_method" id="pay_method">
												<option value="0" <%=Function.getSelected(read.getPay_method(), 0) %>><%=CodeUtil.getPayMethod(0) %></option>
												<option value="1" <%=Function.getSelected(read.getPay_method(), 1) %>><%=CodeUtil.getPayMethod(1) %></option>
											</select>
										</td>
										<th>결제 상태</th>
										<td>
											<select name="pay_state" id="pay_state">
												<option value="0" <%=Function.getSelected(read.getPay_state(), 0) %>><%=CodeUtil.getPayState(0) %></option>
												<option value="1" <%=Function.getSelected(read.getPay_state(), 1) %>><%=CodeUtil.getPayState(1) %></option>
											</select>
										</td>
										<th>결제일</th>
										<%
										if(!read.getPaydate().equals("")) {
										%>
										<td><%=read.getPaydate()%></td>
										<%
										} else {
										%>
										<td><span id="paydate_span" name="paydate_span"></span></td>
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
							<input type="hidden" name="paydate" id="paydate" value=""/>
							<input type="hidden" name="cmd" id="cmd" value="edit" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=vo.getTargetURLParam("read", vo, read.getNo())%>"><strong>취소</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
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