<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dining.*" %>
<%@ page import="util.*" %>
<%
DiningVO param = (DiningVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("info"); // 에디터 셋팅
		initCal({id:"startdate",type:"day",today:"y"});
		initCal({id:"enddate",type:"day",today:"y"});
	});
	
	function goSave() {
		if ($("#name").val() == "") {
			alert('다이닝명을 입력하세요.');
			$("#name").focus();
			return false;
		}
		var sHTML = oEditors.getById["info"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#info").focus();
			return false;
		} else {
			oEditors.getById["info"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
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
					<h2>다이닝 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="5%" />
									<col width="25%" />
									<col width="5%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									
									<tr>
										<th scope="row"><label for="">다이닝명</label></th>
										<td colspan="3">
											<input type="text" id="name" name="name" class="w14" title="다이닝명을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">가격</label></th>
										<td colspan="3">
											<input type="text" id="price" name="price" class="w8" title="가격을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">다이닝 이미지</label></th>
										<td colspan="3">
											<input type="file" name="image_tmp" id="image_tmp" class="w50" title="첨부파일을 업로드 해주세요." />
										</td>	
									</tr>
									<tr>
										<th scope="row"><label for="">운영기간 시작일</label></th>
										<td>
											<input type="text" id="startdate" name="startdate" class="inputTitle" value="" title="운영기간 시작일을 입력해주세요" />&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">운영기간 종료일</label></th>
										<td>
											<input type="text" id="enddate" name="enddate" class="inputTitle" value="" title="운영기간 시작일을 입력해주세요" />&nbsp;
											<span id="CalenddateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalenddateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">예약 가능기간</label></th>
										<td colspan="3">
											<input type="text" id="book_period" name="book_period" class="w20" title="예약기간을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">포함내역</label></th>
										<td colspan="3">
											<input type="text" id="inclusion" name="inclusion" class="w50" title="포함내역을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">안내</label></th>
										<td colspan="4">
											<textarea id="info" name="info" title="내용을 입력해주세요" style="width:100%" ></textarea>
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