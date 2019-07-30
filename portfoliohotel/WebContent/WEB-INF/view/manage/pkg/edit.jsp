<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="pkg.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.*" %>
<%
PkgVO param = (PkgVO)request.getAttribute("vo");
PkgVO data = (PkgVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("pkg"); // 에디터 셋팅
	initCal<{id:"startdate",type:"day",today:"y"});
	initCal({id:"enddate",type:"dat",today:"y"});
});

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#pkg").val() == "") {
		alert("포함내역을 입력해주세요.");
		$("#pkg").focus();
		return false;
	} else {
		oEditors.getById["pkg"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}

	$("#frm").submit();
}

//$(function() {
	<%-- var trIdx = <%=olist.size()%>; --%>
	//$(".addBtn").click(function() {
		//var trobj = "<tr class='addTr"+trIdx+"'>";
		//trobj += "<td><input type=\"text\" name=\"title\"/></td>";
		//trobj += '<td><input type="text" name="optPrice"/></td>';
		//trobj += '<td><input type="button" value="삭제" onclick="delTr(\'addTr'+trIdx+'\')"/></td>';
		//trobj += "</tr>";
		//$("#optTable").append(trobj);
		//trIdx++;		
	//});
//});
//function delTr(addTr) {
	//$("."+addTr).remove();
//}

<%-- $(function() {
	var trIdx = <%=olist.size()%>;
	$(".addBtn").click(function() {
		var trobj = "<tr class='addTr'>";
		trobj += "<td><input type=\"text\" name=\"title\"/></td>";
		trobj += '<td><input type="text" name="optPrice"/></td>';
		trobj += '<td><input type="button" value="삭제" class="delBtn"/></td>';
		trobj += "</tr>";
		$("#optTable").append(trobj);
		trIdx++;		
		
		$(".delBtn").off("click"); // 중첩안되게
		$(".delBtn").click(function() {
			var idx = $(".delBtn").index(this);
			$(".addTr").eq(idx).remove(); // 선택한 인덱스만 삭제
		});
	});
}); --%>

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
					<h2>공지사항관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>공지사항 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post" enctype="multipart/form-data">
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
											<input type="text" id="name" name="name" value="<%=data.getName()%>"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">운영기간 시작일</label></th>
										<td>
										<input type="text" id="startdate" name="startdate" class="inputTitle" value=""/>&nbsp;
											<span id="CalstartdateIcon">
										<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">운영기간 종료일</label></th>
										<td>
										<input type="text" id="enddate" name="enddate" class="inputTitle" value=""/>&nbsp;
											<span id="CalstartdateIcon">
										<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>										
										<th scope="row"><label for="">포함내역</label></th>
										<td colspan="3">
											<input type="text" id="pkg" name="pkg" value="<%=data.getPkg() %>" style="width:100%"/>
										</td>
									</tr>
									<tr>										
										<th scope="row"><label for="">가격</label></th>
										<td colspan="3">
											<input type="text" id="price" name="price" value="<%=data.getPrice() %>"/>
										</td>
									</tr>
									<tr>										
										<th scope="row"><label for="">이벤트</label></th>
										<td colspan="3">
											<input type="text" id="event" name="event" value="<%=data.getEvent() %>"/>
										</td>
									</tr>		
									<tr>										
										<th scope="row"><label for="">안내</label></th>
										<td colspan="3">
											<input type="text" id="guide" name="guide" value="<%=data.getGuide() %>"/>
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