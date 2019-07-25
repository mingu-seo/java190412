<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="util.*" %>
<%
	QnaVO param = (QnaVO) request.getAttribute("param");
	QnaVO data = (QnaVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
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
					<h2>QnA - [등록하기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td>
											<select name="category">
												<option value='1'>일반</option>
												<option value='2'>입양</option>
												<option value='3'>진료</option>
											</select>
										</td>
										<th scope="row"><label for="">이메일</label></th>
										<td>
											<input type="text" id="email" name="email" value="" class="w50" title="이메일을 입력해주세요" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td><input type="file" id="filename_tmp" name="filename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" class="w50" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
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