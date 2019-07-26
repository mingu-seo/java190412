<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.qna.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
	QnaVO param = (QnaVO) request.getAttribute("param");
	QnaVO data = (QnaVO) request.getAttribute("data");
	ArrayList<HashMap> olist = (ArrayList<HashMap>)request.getAttribute("olist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
function goSave() {
	if ($("#title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}
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
						<h2>상품 - [수정]</h2>
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
												<th scope="row"><label for="">카테고리</label></th>
												<td><select name="category">
														<option value='1'>일반</option>
														<option value='2'>입양</option>
														<option value='3'>진료</option>
												</select></td>
												<th scope="row"><label for="">첨부파일</label></th>
												<td>
													<%
														if (data.getFilename() == null || "".equals(data.getFilename())) {
													%>
													<input type="file" name="filename_tmp" id="filename_tmp"
													title="첨부파일" /> <%
 													} else {
																		 %>
													<div class="weidtFile">
														<p>
															기존파일 : <a
																href="<%=Function.downloadUrl(SiteProperty.QNA_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFilename_org(), "UTF-8"), data.getFilename())%>"
																target="_blank"><%=Function.checkNull(data.getFilename_org())%></a><br />
															<input type="checkbox" id="filename_chk"
																name="filename_chk" value="1"
																title="첨부파일을 삭제하시려면 체크해주세요" /> <label
																for="filename_chk">기존파일삭제</label>
														</p>
														<input type="file" name="filename_tmp" id="filename_tmp"
															title="첨부파일을 업로드 해주세요." />
													</div> <%
 																	}
 																%>
												</td>
												</tr>
												<tr>
												<th scope="row"><label for="">제목</label></th>
												<td colspan="2"><input type="text" id="title"
													name="title" class="w50" title="제목을 입력해주세요." value="<%=data.getTitle()%>"/></td>
											</tr>
											<tr>
												<td colspan="4"><textarea id="contents" name="contents"
														title="내용을 입력해주세요" style="width: 100%;"><%=Function.checkNull(data.getContents())%></textarea>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="stype" id="stype"
										value="<%=param.getStype()%>" /> 
									<input type="hidden"
										name="sval" id="sval" value="<%=param.getSval()%>" /> 
									<input
										type="hidden" name="cmd" id="cmd" value="edit" /> 
									<input
										type="hidden" name="no" id="no" value="<%=data.getNo()%>" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
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