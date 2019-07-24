<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
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
							<table width="80%" border="0" cellspacing="0" cellpadding="0" summary="회원 관리 기본내용입니다.">
								<colgroup>
									<col width="25%" />
									<col width="75%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">회원명</th>
										<td>
											<%=data.getName()%>
										</td>
									</tr>
									<tr>
										<th scope="row">성별</th>
										<td>
											<%=CodeUtil.getGenderName(data.getGender())%>
										</td>
									</tr>
									<tr>
										<th scope="row">생년월일</th>
										<td>
											<%=data.getBirthday()%>
										</td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td>
											<%=data.getEmail()%>
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											<%=data.getTel()%>
										</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td>
											<%=data.getZipcode()%><br/>
											<%=data.getAddr1()%><br/>
											<%=data.getAddr2()%>
										</td>
									</tr>
									<tr>
										<th scope="row">아이디</th>
										<td>
											<%=data.getId()%>
										</td>
									</tr>
									<tr>
										<th scope="row">포인트</th>
										<td>
											<%=data.getPoint()%>&nbsp
											<input type="button" value="상세내역" onclick="window.open('point?member_pk=<%=param.getNo() %>', '포인트내역', 'width=1000px, height=600px')">
										</td>
									</tr>
									<tr>
										<th scope="row">등록일</th>
										<td>
											<%=DateUtil.getDateFormat(data.getReg_date())%>
										</td>
									</tr>
									<tr>
										<th scope="row">수정일</th>
										<td>
											<%=DateUtil.getDateFormat(data.getMod_date())%>
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