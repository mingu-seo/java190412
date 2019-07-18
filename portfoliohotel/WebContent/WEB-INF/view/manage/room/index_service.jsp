<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ArrayList<Room_serviceVO> list = (ArrayList)request.getAttribute("list");
Room_serviceVO param = (Room_serviceVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			document.frm.submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}

function goDelete(no) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process_opt?no="+no+"&cmd=delete_opt";
	}
}

function goUpdate(x) {	
	if (confirm ('수정하시겠습니까?')) {
		$("#"+x).submit();
	}
}

function goSearch() {
	$("#searchForm").submit();
}

</script>
<title>관리자 객실 목록</title>
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
					<h2>객실 편의시설 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
	
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w30" />
									<col class="w30" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">편의시설명</th> 
										<th scope="col">적용 객실</th> 
										<th scope="col" class="last">수정</th>								 
										<th scope="col" class="last">삭제</th>
									</tr>
								</thead>
								<tbody>
									<%
									String targetUrl = "";
									String topClass = "";
									Room_serviceVO data;
									
									for (int i=0; i<list.size(); i++) {
										data = list.get(i);
										//targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";	
									%>
									<form id="frm<%=i %>" action="process_opt" method="post">
									<tr>
										<td><%=data.getNo()%></td>
										<td><input type="text" name="name" id="name" value="<%=data.getName()%>" class="w90"/></td>
										<td><input type="text" name="room_pk" id="room_pk" value="<%=CodeUtil.getRoomName(data.getRoom_pk())%>" class="w10"/></td>
										<td><input type="button" value="수정" onclick="goUpdate('frm<%=i%>');" /></td>
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
									</tr>
									<input type="hidden" id="no" name="no" value="<%=data.getNo()%>"/>
									<input type="hidden" id="cmd" name="cmd" value="edit_service"/>
									</form>									
								<%
										}
								%>
								</tbody>
							</table>

							<div class="btn">
								<div class="btnRight">
									<a class="wbtn" href="write_service"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<%-- <form name="searchForm" id="searchForm" action="index" method="post">
								<div class="search">
									<select name="sdisplay" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getSdisplay(), -1)%>>전체</option>
										<option value="0" <%=Function.getSelected(param.getSdisplay(), 0)%>>숨김</option>
										<option value="1" <%=Function.getSelected(param.getSdisplay(), 1)%>>노출</option>
									</select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>작성자</option>
										<option value="email" <%=Function.getSelected(param.getStype(), "email") %>>이메일</option>
										<option value="memo" <%=Function.getSelected(param.getStype(), "memo") %>>내용</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search -->  --%>
						</div>
						<!-- //blist -->
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