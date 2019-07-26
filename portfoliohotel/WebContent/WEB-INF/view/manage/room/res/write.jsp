<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="room.res.*" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>

<%
Room_resVO vo = (Room_resVO)request.getAttribute("vo");
RoomVO rvo = (RoomVO)request.getAttribute("rvo");
ArrayList<RoomVO> list = (ArrayList<RoomVO>)request.getAttribute("list");
ArrayList<Room_optVO> list_o = (ArrayList<Room_optVO>)request.getAttribute("list_o");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function goSave() {
	if($("#checkin").val() == ""){
		alert('체크인 날짜를 입력하세요.');
		$("#checkin").focus();
		return false;
	}
	if($("#checkout").val() == ""){
		alert('체크인 날짜를 입력하세요.');
		$("#checkout").focus();
		return false;
	}
	if($("#room_pk").val() == ""){
		alert('객실 종류를 선택하세요.');
		$("#room_pk").focus();
		return false;
	}
	if($("#adult").val() == ""){
		alert('숙박인원(성인)을 선택하세요.');
		$("#adult").focus();
		return false;
	}
	if($("#kid").val() == ""){
		alert('숙박인원(어린이)을 선택하세요.');
		$("#kid").focus();
		return false;
	}
	if($("#guest_kname").val() == ""){
		alert('숙박고객 정보를 입력하세요.');
		$("#guest_kname").focus();
		return false;
	}
	if($("#guest_ename").val() == ""){
		alert('숙박고객 정보를 입력하세요.');
		$("#guest_ename").focus();
		return false;
	}
	if($("#guest_tel").val() == ""){
		alert('숙박고객 정보를 입력하세요.');
		$("#guest_tel").focus();
		return false;
	}
	if($("#guest_email").val() == ""){
		alert('숙박고객 정보를 입력하세요.');
		$("#guest_email").focus();
		return false;
	}
	return true;
}

var day_stay = 0;
var price_stay = 0; //숙박일수 금액
var price_opt = 0; //추가옵션 금액
var price_person = 0; //추가인원 금액

function calculate() {
	var price_sum = price_stay + price_opt + price_person;
	var price_charge = price_sum * 0.1;
	var price_total = price_sum + price_charge;
	
	$("#charge_price_span").text(price_charge);
	$("#charge_price").val(Number(price_charge));
	$("#total_price_span").text(price_total);
	$("#total_price").val(Number(price_total));
	
}

