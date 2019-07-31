<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="java.util.*"%>
<%
	ReserveVO param = (ReserveVO) request.getAttribute("vo");
	ReserveVO data = (ReserveVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">

	$(function(){
		$("#delBtn").click(function(){
			goDelete();
		});
	});
	
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		}
		.0
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>예약관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="예약 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">예약경로</label></th>
											<td colspan="2"><%=CodeUtil.getReserveRouteName(data.getRoute())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">이름</label></th>
											<td colspan="2"><%=data.getName()%></td>
										</tr>
											<tr>
											<th scope="row"><label for="">연락처</label></th>
											<td colspan="2"> <%=data.getTel() %></td>
										</tr>
										
										<tr>
											<th scope="row"><label for="">예약날짜</label></th>
											<td colspan="2"><%=data.getRes_date()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">진료과목</label></th>
											<td colspan="2"><%=CodeUtil.getDoctorDepartmentName(data.getDoctor_department())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">의료진</label></th>
											<td colspan="2"><%=data.getDoctor_name()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">예약시간</label></th>
											<td colspan="2"><%=CodeUtil.getDoctorScheduleName(data.getRes_hour())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">참고내용</label></th>
											<td colspan="2"><%=data.getRes_contents()%></td>
										</tr>
									</tbody>
								</table>


								<input type="hidden" name="doctor_pk" id="doctor_pk"
									value="<%=data.getNo()%>" />
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns"
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" id="delBtn"><strong>삭제</strong></a>
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