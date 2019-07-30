<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
QnaVO data = (QnaVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function goSave(){
	if($("#reply_contents").val() == ""){
		alert('내용을 입력하세요.');
		$("#reply_contents").focus();
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
					<h2>QnA - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
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
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"> 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w20"/>
									<col class=""/>
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">이메일 전송 여부</th>
										<th scope="col">내용</th>
										
									</tr>
								</thead>
								<tbody>
						
									<tr>
										<td>
											<input type="radio" name="send_email" value="0">미전송 </input>
											<input type="radio" name="send_email" value="1">전송</input>
										</td>
										<td>
											<textarea id="reply_contents" name="reply_contents" style="width:100%;" rows="3" ></textarea>
										</td>
										
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="no" value="<%=data.getNo() %>"/>
								<input type="hidden" name="reply_title" value="re:<%=data.getTitle() %>"/>
								<input type="hidden" name="reply" value="1"/>
								<input type="hidden" name="cmd" value="write_reply" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="/manage/board/qna/read?no=<%=data.getNo() %>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
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