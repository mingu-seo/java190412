<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="board.qna.*"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*"%>
<%
QnaVO param = (QnaVO) request.getAttribute("param");
QnaVO data = (QnaVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">
	$(function() {
	$("#delBtn").click(function() {
		goDelete();
	});
});
	
function goDelete() {
	var del = confirm ('삭제하시겠습니까?');
	if (del){
		document.location.href = "/manage/board/qna/process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	}
	


function goSave() {
	
	var sHTML = oEditors.getById["reply_contents"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('내용을 입력하세요.');
		$("#reply_contents").focus();
		return false;
	} else {
		oEditors.getById["reply_contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		data.setReply(1);
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
						<h2>관리자관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="관리자 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
									</colgroup>
									<tbody>
									<tr>
										<th scope="row"><label for="">공개여부</label></th>
										<td>
												<%=CodeUtil.getOpenName(data.getOpen()) %>
										</td>
										<th scope="row"><label for="">카테고리</label></th>
										<td colspan="3">
											<%=data.getCategory()%>
										</td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td >
											<%=data.getName()%>
											
										</td>
										
										<th scope="row"><label for="">연락처</label></th>
										<td colspan="4">
											<%=data.getTel()%>
										</td>
										
									
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td >
											<%=data.getEmail()%>
											
										</td>
										<th scope="row"><label for="">게시글 비밀번호</label></th>
										<td colspan="3" >
											<%=data.getPassword()%>
											
										</td>
									</tr>
									
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="3">
											<%=data.getTitle()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="5">
											<%=data.getContents()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">파일</label></th>
										<td>
										<% if (data.getFile() != null && !"".equals(data.getFile())) { %>
											<img src="/upload/qna/<%=data.getFile()%>" width="270px" height="auto"/>
										<% } %>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">원본 파일명</label></th>
										<td colspan="5"><%=data.getFile_org()%></td>
									</tr>
									
								</tbody>
									</table>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns"
											href="<%=param.getTargetURLParam("write_reply", param, data.getNo())%>"><strong>답변쓰기</strong></a>
										<a class="btns"
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
									</div>
								</div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									</table>
								<!--//btn-->
							</div>
							<!-- //bread -->
						</div>
						<!-- //bbs -->
						<!-- 내용 : e -->
					</div>
					<!--//con -->
					<div class="con_tit">
					<%-- <h2>QnA 답변보기 <input type="button" value="QnA 답변" id="replyListBtn"/></h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w10"/>
									<col class=""/>
									<col class="w10"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">이메일 전송 여부</th>
										<th scope="col">내용</th>
										<th scope="col" class="last"></th>
									</tr>
								</thead>
								<tbody>
								<%
										if (data.getReply() == 0) {
								%>
								<form id="replyFrm">
									<tr>
										<td>
											<input type="radio" name="send_email" value="0">미전송 </input>
											<input type="radio" name="send_email" value="1">전송</input>
										</td>
										
										<td>
											<textarea style="width:100%;" name="" rows="3" id="reply_contents"></textarea>
										</td>
										<td><input type="button" value="후기 저장" id="replyInsertBtn"/></td>
									</tr>
								<input type="hidden" name="member_pk" value="<%=data.getNo() %>"/>
								<input type="hidden" name="reply_title" value="re:"<%=data.getTitle() %>"/>
								<input type="hidden" name="reply" value="0"/>
								</form>
								<%
										} else if(data.getReply() == 1){
								%>
								<form id="replyFrm">
									<tr>
										<td>
											<input type="radio" name="send_email" value="0"  ${data.send_email == 0 ? "selected" : ""}>미전송 </input>
											<input type="radio" name="send_email" value="1"  ${data.send_email == 1 ? "selected" : ""}>전송</input>
										</td>
										
										<th scope="row"><label for="">내용</label></th>
										<td colspan="4">
											<textarea id="reply_contents" name="reply_contents" title="내용을 입력해주세요" style="width:100%;" value="<%=Function.checkNull(data.getReply_contents())%>" ></textarea>	
										</td>
										<td><input type="button" value="후기 저장" id="replyInsertBtn"/></td>
									</tr>
								<input type="hidden" name="member_pk" value="<%=data.getNo() %>"/>
								<input type="hidden" name="reply_title" value="re:"<%=data.getTitle() %>"/>
								<input type="hidden" name="reply" value="1"/>
								</form>
								<%
										}
								%>
								</tbody>
							</table>
						</div>
						
						<div id="blist" class="replyListArea"> --%>
						
						</div>
					</div>
				</div>
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