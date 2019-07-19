<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
RoomVO read = (RoomVO)request.getAttribute("read");
RoomVO param = (RoomVO)request.getAttribute("vo");
ArrayList<HashMap> list = (ArrayList<HashMap>)request.getAttribute("list");
ArrayList<HashMap> list_i = (ArrayList<HashMap>)request.getAttribute("list_i");
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
	var sHTML = oEditors.getById["instruction"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('제품 정보를 입력하세요.');
		$("#instruction").focus();
		return false;
	} else {
		oEditors.getById["instruction"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	
	return true;
	/* $("#frm").submit(); */
}

$(function(){		
	var trIdx = 0;		
	$(".addBtn").click(function(){
		var trObj = "<tr class='addTr'>";
		trObj += "	<td><input type=\"text\" name=\"name_s\"/></td>";
		trObj += "	<td><input type=\"button\" value=\"삭제\" class=\"delBtn\"/></td>";
		trObj += "</tr>";
		$("#table_s").append(trObj);
		trIdx++;
		
		$(".delBtn").off("click");
		$(".delBtn").click(function(){
			var idx = $(".delBtn").index(this);
			$(".addTr").eq(idx).remove();
		});
	});	
	
	var trIdx_i = 0;		
	$(".addBtn_i").click(function(){
		var trObj = "<tr class='addTr_i'>";
		trObj += "	<td><input type=\"file\" name=\"image_tmp\" multiple/></td>";
		trObj += "	<td><input type=\"button\" value=\"삭제\" class=\"delBtn_i\"/></td>";
		trObj += "</tr>";
		$("#table_i").append(trObj);
		trIdx_i++;
		
		$(".delBtn_i").off("click");
		$(".delBtn_i").click(function(){
			var idx = $(".delBtn_i").index(this);
			$(".addTr_i").eq(idx).remove();
		});
	});
	
});

function delTr_i(cls, no, imagename) {
	$.ajax({
		type : "GET",
		url : "/manage/room/delete_image?no="+no+"&image="+imagename,
		async : false,
		success : function(data){
			alert("정상적으로 삭제되었습니다.");
			$("."+cls).remove();
		}
	});
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
					<h2>객실 관리 - [수정]</h2>
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
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th>객실 종류</th>
										<td colspan="5"><input type="text" id="name" name="name" class="w50" value="<%=read.getName() %>"/></td>
									</tr>
									<tr>
										<th>객실 가격</th>
										<td colspan="2"><input type="text" id="price" name="price" class="w25" value="<%=read.getPrice() %>"/></td>
										<th>객실 수량</th>
										<td colspan="2"><input type="text" id="count" name="count" class="w25" value="<%=read.getCount() %>"/></td>
									</tr>
									<tr>
										<th>성인(기본정원)</th>
										<td colspan="2"><input type="text" id="adult" name="adult" class="w25" value="<%=read.getAdult() %>"/></td>
										<th>어린이(기본정원)</th>
										<td colspan="2"><input type="text" id="kid" name="kid" class="w25" value="<%=read.getKid() %>"/></td>
									</tr>
									<tr>
										<th>객실 소개</th>
										<td colspan="5"><textarea id="instruction" name="instruction" style="width:100%;"><%=read.getInstruction() %></textarea></td>
									</tr>
									<tr>
										<th>체크인 시간</th>
										<td colspan="2"><input type="text" id="checkin_time" name="checkin_time" class="w25" value="<%=read.getCheckin_time() %>"/></td>
										<th>체크아웃 시간</th>
										<td colspan="2"><input type="text" id="checkout_time" name="checkout_time" class="w25" value="<%=read.getCheckout_time() %>"/></td>
									</tr>
									<tr>
										<th>객실 위치</th>
										<td colspan="5"><input type="text" id="location" name="location" class="w50" value="<%=read.getLocation() %>"/></td>
									</tr>
									<tr>
										<th>객실 전망</th>
										<td colspan="2"><input type="text" id="landscape" name="landscape" class="w25" value="<%=read.getLandscape() %>"/></td>
										<th>객실 타입</th>
										<td colspan="2"><input type="text" id="type" name="type" class="w25" value="<%=read.getType() %>"/></td>
									</tr>
								</tbody>
							</table>
							
							<table border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="15%" />
								</colgroup>
								<tbody>						
									<input type="button" value="추가" class="w5 addBtn"></input>
									<tr>
										<td>
										
									<table id="table_s">
										<tr>
											<th>편의시설</th>
											<th></th>
										</tr>
										<%
											if (list.size() == 0) {
										%>
										<%
											} else {
												for (int i = 0; i < list.size(); i++) {
													HashMap data = list.get(i);
										%>
										<tr class="addTr<%=i%>">
											<td><input type="text" name="name_s" value="<%=data.get("name_s")%>"/></td>
											<td><input type="button" value="삭제" onclick="delTr('addTr<%=i%>')"/></td>
										</tr>
										<%
												}
											}
										%>
									</table>
										</td>
									</tr>										
								</tbody>
							</table>
							
							<table border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<td>			
											<input type="button" value="추가" class="w5 addBtn_i"></input>
										</td>
									</tr>	
									<tr>
										<td>
											<table id="table_i">
												<tr>
													<th>객실 이미지</th>
													<th></th>
												</tr>
												<%
													if (list_i.size() == 0) {
												%>
												<%
													} else {
														for (int i = 0; i < list_i.size(); i++) {
															HashMap data = list_i.get(i);
												%>
												<tr class="addTr_i<%=i%>">
													<td>
												<% if (data.get("image") == null || data.get("image") == "") { %>
													<input type="file" name="image_tmp" id="image_tmp" />
												<% } else { %>
															<p>기존파일 : <%= Function.checkNull((String)data.get("image")) %><br/>
																<input type="checkbox" id="image_chk" name="image_chk" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
																<label for="image_chk">기존파일삭제</label>
															</p>
															<input type="file" name="image_tmp" id="image_tmp" />
															<td><input type="button" value="삭제" onclick="delTr_i('addTr_i<%=i%>', <%=data.get("no")%>, '<%=data.get("image")%>')"/></td>
													<% } %>
													</td>	
												</tr>	
												<%
														}
													}
												%>
											</table>
										</td>
									</tr>								
								</tbody>
							</table>
							
							<input type="hidden" name="cmd" value="edit" />
							<input type="hidden" name="no" id="no" value="<%=param.getNo() %>"/>
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