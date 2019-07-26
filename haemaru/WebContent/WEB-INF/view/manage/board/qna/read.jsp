<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.qna.*" %>
<%@ page import="java.util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
QnaVO data = (QnaVO)request.getAttribute("data");
ArrayList<HashMap> olist = (ArrayList<HashMap>)request.getAttribute("olist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<style>
th, replyth {
width: 15%;
}
th {
width: 15%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript">
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href="process?no=<%=data.getNo()%>&cmd=delete";
		} else {
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
					<h2>QnA관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="QnA 관리 기본내용입니다.">
								<colgroup>
								<col width="15%"/>
								<col width="35%"/>
								<col width="15%"/>
								<col width="35%"/>					
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td><%=data.getCategory()%></td>
										<th scope="row"><label for="">이메일</label></th>
										<td><%=data.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td><a href="/upload/qna/<%=data.getFilename()%>"></a></td>
										<th scope="row"><label for="">등록일</label></th>
										<td><%=data.getRegistdate()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="3"><%=data.getTitle() %></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td colspan="3"><%=data.getContents()%></td>
									</tr>
									</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
									<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
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
				<div class="con_tit">
				
				<h2>QnA 답변<input type="button" value="답변 보기" id="replyListBtn"/></h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
								<form id="replyFrm" method="post" enctype="multipart/form-data">
									<tr>
									<th class="replyth"><label for="">작성자</label></th>
										<td><input type="text" name="name" id="name"></input></td>
									<th class="replyth"><label for="">첨부파일</label></th>
										<td><input type="file" name="filename_tmp" id="filename_tmp" value="파일첨부"/>
										</td>
									</tr>
									<tr>
									<th class="replyth"><label for="">제목</label></th>	
										<td colspan="3"><input type="text" name="title" id="title" size="200"></input>
										</td>
									</tr>
									<tr>
									<th class="replyth"><label for="">답변내용</label></th>
										<td colspan="3">
											<textarea style="width:100%;" id="contents" name="contents" rows="3" id="reply"></textarea>
										</td>
									</tr>
									<tr>
									
									</tr>
									<tr>	
									<th class="replyth"></th>
										<td><input type="button" value="답변 저장" id="replyInsertBtn"></input></td>
									</tr>
									<input type="hidden" name="qna_no" value="<%=data.getNo()%>"/>
									<input type="hidden" name="admin_pk" value="0"/>
								</form>
								</tbody>							
							</table>
						</div>
						</div>
						<div id="blist" class="replyListArea">
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
<!-- <input type="hidden" name="member_pk" value="<%=data.getMember_pk() %>"/> -->	
								
<script>
function getReplyList(){
	$.ajax({
		type: "GET",
		url: "/manage/board/qna/replylist?no=<%=param.getNo()%>",
		async: false,
		success: function(data){
			$(".replyListArea").html(data);
		}
	});
}
$(function(){
	$("#replyListBtn").click(function(){
		getReplyList();
	});
	

	$("#replyInsertBtn").click(function(){
		if ($("#name").val() == "") {
			alert('작성자명을 입력하세요.');
			$("#name").focus();
			return;
		}
		
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return;
		}
			
		if ($("#contents").val() == "") {
			alert('답변내용을 입력하세요.');
			$("#contents").focus();
			return;
		}
			
		var data = $("#replyFrm").serialize();
		
		$.ajax({
			type: "POST",
			url: "/reply/insert.do",
			data: data,
			async: false,
			success: function(data){
				alert("정상적으로 등록되었습니다.");
				$("#name").val("");
				$("#contents").val("");
				getReplyList();
			}
		});
	});
});


function delReply(no) {
	if (confirm ('삭제하시겠습니까?')) {
		$.ajax({
			type: "POST",
			url: "/reply/delete.do?no="+no,
			async: false,
			success: function(data){
				alert("삭제되었습니다.");
				getReplyList();
			}
		});
	}
}
</script>
</body>
</html>