$(function(){	
	$("#room_pk").change(function() {
		price_stay = $("#room_pk option:selected").data("price") * day_stay;
		$("#room_price_span").text(price_stay); // span 태그에 표시
		calculate();
		$("#room_price").val(Number(price_stay)); // hidden에 value 넣기
		$("#room_name").val($("#room_pk option:selected").data("name")); // hidden에 value 넣기
	});
	
	$(".price_opt").change(function() {
		price_opt = 0;
		$(".price_opt").each(function(idx) {
			if ($(".price_opt").eq(idx).find("option:selected").val() != "") {
				price_opt += $(".price_opt").eq(idx).find("option:selected").data("price_opt");
				$("#count").val($(".price_opt").eq(idx).find("option:selected").val());
			}
		});
		$("#option_price_span").text(price_opt);
		calculate();
		$("#option_price").val(Number(price_opt)); // hidden에 value 넣기
	});
	
	$("#adult, #kid").change(function() {
		var adult_add = 0;
		var kid_add = 0;
		if($("#adult option:selected").data("num") > $("#room_pk option:selected").data("adult")){
			adult_add = ($("#adult option:selected").data("num") - $("#room_pk option:selected").data("adult"))*100000;
			$("#adult_add").text("[추가인원 "+ ($("#adult option:selected").data("num") - $("#room_pk option:selected").data("adult")) +"]");
		} else { 
			adult_add = 0;
		}
		if($("#kid option:selected").data("num") > $("#room_pk option:selected").data("kid")){
			kid_add = ($("#kid option:selected").data("num") - $("#room_pk option:selected").data("kid"))*(100000*0.7);
			$("#kid_add").text("[추가인원 "+ ($("#kid option:selected").data("num") - $("#room_pk option:selected").data("kid")) +"]");
		} else {
			kid_add = 0;
		}
		price_person = adult_add + kid_add;
		$("#person_price_span").text(price_person);
		calculate();
		$("#person_price").val(Number(price_person)); // hidden에 value 넣기
	});
	
	$("#checkin, #checkout").change(function() {
		var arr_in = $("#checkin").val().split("-");
		var arr_out = $("#checkout").val().split("-");
		var time_in = new Date(arr_in[0], arr_in[1], arr_in[2]);
		var time_out = new Date(arr_out[0], arr_out[1], arr_out[2]);
		day_stay = (time_out.getTime() - time_in.getTime())/(1000*60*60*24);
	});
	
	$("#pay_state").change(function() {
		if($("#pay_state option:selected").val() == 1) {
			$("#paydate_span").text("<%=DateUtil.getToday() %>");
			$("#paydate").val("<%=DateUtil.getToday() %>");
		} else {
			$("#paydate_span").text(" - ");
			$("#paydate").val("");
		}
	})
	
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
					<h2>객실 예약 관리 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" onsubmit="return goSave();">
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
										<td colspan="3"><input type="date" id="checkin" name="checkin"/></td>
										<th colspan="2">체크아웃</th>
										<td colspan="3"><input type="date" id="checkout" name="checkout"/></td>
									</tr>
									<tr>	
										<th colspan="2">객실 종류</th>
										<td colspan="3">
											<select name="room_pk" id="room_pk">
												<option value="">객실 선택</option>
												<%
												for(int i=0; i<list.size(); i++) {
												%>
												<option value="<%=list.get(i).getNo()%>" data-price="<%=list.get(i).getPrice()%>" 
														data-adult="<%=list.get(i).getAdult()%>" data-kid="<%=list.get(i).getKid()%>"
														data-name="<%=list.get(i).getName()%>">
														<%=list.get(i).getName() %>
												</option>
												<%
												}
												%>
											</select>
										</td>
										<th>숙박 인원</th>
										<th>성인</th>
										<td>
											<select name="adult" id="adult">
												<option value="0">0명</option>
												<%
												for(int i=1; i<=5; i++) {
												%>
												<option value="<%=i %>" data-num="<%=i%>"><%=i %>명</option>
												<%
												} 
												%>
											</select>
											<b><span id="adult_add" style="color:#4C9A2A;"></span></b>
										</td>
										<th>어린이</th>
										<td>
											<select name="kid" id="kid">
												<option value="0">0명</option>
												<%
												for(int i=1; i<=5; i++) {
												%>
												<option value="<%=i %>" data-num="<%=i%>"><%=i %>명</option>
												<%
												} 
												%>
											</select>
											<b><span id="kid_add" style="color:#4C9A2A;"></span></b>
										</td>
									</tr>
									<tr>
										<th colspan="2">추가 옵션</th>
										<td colspan="8">
											<table style="width:300px; padding:0; margin:0;">
												<tbody>
													<%
													for(int i=0; i<list_o.size(); i++) {
													%>
													<tr style="height:30px;">
														<td><%=list_o.get(i).getName() %></td>
														<td>
															<select name="price_opt" class="price_opt" data-opt="<%=list_o.get(i).getNo() %>">
																<option value="">옵션 선택</option>
																<%
																for(int j=0; j<5; j++) {
																%>
																<option value="<%=j%>" data-price_opt="<%=list_o.get(i).getPrice()*j%>"><%=j %></option>
																<%
																}
																%>
															</select>
														</td>
													</tr>
													<input type="hidden" name="option_pk" value="<%=list_o.get(i).getNo()%>"/>
													<input type="hidden" name="name" value="<%=list_o.get(i).getName()%>"/>
													<input type="hidden" name="price" value="<%=list_o.get(i).getPrice() %>"/>
													<input type="hidden" name="count" id="count" value=""/>
													
													<%
													}
													%>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<th colspan="2">숙박 고객 한글명</th>
										<td colspan="3"><input type="text" id="guest_kname" name="guest_kname" class="w90"/></td>
										<th colspan="2">숙박 고객 영문명</th>
										<td colspan="3"><input type="text" id="guest_ename" name="guest_ename" class="w90"/></td>
									</tr>
									<tr>	
										<th colspan="2">숙박 고객 연락처</th>
										<td colspan="3"><input type="text" id="guest_tel" name="guest_tel" class="w90"/></td>
										<th colspan="2">숙박 고객 이메일</th>
										<td colspan="3"><input type="text" id="guest_email" name="guest_email" class="w90"/></td>
									</tr>
									<tr>
										<th>객실 금액</th>
										<td style="color:#4C9A2A;"><b><span id="room_price_span"></span></b></td>
										<th>추가 인원 금액</th>
										<td style="color:#4C9A2A;"><b><span id="person_price_span"></span></b></td>
										<th>추가 옵션 금액</th>
										<td style="color:#4C9A2A;"><b><span id="option_price_span"></span></b></td>
										<th>세금 및 수수료</th>
										<td style="color:#4C9A2A;"><b><span id="charge_price_span"></span></b></td>
										<th>총 결제 금액</th>
										<td style="color:#4C9A2A;"><b><span id="total_price_span"></span></b></td>
									</tr>
									<tr>
										<th>예약 상태</th>
										<td><%=CodeUtil.getResState(1) %></span></td>
										<th>예약일</th>
										<td><%=DateUtil.getToday() %></td>
										<th>결제 방법</th>
										<td>
											<select name="pay_method" id="pay_method">
												<option value="0" selected><%=CodeUtil.getPayMethod(0) %></option>
												<option value="1"><%=CodeUtil.getPayMethod(1) %></option>
											</select>
										</td>
										<th>결제 상태</th>
										<td>
											<select name="pay_state" id="pay_state">
												<option value="0" seleted><%=CodeUtil.getPayState(0) %></option>
												<option value="1"><%=CodeUtil.getPayState(1) %></option>
											</select>
										</td>
										<th>결제일</th>
										<td><span id="paydate_span" name="paydate_span"></span></td>
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
							
							<input type="hidden" name="cmd" value="write" />
							<input type="hidden" name="room_price" id="room_price" value="" />
							<input type="hidden" name="option_price" id="option_price" value="" />
							<input type="hidden" name="person_price" id="person_price" value="" />
							<input type="hidden" name="charge_price" id="charge_price" value="" />
							<input type="hidden" name="total_price" id="total_price" value="" />
							<input type="hidden" name="room_name" id="room_name" value="" />
							<input type="hidden" name="paydate" id="paydate" value="" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=vo.getTargetURLParam("index", vo, 0)%>"><strong>목록</strong></a>
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