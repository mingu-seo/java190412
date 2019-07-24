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
					<h2>상품관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 관리 기본내용입니다.">
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
										<th scope="row"><label for="">상품명</label></th>
										<td><%=data.getName()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">이미지</label></th>
										<td><img src="/upload/product/<%=data.getImagename()%>"/></td>
										<th scope="row"><label for="">가격</label></th>
										<td><%=data.getPrice()%></td>
									</tr>
									<tr>
									<th scope="row"><label for="">옵션</label></th>
									<td colspan="3">
									<table style="width:300px">
									<tr>
									<th>옵션명</th>
									<th>추가금액</th>
									</tr>
									<%
									for(int i=0; i<olist.size(); i++){
									%>
									<tr>
										<td><input type="text" name="title" value="<%=olist.get(i).get("title")%>"/></td>
										<td><input type="text" name="optPrice" value="<%=olist.get(i).get("price")%>"/></td>
									</tr>
									<%
									}
									%>
									</table>
									</td>
									</tr>
									<tr>
										<td colspan="4">
											<%=data.getInfo()%>
										</td>
									</tr>
								</tbody>
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
				
				<h2>상품후기<input type="button" value="상품후기 보기" id="reviewListBtn"/></h2>
				</div>
				<div class="con">
				
					<div id="bbs">
						<div id="blist">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w5"/>
									<col class="w10"/>
									<col class=""/>
									<col class="w10"/>
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">평점</th>
										<th scope="col">작성자</th>
										<th scope="col">후기</th>
										<th scope="col" class="last"></th>
									</tr>
								</thead>
								<tbody>
								<form id="reviewFrm">
									<tr>
										<td>
											<select name="score" id="review_score">
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>											
											</select>
										</td>
										<td><input type="text" name="name" id="review_name"></input></td>
										<td>
											<textarea style="width:100%;" name="contents" rows="3" id="review_contents"></textarea>
										</td>
										<td><input type="button" value="후기 저장" id="reviewInsertBtn"/></td>
									</tr>
									<input type="hidden" name="product_pk" value="<%=data.getNo() %>"/>
								</form>
								</tbody>							
							</table>
						
						</div>
						<div id="blist" class="reviewListArea">
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
		url: "/manage/product/reviewlist?no=<%=data.getNo()%>",
		async: false,
		success: function(data){
			$(".reviewListArea").html(data);
		}
	});
}
$(function(){
	$("#reviewListBtn").click(function(){
		getReviewList();
	});
	

	$("#reviewInsertBtn").click(function(){
		if ($("#review_name").val() == "") {
			alert('작성자명을 입력하세요.');
			$("#review_name").focus();
			return;
		}
			
		if ($("#review_contents").val() == "") {
			alert('후기를 입력하세요.');
			$("#review_contents").focus();
			return;
		}
			
		var data = $("#reviewFrm").serialize();
		
		$.ajax({
			type: "POST",
			url: "/review/insert.do",
			data: data,
			async: false,
			success: function(data){
				alert("정상적으로 등록되었습니다.");
				$("#review_name").val("");
				$("#review_contents").val("");
				getReviewList();
			}
		});
	});
});

function delReview(no) {
	if (confirm ('삭제하시겠습니까?')) {
		$.ajax({
			type: "POST",
			url: "/review/delete.do?no="+no,
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