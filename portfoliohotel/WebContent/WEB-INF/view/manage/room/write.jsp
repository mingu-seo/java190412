<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%
RoomVO param = (RoomVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
jQuery(window).load(function(){
	oEditors = setEditor("instruction"); // 에디터 셋팅
});

function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			document.frm.submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}

function goDelete(v) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process?no="+v+"&cmd=delete";
	}
}

function goSave() {
	if($("#name").val() == ""){
		alert('객실 종류를 입력하세요.');
		$("#name").focus();
		return false;
	}
	if($("#price").val() == ""){
		alert('객실 가격을 입력하세요.');
		$("#price").focus();
		return false;
	}
	if($("#count").val() == ""){
		alert('객실 수량을 입력하세요.');
		$("#count").focus();
		return false;
	}
	if($("#adult").val() == ""){
		alert('성인(기본정원)을 입력하세요.');
		$("#adult").focus();
		return false;
	}
	if($("#kid").val() == ""){
		alert('어린이(기본정원)을 입력하세요.');
		$("#kid").focus();
		return false;
	}
	
	var sHTML = oEditors.getById["instruction"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('객실 정보를 입력하세요.');
		$("#instruction").focus();
		return false;
	} else {
		oEditors.getById["instruction"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	
	if($("#checkin_time").val() == ""){
		alert('체크인 시간을 입력하세요.');
		$("#checkin_time").focus();
		return false;
	}
	if($("#checkout_time").val() == ""){
		alert('체크아웃 시간을 입력하세요.');
		$("#checkout_time").focus();
		return false;
	}
	if($("#location").val() == ""){
		alert('객실 위치를 입력하세요.');
		$("#location").focus();
		return false;
	}
	if($("#landscape").val() == ""){
		alert('객실 전망을 입력하세요.');
		$("#landscape").focus();
		return false;
	}
	if($("#type").val() == ""){
		alert('객실 타입을 입력하세요.');
		$("#type").focus();
		return false;
	}	
	
	return true;
	/* $("#frm").submit(); */
}

</script>
<title>관리자 객실 등록</title>
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
					<h2>객실 관리 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th>객실 종류</th>
										<td colspan="5"><input type="text" id="name" name="name" class="w50" /></td>
									</tr>
									<tr>
										<th>객실 가격</th>
										<td colspan="2"><input type="text" id="price" name="price" class="w25" /></td>
										<th>객실 수량</th>
										<td colspan="2"><input type="text" id="count" name="count" class="w25" /></td>
									</tr>
									<tr>
										<th>성인(기본정원)</th>
										<td colspan="2"><input type="text" id="adult" name="adult" class="w25" /></td>
										<th>어린이(기본정원)</th>
										<td colspan="2"><input type="text" id="kid" name="kid" class="w25" /></td>
									</tr>
									
									<tr>
										<th scope="row" rowspan="2"><label for="">객실 이미지</label></th>
									<%
									for(int i=0; i<5; i++){
									%>	
										<td><input type="file" id="image_tmp<%=i %>" name="image_tmp<%=i %>" class="w100" /></td>
									<%
									}
									%>
									<tr>
									<%
									for(int i=5; i<10; i++){
									%>	
										<td><input type="file" id="image_tmp<%=i %>" name="image_tmp<%=i %>" class="w100" /></td>
									<%
									}
									%>	
									</tr>
									</tr>
									<tr>
										<th>객실 소개</th>
										<td colspan="5"><textarea id="instruction" name="instruction" style="width:100%;"></textarea></td>
									</tr>
									<tr>
										<th>체크인 시간</th>
										<td colspan="2"><input type="text" id="checkin_time" name="checkin_time" class="w25" /></td>
										<th>체크아웃 시간</th>
										<td colspan="2"><input type="text" id="checkout_time" name="checkout_time" class="w25" /></td>
									</tr>
									<tr>
										<th>객실 위치</th>
										<td colspan="5"><input type="text" id="location" name="location" class="w50" /></td>
									</tr>
									<tr>
										<th>객실 전망</th>
										<td colspan="2"><input type="text" id="landscape" name="landscape" class="w50" /></td>
										<th>객실 타입</th>
										<td colspan="2"><input type="text" id="type" name="type" class="w50" /></td>
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