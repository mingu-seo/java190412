<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
	DoctorVO param = (DoctorVO) request.getAttribute("param");
	DoctorVO data = (DoctorVO) request.getAttribute("data");
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
		var sHTML = oEditors.getById["info"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#info").focus();
			return false;
		} else {
			oEditors.getById["info"].exec("UPDATE_INFO_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		}
		
		if ($("").val() == "") {
			alert('상품명을 입력하세요.');
			$("").focus();
			return false;
		}

		return true;
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
						<h2>의료진 정보 - [수정]</h2>
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
												<th scope="row"><label for="">부서</label></th>
												<td><select name="department">
														<%=CodeUtil.getDoctorDepartmentOption(data.getDepartment())%>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="">사진</label></th>
												<td colspan="3">
													<%
														if (data.getDoc_image() == null || "".equals(data.getDoc_image())) {
													%> <input type="file" name="image_tmp"
													id="image_tmp" title="첨부파일" /> <%
												 	} else {
												 %>
													<div class="weidtFile">
														<p>
															기존파일 : <a
																href="<%=Function.downloadUrl(SiteProperty.DOCTOR_UPLOAD_PATH,
							java.net.URLEncoder.encode(data.getDoc_image_org(), "UTF-8"), data.getDoc_image())%>"
																target="_blank"><%=Function.checkNull(data.getDoc_image_org())%>
															</a><br /> <input type="checkbox" id="imagename_chk"
																name="doc_imagename_chk" value="1"
																title="첨부파일을 삭제하시려면 체크해주세요" /> <label
																for="doc_imagename_chk">기존파일삭제</label>
														</p>
														<input type="file" name="image_tmp" id="image_tmp"
															title="첨부파일을 업로드 해주세요." />
													</div> <%
 	}
 %>
												</td>
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