<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.faq.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.*" %>
<%
FaqVO param = (FaqVO)request.getAttribute("vo");
FaqVO data = (FaqVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("contents"); // 에디터 셋팅
});

function goSave() {
	if ($("#title").val() == "") {
		alert("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}
	if ($("#contents").val() == "") {
		alert("내용을 입력해주세요.");
		$("#contents").focus();
		return false;
	} else {
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
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
					<h2>FAQ관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>FAQ 기본 정보</h3>
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
									<tr>
										<th scope="row"><label for="">카테고리</label></th>
										<td>
										<select name="category">
											<option value="1" ${data.category == 1 ? "selected" : "" }
											<%-- <%
											if(data.getMember() == 1) {
												out.print("selected");}
											 %> --%>
											>에약</option>
											<option value="2" ${data.category == 2 ? "selected" : "" }
											<%-- <% 
											if(data.getMember() == 2) {
												out.print("selected");}
											%> --%>
											>결제</option>
										</select>
										</td>
										<th scope="row"><label for="">노출</label></th>
										<td>
										<select name="display">
											<option value="1" ${data.display == 1 ? "selected" : "" }
											>노출</option>
											<option value="2" ${data.display == 2 ? "selected" : "" }
											>숨김</option>
										</select>
										</td>
									</tr>
										<th scope="row"><label for="">질문</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" value="<%=data.getTitle()%>"/>
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">답변</label></th>
										<td colspan="4">
											<textarea id="contents" name="contents" title="답변을 입력해주세요" style="width:100%" ><%=data.getContents()%></textarea>
										</td>
									</tr>
								</tbody>
							<table id="optTable" width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%"/>
									<col width="35%"/>
								</colgroup>
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