<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="member.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");  
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
					<h2>회원관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회원 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">번호</label></th>
										<td><%=data.getNo()%></td>
										<th scope="row"><label for="">등록일</label></th>
										<td><%=data.getRegistdate()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td><%=data.getName()%></td>
										<th scope="row"><label for="">이메일</label></th>
										<td><%=data.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">생년월일</label></th>
										<td><%=data.getBirth()%></td>
										<th scope="row"><label for="">연락처</label></th>
										<td><%=data.getTel()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="4">
											<%=data.getMemo()%>
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
							<div class="btnC" style="width:100%;height:30px;" >
							<div class="btnCenter" style="width:100%;">
								<a class="pet-plus-more" href="<%=param.getTargetURLParam("/manage/mypet/write", param, data.getNo())%>" ><strong>반려동물추가</strong></a>
								<img src="/icon/icon_plus.png" width="15px;" height="15px;" >
								<input class="pet-plus-more" type="button" value="반려동물 보기" id="mypetListBtn"/>
								<img src="/icon/icon_plus.png" width="15px;" height="15px;" >
							</div>
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
					<div id="bbs">
						<div id="blist">
			<div id="blist" class="mypetListArea">
				
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
function getMypetList() {
	$.ajax({
		type : "GET",
		url : "/manage/member/mypetList?no=<%=param.getNo()%>",
		async:false,
		success : function (data){
			$(".mypetListArea").html(data);
		}
	});
}
$(function(){
	$("#mypetListBtn").click(function(){
		getMypetList();
	});
	$("#mypetInsertBtn").click(function() {
		$.ajax({
			type : "POST",
			url : "/mypet/insert.do",
			data : $("#mypetFrm").serialize(),
			async : false,
			success : function(data) {
				alert("정상적으로 등록되었습니다.");
				$("#name").val("");
				$("#age").val(""); 
				$("#gender").val(""); 
				$("#breed").val(""); 
				$("#vac").val(""); 
				$("#memo").val(""); 
				getMypetList();
			}
		});
	});
});

function delMypet(no) {
	if (confirm ('삭제하시겠습니까?')) {
	}
	$.ajax({
		type : "POST",
		url : "/mypet/delete.do?no="+no,
		async : false,
		success : function(data) {
			alert("정상적으로 삭제되었습니다.");
			getMypetList();
		}
	});
};

</script>
</body>
</html>