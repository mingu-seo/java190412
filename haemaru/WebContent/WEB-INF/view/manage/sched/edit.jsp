<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.sched.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
	SchedVO param = (SchedVO) request.getAttribute("param");
	SchedVO data = (SchedVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
	function goSave() {

		if ($("#name").val() == "") {
			alert('상품명을 입력하세요.');
			$("#name").focus();
			return false;
		}

		if ($("").val() == "") {
			alert('상품명을 입력하세요.');
			$("").focus();
			return false;
		}

		return true;
	}

	function delTr(addTr) {
		$("." + addTr).remove();
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
						<h2>의료진 일정 - [등록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm" action="process.do"
									enctype="multipart/form-data" onsubmit="return goSave();">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="관리자 관리 기본내용입니다.">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="">이름</label></th>
												<td colspan="3"><input type="text" id="name"
													name="name" class="w50" title="제목을 입력해주세요"
													value="<%=Function.checkNull(data.getName())%>" /></td>
											</tr>

											<th scope="row"><label for="">일정등록</label></th>
											<td>
												<table id="schedTable">
													<tr>
														<th></th>
														<th>시작 - 종료</th>
													</tr>
													<tr>
														<th scope="row"><label for="">월요일</label>
														<input type="checkbox" name="mon_res" value="1" <%=Function.getChecked(1, data.getMon_res()) %>/>
														</th>
														<td><select name="mon_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getMon_start())%>
														</select> <strong> - </strong> <select name="mon_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getMon_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">화요일</label>
														<input type="checkbox" name="tue_res" value="1" <%=Function.getChecked(2, data.getTue_res()) %>/>
														</th>
														<td><select name="tue_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getTue_start())%>
														</select> <strong> - </strong> <select name="tue_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getTue_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">수요일</label>
														<input type="checkbox" name="wed_res" value="1" <%=Function.getChecked(1, data.getWed_res()) %>/>
														</th>
														<td><select name="wed_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getWed_start())%>
														</select> <strong> - </strong> <select name="wed_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getWed_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">목요일</label></th>
														<td><select name="thu_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getThu_start())%>
														</select> <strong> - </strong> <select name="thu_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getThu_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">금요일</label></th>
														<td><select name="fri_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getFri_start())%>
														</select> <strong> - </strong> <select name="fri_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getFri_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">토요일</label></th>
														<td><select name="sat_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getSat_start())%>
														</select> <strong> - </strong> <select name="sat_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getSat_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">일요일</label></th>
														<td><select name="sun_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getSun_start())%>
														</select> <strong> - </strong> <select name="sun_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getSun_end())%></td>

													</tr>
													<tr>
														<th scope="row"><label for="">공휴일</label></th>
														<td><select name="hol_start">
																<%=CodeUtil.getDoctorScheduleOption(data.getHol_start())%>
														</select> <strong> - </strong> <select name="holn_end">
																<%=CodeUtil.getDoctorScheduleOption(data.getHol_end())%></td>

													</tr>
												</table>
										</tbody>
									</table>
									</tr>
									<input type="hidden" name="cmd" id="cmd" value="edit" /> <input
										type="hidden" name="no" id="no" value="<%=data.getNo()%>" />
								</form>
								<div class="btn">

									<div class="btnRight">
										<a class="btns" style="cursor: pointer;"
											onclick="$('#frm').submit();"><strong>저장</strong></a>
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