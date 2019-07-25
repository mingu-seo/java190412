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

<!-- <script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("memo"); // 에디터 셋팅
});

function goSave() {
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	$("#frm").submit();
}
</script>  -->

<script type="text/javascript">
	
	function goDelete() {
		if(!validPassword($("#password"))) return false;
		
		
		
		var del = confirm ('탈퇴하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
		
	}
</script>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:999;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>


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
					<h2>회원 탈퇴</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>회원 탈퇴</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									
									
									<col width="35%" />
								</colgroup>
								<tbody>
								
									<tr>
										<th scope="row"><label for="">비밀번호 입력</label></th>
										<td>
											<input type="password" id="password" style="width:200px; height:20px;" name="password" value="" title="관리자 이메일을 입력해주세요." />
											
										</td>										
									</tr>
									
								<tr>
									<th scope="row"><label for="">탈퇴 사유</label></th>
									<td>									
                               		  <select>
                                    	<option>탈퇴사유</option>
                                    	<option>더 이상 서비스를 사용하지 않음</option>
                                    	<option>서비스가 불편함</option>
                                    	<option>시스템 장애(속도 저조, 에러등)</option>
                                    	<option>장기간 부재(군 입대, 유학등)</option>
                                    	<option>기타사유</option>
                                	 </select>                                	 
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
									<!-- <a class="btns" href="#" onclick="goSave();"><strong>탈퇴하기</strong></a> -->
									<a class="btns" href="#" id="delBtn" onclick="goDelete();"><!-- onClick="goDelete(); --><strong>회원탈퇴</strong></a>
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