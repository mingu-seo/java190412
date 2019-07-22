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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript">
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
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
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
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
										<td colspan="3"><textarea style="width:100%;" name="contents" rows="3" id="contents"><%=data.getContents()%></textarea></td>
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
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w10"/>
									<col class=""/>
									<col class="w10"/>
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col">작성자</th>
										<th scope="col">답변내용</th>
										<th scope="col" class="last"></th>
									</tr>
								</thead>
								<tbody>
								<form id="replyFrm">
									<tr>
										<td><input type="text" name="name" id="member_pk"></input></td>
										<td>
											<textarea style="width:100%;" name="reply" rows="3" id="reply"></textarea>
										</td>
										<td><input type="button" value="답변 저장" id="replyInsertBtn"/></td>
									</tr>
									<input type="hidden" name="member_pk" value="<%=data.getMember_pk() %>"/>
								</form>
								</tbody>							
							</table>
						
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

<script>
function getReviewList(){
	$.ajax({
		type: "GET",
		url: "/manage/qna/replylist?no=<%=data.getNo()%>",
		async: false,
		success: function(data){
			$(".replyListArea").html(data);
		}
	});
}
$(function(){
	$("#replyListBtn").click(function(){
		getReviewList();
	});
	

	$("#replyInsertBtn").click(function(){
			
		if ($("#reply").val() == "") {
			alert('답변을 입력하세요.');
			$("#reply").focus();
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
				$("#reply").val("");
				getReviewList();
			}
		});
	});
});

function delReview(no) {
	if (confirm ('삭제하시겠습니까?')) {
		$.ajax({
			type: "POST",
			url: "/reply/delete.do?no="+no,
			async: false,
			success: function(data){
				alert("삭제되었습니다.");
				getReviewList();
			}
		});
	}
}
</script>
</body>
</html>