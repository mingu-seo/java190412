<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dining_res.*" %>
<%@ page import="util.*" %>
<%
Dining_resVO param = (Dining_resVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
jQuery(window).load(function() {
	initCal({id:"d_day",type:"day",today:"y"});
});

function goSave() {
	
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
					<h2>다이닝 예약 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"  onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="5%" />
									<col width="25%" />
									<col width="5%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">예약날짜</label></th>
										<td>
											<input type="text" id="d_day" name="d_day" class="inputTitle" value="" title="예약날짜일을 입력해주세요" />&nbsp;
											<span id="Cald_dayIcon">
												<img src="/manage/img/calendar_icon.png" id="Cald_dayIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">예약시간</label></th>
										<td colspan="3">
											<input type="text" id="d_time" name="d_time" class="w5" title="예약시간을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">예약인원(성인)</label></th>
										<td colspan="3">
											<input type="text" id="adult" name="adult" class="w5" title="예약인원을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">예약인원(어린이)</label></th>
										<td colspan="3">
											<input type="text" id="kid" name="kid" class="w5" title="예약인원을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">투숙객 한글명</label></th>
										<td colspan="3">
											<input type="text" id="guest_kname" name="guest_kname" class="w10" title="투숙객 한글명을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">투숙객 영문명</label></th>
										<td colspan="3">
											<input type="text" id="guest_ename" name="guest_ename" class="w10" title="투숙객 영문명을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">투숙객 연락처</label></th>
										<td colspan="3">
											<input type="text" id="guest_tel" name="guest_tel" class="w10" title="투숙객 연락처를 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">투숙객 이메일</label></th>
										<td colspan="3">
											<input type="text" id="guest_email" name="guest_email" class="w15" title="이메일을 입력해주세요" />	
										</td>
									</tr>
									
									
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
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