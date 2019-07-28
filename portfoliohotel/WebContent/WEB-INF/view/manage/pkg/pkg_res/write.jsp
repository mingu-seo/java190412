<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="pkg.res.*" %>
<%@ page import="util.*" %>
<%
	Pkg_resVO param = (Pkg_resVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("pkg"); // 에디터 셋팅
		initCal({id:"startdate",type:"day",today:"y"});
		initCal({id:"enddate",type:"day",today:"y"});
	});
	
	function goSave() {
		if ($("#name").val() == "") {
			alert('이름을 입력하세요.');
			$("#name").focus();
			return false;
		}
		var sHTML = oEditors.getById["pkg"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('포함내역을 입력하세요.');
			$("#pkg").focus();
			return false;
		} else {
			oEditors.getById["pkg"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		
		$("#frm").submit();
		
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
					<h2>패키지 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<h3>패키지 작성</h3>
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">패키지 이름</label></th>
										<td colspan="3">
											<input type="text" id="name" name="name" class="w50" title="제목을 입력해주세요" />	
										</td>
									</tr>		
									<tr>
										<th scope="row"><label for="">사용일</label></th>
										<td>
											<input type="text" id="use_date" name="use_date" class="inputTitle" value=""/>&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cusor:pointer;"/>
											</span>
										</td>
									<tr>
										<th scope="row"><label for="">고객 한글명</label></th>
										<td colspan="3">
											<input type="text" id="guest_kname" name="guest_kname" class="w20"/>
										</td>
										<th scope="row"><label for="">고객 영문명</label></th>
										<td colspan="3">
											<input type="text" id="guest_ename" name="guest_ename" class="w20"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">고객 연락처</lavel></th>
										<td colspan="3">
											<input type="text" id="guest_tel" name="guest_tel" class="w20"/>
										</td>
										<th scope="row"><label for="">고객 이메일</label></th>
										<td colspan="3">
											<input type="text" id="guest_email" name="guest_email" class="w20"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">패키지 금액</label></th>
										<td>
											<input type="text" id="pkg_price" name="pkg_price" class="w20"/>
										</td>
										<th scope="row"><label for="">수량</label></th>
										<td>
											<input type="text" id="pkg_count" name="pkg_count" class="w20"/>
										</td>
										<th scope="row"><label for="">총 결제 금액</label></th>
										<td>
											<input type="text" id="total_price" name="total_price" class="w20"/>
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
									<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
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