<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="util.*"%>
<%
	DoctorVO param = (DoctorVO) request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>

	function goSave() {
		if ($("#name").val() == "") {
			alert('제목을 입력하세요.');
			$("#name").focus();
			return false;
		}
		return true;
	}
	
	$(function(){
		var trIdx = 0;
		$(".addBtn").click(function(){
			var trObj ="<tr class='addTr'>";
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
						<h2>의료진 등록 - [쓰기]</h2>
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
												<th scope="row"><label for="">부서</label></th>
												<td><select name="department">
														<%=CodeUtil.getDoctorDepartmentOption(0)%>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="">직급</label></th>
												<td><select name="position">
														<%=CodeUtil.getDoctorPositionOption(0)%>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="">성별</label></th>
												<td><select name="gender">
														<%=CodeUtil.getDoctorGenderOption(0)%>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="">이름</label></th>
												<td colspan="3"><input type="text" id="name"
													name="name" class="w50" title="제목을 입력해주세요" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">주소</label></th>
												<td colspan="3"><input type="text" id="addr"
													name="addr" class="w50" title="제목을 입력해주세요" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">연락처</label></th>
												<td colspan="3"><input type="text" id="tel"
													name="tel" class="w50" title="제목을 입력해주세요" /></td>
											</tr>
											<tr>
												<th scope="row"><label for="">사진</label></th>
												<td colspan="3"><input type="file" id="image_tmp"
													name="image_tmp" class="w50" title="첨부파일을 업로드 해주세요." />
												</td>
											</tr>
												

											<tr>
												<th scope="row"><label for="">등록일</label></th>
												<td><input type="text" id="registdate"
													name="registdate" class="inputTitle"
													value="<%=DateUtil.getFullToday()%>" title="등록일을 입력해주세요" />&nbsp;
													<span id="CalregistdateIcon"> <img
														src="/manage/img/calendar_icon.png"
														id="CalregistdateIconImg" style="cursor: pointer;" />
												</span></td>
											</tr>			
										</tbody>
									</table>
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