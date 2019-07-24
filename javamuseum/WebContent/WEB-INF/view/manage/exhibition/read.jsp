<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="util.*" %>
<%
ExhibitionVO param = (ExhibitionVO)request.getAttribute("vo");
ExhibitionVO data = (ExhibitionVO)request.getAttribute("data");
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
					<h2>전시 관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>전시 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr style="height:300px">
										<td colspan="2"height="0" width="0">
										<div style="height:100%; width:100%"><img src="/upload/exhibition/<%=data.getImagename()%>" width="100%" height="auto" /></div></td>
										<th scope="row"><label for="">프리뷰</label></th>
										<td><%=data.getPreview()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">전시관</label></th>
										<td><%=data.getHallnumber()%> 관</td>
										<th scope="row">전시 상태</th>
										<td><%=CodeUtil.getStrDisState(data.getState())%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="3"><%=data.getTitle()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">작가</label></th>
										<td colspan="3"><%=data.getArtist()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">좋아요</label></th>
										<td><%=data.getLike_cnt()%></td>
										<th scope="row"><label for="">평점</label></th>
										<td><%=data.getScore()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">시작일</label></th>
										<td><%=data.getStartdate()%></td>
										<th scope="row"><label for="">종료일</label></th>
										<td><%=data.getEnddate()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">등록일</label></th>
										<td><%=DateUtil.getStrTimestamp(data.getRegistdate())%></td>
									</tr>
									<tr>
										<td colspan="4" style="height:200px"><%=data.getContents()%></td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
									<a class="btns" href="#" onclick="goDelete();"><strong>삭제</strong></a>
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