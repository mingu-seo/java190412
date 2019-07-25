<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="java.util.*" %>
<%
ExhibitionVO param = (ExhibitionVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
jQuery(window).load(function(){
	oEditors = setEditor("contents"); // 에디터 셋팅
	initCal({id:"startdate",type:"day",today:"y"});  
	initCal({id:"enddate",type:"day",today:"y"});
});

function goSave() {
	if ($("#artist").val() == "") {
		alert('작가를 입력하세요.');
		$("#artist").focus();
		return false;
	}
	if ($("#title").val() == "") {
		alert('제목을 입력하세요.');
		$("#title").focus();
		return false;
	}
	
	var sHTML = oEditors.getById["contents"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('내용을 입력하세요.');
		$("#contents").focus();
		return false;
	} else {
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	return true;
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
					<h2>전시 관리 - [쓰기]1</h2>  
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>전시 기본 정보</h3>
							<form name="frm" id="frm" method="post" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">전시관</label></th>
										<td colspan="3">
											<select name="hallnumber">
												<option value='1' <%=Function.getSelected(1,param.getHallnumber()) %>>1</option>
												<option value='2' <%=Function.getSelected(2,param.getHallnumber()) %>>2</option>
												<option value='3' <%=Function.getSelected(3,param.getHallnumber()) %>>3</option>
												<option value='4' <%=Function.getSelected(4,param.getHallnumber()) %>>4</option>
												<option value='5' <%=Function.getSelected(5,param.getHallnumber()) %>>5</option>
												<option value='6' <%=Function.getSelected(6,param.getHallnumber()) %>>6</option>
												<option value='7' <%=Function.getSelected(7,param.getHallnumber()) %>>7</option>
												<option value='8' <%=Function.getSelected(8,param.getHallnumber()) %>>8</option>
												<option value='9' <%=Function.getSelected(9,param.getHallnumber()) %>>9</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" value="" title="전시 제목을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*작가</label></th>
										<td colspan="3">
											<input type="text" id="artist" name="artist" value="" title="작가 이름을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이미지 첨부파일</label></th>
										<td colspan="3">
											<input type="file" id="imagename_tmp" name="imagename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">시작일</label></th>
										<td>
											<input type="text" id="startdate" name="startdate" class="inputTitle" value="<%=DateUtil.getToday()%>" title="시작일을 입력해주세요" readonly/>&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">종료일</label></th>
										<td>
											<input type="text" id="enddate" name="enddate" class="inputTitle" value="<%=DateUtil.getToday()%>" title="종료일을 입력해주세요" readonly/>&nbsp;
											<span id="CalenddateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalenddateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">프리뷰 작성</label></th>
										<td colspan="3">
											<textarea id="preview" name="preview" title="프리뷰를 작성해주세요" style="width:100%; height:100px"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%" ></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
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