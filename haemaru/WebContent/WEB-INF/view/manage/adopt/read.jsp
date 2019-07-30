<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.adopt.*" %>
<%
AdoptVO param = (AdoptVO)request.getAttribute("vo");
AdoptVO data = (AdoptVO)request.getAttribute("data");
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
					<h2>동물관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="동물 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td>
											<%=data.getAnimal_category()%>
										</td>
										<th scope="row"><label for="">*이름</label></th>
										<td>
											<%=data.getName()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">성별</label></th>
										<td>
											<%=data.getGender()%>
										</td>
										<th scope="row"><label for="">나이</label></th>
										<td>
											<%=data.getAge()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이미지</label></th>
										<td>
											<img src="/upload/adopt/<%=data.getAnimal_image()%>" width="320px" height="320px"/>	
										</td>
										<th scope="row"><label for="">품종</label></th>
										<td>
											<%=data.getBreed()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">접종현황</label></th>
										<td>
											<%=data.getVac()%>
										</td>
										<th scope="row"><label for="">상태</label></th>
										<td>
											<%=data.getState()%>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<%=data.getCharr()%>
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