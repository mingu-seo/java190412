<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mypet.*"%>
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
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("memo"); // 에디터 셋팅
});

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
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
						<h2>반려동물 등록 - [쓰기]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post" enctype="multipart/form-data">
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
												<td><select name="gender">
														<option value='1'>여아</option>
														<option value='2'>남아</option>
												</select></td>
												<th scope="row"><label for="">견종</label></th>
												<td><input type="text" id="breed" name="breed" value="" />
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">접종현황</label></th>
												<td><input type="text" id="vac" name="vac" value="" />
												</td>
												<th scope="row"><label for="">이미지</label></th>
												<td colspan="3"><input type="file" id="image_tmp"
													name="image_tmp" class="w50" title="첨부파일을 업로드 해주세요." /></td>
											</tr>
											<tr>
												<td colspan="4">
													<textarea id="memo" name="memo" value="" title="내용을 입력해주세요" style="width: 100%"></textarea>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="cmd" value="write" />
									<input type="hidden" name="member_pk" value="<%=param.getNo()%>" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
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