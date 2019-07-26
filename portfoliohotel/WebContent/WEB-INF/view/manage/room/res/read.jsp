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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>

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
					<h2>객실 예약 관리 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
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
											<%-- <table style="width:300px; padding:0; margin:0;">
												<tbody>
													<%
													for(int i=0; i<list_o.size(); i++) {
													%>
													<tr style="height:30px;">
														<td><%=list_o.get(i).getName() %></td>
														<td>
															<select name="price_opt<%=i %>" class="price_opt">
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
													<%
													}
													%>
												</tbody>
											</table> --%>
										</td>
									</tr>
									<tr>
										<th colspan="2">숙박 고객 한글명</th>
										<td colspan="3"><%=read.getGuest_kname() %></td>
										<th colspan="2">숙박 고객 영문명</th>
										<td colspan="3"><%=read.getGuest_ename() %></td>
									</tr>
									<tr>	
										<th colspan="2">숙박 고객 연락처</th>
										<td colspan="3"><%=read.getGuest_tel() %></td>
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
									<tr>
										<th>예약 상태</th>
										<td><%=read.getRes_state() %></td>
										<th>예약일</th>
										<td><%=read.getBookdate()%></td>
										<th>결제 방법</th>
										<td><%=read.getPay_method() %></td>
										<th>결제 상태</th>
										<td><%=read.getPay_state() %></td>
										<th>결제일</th>
										<%
										if(read.getPaydate() == null) {
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
							
							<input type="hidden" name="cmd" value="edit" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=vo.getTargetURLParam("index", vo, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="/manage/room/res/process"><strong>수정</strong></a>
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