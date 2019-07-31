<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="pkg.*" %>
<%@ page import="util.*" %>
<%
	PkgVO param = (PkgVO)request.getAttribute("vo");
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
										<th scope="row"><label for="">운영기간 시작일</label></th>
										<td>
											<input type="text" id="startdate" name="startdate" class="inputTitle" value=""/>&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cusor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">운영기간 종료일</label></th>
										<td>
											<input type="text" id="enddate" name="enddate" class="inputTitle" value=""/>&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cusor:pointer;"/>
											</span>
										</td>
									<tr>
										<th scope="row"><label for="">가격</label></th>
										<td colspan="3">
											<input type="text" id="price" name="price" class="w20"/>
										</td>
									</tr>										
									<tr>
										<th scope="row"><label for="">포함내역</label></th>
										<td colspan="3">
											<textarea id="pkg" name="pkg" style="width:100%"></textarea>
										</td>
									</tr>						
									<tr>
										<th scope="row"><label for="">이벤트</lavel></th>
										<td colspan="3">
											<input type="text" id="event" name="event" class="w40"/>
										</td>
									<tr>
										<th scope="row"><label for="">안내</label></th>
										<td colspan="3">
											<input type="text" id="guide" name="guide" class="w40"/>
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