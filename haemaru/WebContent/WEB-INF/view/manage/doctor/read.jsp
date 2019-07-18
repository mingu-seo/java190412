<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="java.util.*"%>
<%
	DoctorVO param = (DoctorVO) request.getAttribute("vo");
	DoctorVO data = (DoctorVO) request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">

	$(function(){
		$("#delBtn").click(function(){
			goDelete();
		});
	});
	
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>
	&cmd=delete";
		}
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
						<h2>의료진관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="관리자 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">부서</label></th>
											<td colspan="2"><%=CodeUtil.getDoctorDepartmentName(data.getDepartment())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">직급</label></th>
											<td colspan="2"><%=CodeUtil.getDoctorPositionName(data.getPosition())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">성별</label></th>
											<td colspan="2"><%=CodeUtil.getDoctorGenderName(data.getGender())%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">이름</label></th>
											<td colspan="2"><%=data.getName()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">주소</label></th>
											<td colspan="2"><%=data.getAddr()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">연락처</label></th>
											<td colspan="2"><%=data.getTel()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">사진</label></th>
											<td><img src="/upload/doctor/<%=data.getDoc_image()%>"
												width="300px" height="auto" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td colspan="2"><%=DateUtil.getDateTimeFormat(data.getRegistdate())%></td>
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
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" id="delBtn"><strong>삭제</strong></a>
									</div>

								</div>
							</div>
							<!-- //bread -->
						</div>
						<!-- //bbs -->
						<!-- 내용 : e -->
					</div>
					<!--//con -->
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