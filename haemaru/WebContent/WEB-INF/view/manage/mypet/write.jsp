<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mypet.*"%>
<%@ page import="member.*"%>
<%@ page import="util.*"%>
<%
	MypetVO param = (MypetVO) request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
	function goSave() {
		if ($("#name").val() == "") {
			alert('이름을 입력하세요.');
			$("#name").focus();
			return false;
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
						<h2>반려동물 등록 - [쓰기]</h2>
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
												<th scope="row"><label for="">이름</label></th>
												<td><input type="text" id="name" name="name" value="" />
												</td>
												<th scope="row"><label for="">나이</label></th>
												<td><input type="text" id="age" name="age" value="" />
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">성별</label></th>
												<td><input type="text" id="birth" name="birth" value="" />
												</td>
												<th scope="row"><label for="">견종</label></th>
												<td><input type="text" id="tel" name="tel" value="" />
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">접종현황</label></th>
												<td><input type="text" id="tel" name="tel" value="" />
												</td>
												<th scope="row"><label for="">보호자</label></th>
												<td><input type="text" id="member_pk" name="member_pk" value="<%=param.getMember_pk()%>" />
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">이미지</label></th>
												<td colspan="3"><input type="file" id="image_tmp"
													name="image_tmp" class="w50" title="첨부파일을 업로드 해주세요." /></td>
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