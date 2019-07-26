<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="util.*" %>
<%
TicketVO vo = (TicketVO)request.getAttribute("vo");
TicketVO param = (TicketVO)request.getAttribute("param");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript">
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=vo.getNo()%>&cmd=delete";
		} else {
			return false;
		}
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
					<h2>예매 관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>예매 정보</h3>
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
										<th scope="row"><label for="">관람 작품</label></th>
										<td><%=vo.getTitle()%></td>
										<th scope="row"><label for="">관람일</label></th>
										<td><%=vo.getDisplaydate()%></td>
									</tr>
									<tr>
										<th scope="row">인원</th>
										<td colspan="3"><%=vo.getNumber()%> 명  (노인: <%=vo.getOld_number()%>명 / 성인: <%=vo.getAdult_number()%>명 / 학생: <%=vo.getStudent_number()%>)</td>
									</tr>
									<tr>
										<th scope="row"><label for="">사용 포인트</label></th>
										<td><%=vo.getUsepoint()%></td>
										<th scope="row"><label for="">적립 포인트</label></th>
										<td><%=vo.getStorepoint()%>&nbsp;<span style="color:gray">(결제 금액의 5% 적립)</span></td>
									</tr>
									<tr>
										<th scope="row"><label for="">결제 수단</label></th>
										<td><%=CodeUtil.getPaymentName(vo.getMethod())%></td>
										<th scope="row"><label for="">결제 금액</label></th>
										<td><strong><%=vo.getPay_price()%></strong></td>
									</tr>
									<tr>
										<th scope="row"><label for="">예매일</label></th>
										<td><%=vo.getReservedate()%> | <span style="color:blue;"><%=CodeUtil.getResStateSave(vo.getReservestate())%></span></td>
										<th scope="row"><label for="">결제일</label></th>
										<td><%=vo.getPaydate()%> | <span style="color:blue;"><%=CodeUtil.getPayStateSave(vo.getPaystate())%></span></td>
									</tr>
									<tr>
										<th scope="row"><label for="">예매취소일</label></th>
										<td><%=vo.getCanceldate()%></td>
										<th scope="row"><label for="">환불 상태</label></th>
										<td><%=CodeUtil.getRefunState(vo.getRefundstate())%></td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="<%=param.getTargetURLParam("edit", param, vo.getNo())%>"><strong>수정</strong></a>
									<a class="btns" href="#" onclick="goDelete();"><strong>삭제</strong></a>
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