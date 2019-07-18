<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="room.*" %>
<%
Room_serviceVO vo = (Room_serviceVO)request.getAttribute("vo");
%>

<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
	function goSave(){
		if($("#name_s").val() == ""){
			alert('편의시설명을 입력하세요.');
			$("#name_s").focus();
			return false;
		}
	}
</script>
</head>
<body>

	<div>
		<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="">*편의시설명</label></th>
					<td colspan="3"><input type="text" id="name_s" name="name_s" class="w50" title="편의시설명을 입력해주세요" /></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="cmd" value="write"/>
		</form>
		<div class="btn">
			<div class="btnLeft">
				<a class="btns" href="/manage/room/read?no=<%=vo.getRoom_pk() %>"><strong>목록</strong></a>
			</div>
			<div class="btnRight">
				<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
			</div>
		</div>

	</div>

</body>
</html>