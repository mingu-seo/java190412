<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="pkg1.dining.*" %>
<%@ page import="java.util.*" %>
<%
PkgDiningVO param = (PkgDiningVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
/* var oEditors;
$(window).load(function() {
	oEditors = setEditor("set_contents");
}); */

function goSave() {
	if ($("#set_name").val() == "") {
		alert("세트이름을 입력해주세요.");
		$("#set_name").focus();
		return false;
	}
	if ($("#set_contents").val() == "") {
		alert("세트내용을 입력해주세요.");
		$("#set_contents").focus();
		return false;
	}
	$("#frm").submit();
}

$(function() {
	var trIdx = 0;
	$(".addBtn").click(function() {
		var trobj = "<tr class='addTr'";
		trobj += "<td><input type=\"text\" name=\"set_name\"/></td>";
		trobj += "<td><input type=\"text\" name=\"set_price\"/></td>";
		trobj += '<td><input type="button" value="삭제" class="delBtn"/></td>';
		trobj += "</tr>"; 
		$("#optTable").append(trobj);
		trIdx++;
		
		$(".delBtn").off("click");
		$(".delBtn").click(function() {
			var idx = $(".delBtn").index(this);
			$(".addTr").eq(idx).remove();
		});
	});
});

function delTr(addTr) {
	$("."+addTr).remove();
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
					<h2>관리자관리 - [쓰기]</h2>
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
									<col width="10%" />
									<col width="22%" />
									<col width="10%" />
									<col width="22%" />
									<col width="10%" />
									<col width="22%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">패키지 기간</label></th>
										<td colspan="5">
											<input type="text" id="period" name="period" value="" title="관리자 이름을 입력해주세요." class="w30"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">패키지 이용 시간</label></th>
										<td colspan="5">
											<input type="text" id="time_limit" name="time_limit" value="" title="관리자 이메일을 입력해주세요." class="w30" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">세트 이름</label><input type="button" value="추가" class="w20 addBtn"></input></th>
										<td>
											<input type="text" id="set_name" name="set_name" value="" title="세트 이름을 입력해주세요."/>
										</td>
										<th scope="row"><label for="">세트 가격</label></th>
										<td>
											<input type="text" id="set_price" name="set_price" value="" title=""/>
										</td>
										<th scope="row"><label for="">추천 인원</label></th>
										<td>
											<select name="set_personnel">
												
												<option value="1">1인</option>
												<option value="2">2인</option>
												<option value="3">3인</option>
												<option value="4">4인</option>
												<option value="5">5인</option>
											</select>
										</td>
									<tr>
										<th scope="row"><label for="">세트 내용</label></th>
										<td colspan="5">
											<textarea id="set_contents" name="set_contents" value="" title="내용을 입력해주세요." class="w80"rows="5"></textarea>
										</td>
									</tr>
									</tr>
									<tr>
										<th scope="row"><label for="">장소</th>
										<td colspan="5"> 
											<input type="text" id="place" name="place" value="" class="w60"/>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
							<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="idcheck" id="idcheck" value="0"/>
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