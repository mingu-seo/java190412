<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="util.*"%>
<%
	ReserveVO param = (ReserveVO) request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function() {
		oEditors = setEditor("info"); // 에디터 셋팅
		initCal({
			id : "res_date",
			type : "day",
			today : "y"
		});
	});

	function goSave() {
		if ($("#name").val() == "") {
			alert('제목을 입력하세요.');
			$("#name").focus();
			return false;
		}
		var con = true;
		$(".addTr").each(function(idx) {
			if ($("input[name='title']").eq(idx).val() == "") {
				alert("옵션명을 입력해주세요.")
				i$("input[name='title']").eq(idx).focus();
				con = false;
				return false;
			}

			if ($("input[name='oprice']").eq(idx).val() == "") {
				alert("옵션가격 입력해주세요.")
				$("input[name='oprice']").eq(idx).focus();
				con = false;
				return false;
			}
		});
		if (con == false)
			return false;

		var sHTML = oEditors.getById["info"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#info").focus();
			return false;
		} else {
			oEditors.getById["info"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		}
		return true;
	}

	$(function() {
		var trIdx = 0;
		$(".addBtn")
				.click(
						function() {
							var trObj = "<tr class='addTr'>";
							trObj += '<td><input type="text" name="title"/></td>';
							trObj += "<td><input type=\"text\" name=\"oprice\"/></td>";
							trObj += "<td><input type=\"button\" value=\"삭제\" class=\"delBtn\"/></td>";
							trObj += "</tr>";
							$("#optionTable").append(trObj);
							trIdx++;

							$(".delBtn").off("click");
							$(".delBtn").click(function() {
								var idx = $(".delBtn").index(this);
								$(".addTr").eq(idx).remove();
							});
						});
	});
	
	
	
	function getDoctorList(){
		$.ajax({
			type :"GET",
			url : "/manage/reserve/doctorList?no=<%=param.getDoctor_department()%>",
			async : false,
			success : function(data) {
				$(".doctorListArea").html(data);
			}
		});
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
						<h2>예약등록 - [쓰기]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm"
									action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"
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
												<th scope="row"><label for="">예약경로</label></th>
												<td><select name="route">
														<%=CodeUtil.getReserveRouteOption(0)%>
												</select></td>
												<tr>
													<th scope="row"><label for="">이름</label></th>
													<td colspan="3"><input type="text" id="name"
														name="name" class="w50" title="이름을 입력해주세요" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="">연락처</label></th>
													<td colspan="3"><input type="text" id="tel" name="tel"
														class="w50" title="전화번호를 입력해주세요" /></td>
												</tr>

												<tr>
													<th scope="row"><label for="">예약날짜</label></th>
													<td><input type="text" id="res_date" name="res_date"
														class="inputTitle" value="<%=DateUtil.getToday()%>"
														title="예약일을 입력해주세요" />&nbsp; <span id="Calres_dateIcon">
															<img src="/manage/img/calendar_icon.png"
															id="Calres_dateIconImg" style="cursor: pointer;" />
													</span></td>
												</tr>
												<tr>
													<th scope="row"><label for="">진료과목</label></th>
													<td><select name="doctor_department">
															<%=CodeUtil.getDoctorDepartmentOption(0)%>
													</select></td>
												</tr>
												<tr>
												
													<th scope="row"><label for="">의료진</label></th>
													<td><div id="blist" class="doctorListArea"></div></td>
											<!-- 		<td colspan="3"><input type="text" id="doctor_name"
														name="doctor_name" class="w50" title="이름을 입력해주세요" /></td>  -->
												</tr>

												<th scope="row"><label for="">예약시간</label></th>
												<td><select name="res_hour">
														<%=CodeUtil.getDoctorScheduleOption(0)%>
												</select></td>

												<tr>

													<td colspan="4"><textarea id="info"
															name="res_contents" title="내용을 입력해주세요"
															style="width: 100%;"></textarea></td>
												</tr>
										</tbody>
									</table>
									<input type="hidden" name="member_pk" id="member_pk"
										value="<%=param.getNo()%>" /> <input type="hidden"
										name="doctor_pk" id="doctor_pk" value="<%=param.getNo()%>" />
									<input type="hidden" name="cmd" value="write" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
									</div>
								</div>
								<!--//btn-->


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