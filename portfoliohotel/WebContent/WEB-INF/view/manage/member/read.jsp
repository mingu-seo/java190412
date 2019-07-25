<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.member.*" %>
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
	$(function(){
		$("#delBtn").click(function(){
			goDelete();
		})
	})
	function goDelete() {
		var del = confirm ('탈퇴하시겠습니까?');
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
					<h2>관리자관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
								<%
								String[] nameArr = data.getName().split(",");
								String[] birthdayArr = data.getBirthday().split(",");
								String[] telArr = data.getTel().split(",");
								%>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td colspan="3"><%=nameArr[0]%> <%=nameArr[1] %></td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td colspan="3"><%=data.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">성별</label></th>
										<td colspan="3"><%=CodeUtil.getGender(data.getGender())%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">생년월일</label></th>
										<%-- <td colspan="3"><%=data.getBirthday()%></td> --%>
										<td colspan="3"><%=birthdayArr[0]%>년 <%=birthdayArr[1] %>월 <%=birthdayArr[2]%>일</td>
									
									</tr>
									<tr>
										<th scope="row"><label for="">연락처</label></th>
										<%-- <td colspan="3"><%=data.getTel()%></td> --%>
										<td colspan="3"><%=telArr[0]%> - <%=telArr[1] %> - <%=telArr[2]%></td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">주소/우편번호</label></th>
										<td colspan="3"><%=data.getAddr()%> [<%=data.getZipcode()%>]</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상세주소</label></th>
										<td colspan="3"><%=data.getAddr_detail()%></td>
									</tr>
									
									
									<tr>
										<th scope="row"><label for="">등급</label></th>
										<td colspan="3"><%=CodeUtil.getMgrade(data.getGrade())%></td>
										
									</tr>
									<tr>
										<th scope="row"><label for="">포인트</label></th>
										<td colspan="3"><%=data.getPoint()%></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="">최근로그인 날짜</label></th>
										<td colspan="3"><%=data.getLogindate()%></td>
									</tr> 
									
									<tr>
										<th scope="row"><label for="">탈퇴 여부</label></th>
										<td colspan="3"><%=CodeUtil.getSecession(data.getSecession())%></td>
									</tr> 
									
								
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
									<%-- <a class="btns" href="<%=param.getTargetURLParam("pwedit", param, data.getNo())%>"><strong>비밀번호 수정</strong></a> --%>
									<!-- <a class="btns" href="#" id="delBtn">onClick="goDelete();<strong>회원탈퇴</strong></a> -->
									<a class="btns" href="<%=param.getTargetURLParam("memberDelete", param, data.getNo())%>" ><strong>회원탈퇴</strong></a>
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