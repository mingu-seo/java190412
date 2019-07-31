<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%@ page import="manage.exhibition.*" %>
<%
TicketVO param = (TicketVO)request.getAttribute("param");
TicketVO vo = (TicketVO)request.getAttribute("vo");
ArrayList<ExhibitionVO> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<style>
	.insert_number {
		width:30px;
	}
</style>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		// 달력
		initCal({id:"displaydate",type:"day",today:"y"});
		initCal({id:"reservedate",type:"day",today:"y"});
		initCal({id:"paydate",type:"day",today:"y"});
		initCal({id:"canceldate",type:"day",today:"y"});
	});
	
	function goSave() {

		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		
		return true;
	}
</script>
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
					<h2>예매 상세- [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="process" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">회원 아이디</label></th>
										<td colspan="3"><%=vo.getId()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">전시관</label></th>
										<td>
											<select name="display_pk">
											<%for(int i = 0; i < list.size(); i++){ %>
												<option value="<%=list.get(i).getNo()%>" <%=Function.getSelected(vo.getDisplay_pk(), list.get(i).getNo())%>>[<%=i+1%>관] <%=list.get(i).getTitle()%></option>
											<%} %>
											</select>
										</td>
										<%if(vo.getReservestate() == 2) { %>
										<th scope="row"><label for="">관람일</label></th>
										<td>
											<input type="text" id="displaydate" name="displaydate" class="inputTitle" value="<%=vo.getDisplaydate()%>" readonly/>
										</td>
										<%} else { %>
										<th scope="row"><label for="">관람일</label></th>
										<td>
											<input type="text" id="displaydate" name="displaydate" class="inputTitle" value="<%=vo.getDisplaydate()%>" readonly/>&nbsp;
											<span id="CaldisplaydateIcon">
												<img src="/manage/img/calendar_icon.png" id="CaldisplaydateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<%} %>
									</tr>
									<tr>
										<th scope="row">인원</th>
										<td colspan="3">총 <%=vo.getNumber()%> 명  (노인: <%=vo.getOld_number()%> 명 / 성인: <%=vo.getAdult_number()%> 명 / 학생: <%=vo.getStudent_number()%> 명)</td>
									</tr>
									<tr>
										<th scope="row"><label for="">사용 포인트</label></th>
										<td><%=vo.getUsepoint()%></td>
										<th scope="row"><label for="">적립 포인트</label></th>
										<td><%=vo.getStorepoint()%>&nbsp;<span style="color:gray">(결제 금액의 5% 적립)</span></td>
									</tr>
									<tr>
										<th scope="row"><label for="">결제 수단</label></th>
										<td>
											<select name="method">
												<option value="bank" <%=Function.getSelected(vo.getMethod(), "bank")%>>무통장</option>
												<option value="card" <%=Function.getSelected(vo.getMethod(), "card")%>>신용카드</option>
											</select>
										</td>
										<th scope="row"><label for="">결제 금액</label></th>
										<td><%=vo.getPay_price()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">예매일</label></th>
										<td>
											<%=vo.getReservedate()%>
										</td>
										<%if(vo.getReservestate() == 2) { %>
										<th scope="row"><label for="">예매 상태</label></th>
										<td>
											<select name="reservestate" disabled>
												<option value="1" <%=Function.getSelected(vo.getReservestate(), 1)%>>예매완료</option>
												<option value="2" <%=Function.getSelected(vo.getReservestate(), 2)%>>예매취소</option>
											</select>
										</td>
										<%} else { %>
										<th scope="row"><label for="">예매 상태</label></th>
										<td>
											<select name="reservestate">
												<option value="1" <%=Function.getSelected(vo.getReservestate(), 1)%>>예매완료</option>
												<option value="2" <%=Function.getSelected(vo.getReservestate(), 2)%>>예매취소</option>
											</select>
										</td>
										<%} %>
									</tr>
									<tr>
										<th scope="row"><label for="">결제일</label></th>
										<td>
											<%=vo.getPaydate()%>
										</td>
										<%if(vo.getReservestate() == 2) { %>
										<th scope="row"><label for="">결제 상태</label></th>
										<td>
											<select name="paystate" disabled>
												<option value="1" <%=Function.getSelected(vo.getPaystate(), 1)%>>결제완료</option>
												<option value="2" <%=Function.getSelected(vo.getPaystate(), 2)%>>결제대기</option>
											</select>
										</td>
										<%} else { %>
										<th scope="row"><label for="">결제 상태</label></th>
										<td>
											<select name="paystate">
												<option value="1" <%=Function.getSelected(vo.getPaystate(), 1)%>>결제완료</option>
												<option value="2" <%=Function.getSelected(vo.getPaystate(), 2)%>>결제대기</option>
											</select>
										</td>
										<%} %>
									</tr>
									<tr>
										<th scope="row"><label for="">예매취소일</label></th>
										<td>
											<input type="text" id="canceldate" name="canceldate" class="inputTitle" value="<%=vo.getCanceldate()%>" readonly/>&nbsp;
											<span id="CalcanceldateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalcanceldateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">환불 상태</label></th>
										<td>
											<select name="refundstate">
												<option value="1" <%=Function.getSelected(vo.getRefundstate(), 1)%>>-</option>
												<option value="2" <%=Function.getSelected(vo.getRefundstate(), 0)%>>환불완료</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="cmd" id="cmd" value="edit"/>
								<input type="hidden" name="no" id="no" value="<%=vo.getNo()%>"/>
								<input type="hidden" name="member_pk" value="<%=vo.getMember_pk()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onclick="$('#frm').submit();"><strong>저장</strong></a>
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