<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.member.*" %>
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
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("memo"); // 에디터 셋팅
});

/* function goSave() {
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
} */
function goSave() {

	
	if ($("#fname").val() == "") {
		alert("성을 입력해주세요.");
		$("#fname").focus();
		return false;
	}
	if ($("#lname").val() == "") {
		alert("이름을 입력해주세요.");
		$("#lname").focus();
		return false;
	}
	if ($("#tel").val() == "") {
		alert("연락처를 입력해주세요.");
		$("#tel").focus();
		return false;
	}
	

	$("#frm").submit();  
}


</script>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:999;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
					<h2>관리자관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>관리자 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
								
									<tr>
										<%-- <th scope="row"><label for="">*이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="<%=nameArr[0]%> <%=nameArr[1] %>" title="관리자 이름을 입력해주세요." />
										</td> --%>
										<th scope="row"><label for="">*이름</label></th>
										<td >
											성<input type="text" style="width:50px; height:20px;" id="fname" name="name" value="" title="관리자 이름을 입력해주세요." />	
											이름<input type="text" style="width:80px; height:20px;" id="lname" name="name" value="" title="관리자 이름을 입력해주세요." />										
										</td>
										
									</tr>
									<th scope="row"><label for="">생년월일</label></th>
										<td colspan="3">
											<input type="text" style="width:100px;height:20px;" id="year" name="birthday" value="" title="관리자 이름을 입력해주세요.">년</input>
											<input type="text" style="width:50px; height:20px;" id="month" name="birthday" value="" title="관리자 이름을 입력해주세요.">월</input>
											<input type="text" style="width:50px; height:20px;" id="day" name="birthday" value="" title="관리자 이름을 입력해주세요.">일</input>
										</td>
									
									<tr>
										<th scope="row"><label for="">*연락처</label></th>
										<td>
											<input type="text" id="tel" name="tel" value="" title="관리자 이름을 입력해주세요." />
										</td>
									</tr>
									
									
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit">
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=param.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>찾기</strong></a>
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