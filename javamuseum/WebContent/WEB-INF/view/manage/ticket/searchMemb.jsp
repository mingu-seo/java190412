<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
TicketVO param = (TicketVO)request.getAttribute("param");
ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<style>
	.insert_number {
		width:30px;
	}
</style>
<script>
	function selectBtn(id, no) {
		opener.document.getElementById("id").value = id;
		opener.document.getElementById("member_pk").value=no;
		window.close();
	}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
				<h2>회원 검색</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<form name="searchForm" id="searchForm" action="searchMemb" method="post">
						<div class="search">
							<select name="stype" title="검색을 선택해주세요">
								<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
								<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>이름</option>
								<option value="id" <%=Function.getSelected(param.getStype(), "id") %>>아이디</option>
							</select>
							<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />&nbsp;
							<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
						</div>
					</form>
					<form name="frm" id="frm" action="process.do" method="post">
					<!-- 내용 : s -->
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<table width="400px" border="2" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w10" />
									<col class="w10" />
									<col class="w20" />
									<col class="w30" />
									<col class="w30" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">회원 아이디</th>
										<th scope="col">회원 이름</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="4">일치하는 회원이 없습니다.</td>
									</tr>
								<%
									 } else {
										for (int i=0; i<list.size(); i++) {
								%>
									<tr style="text-align:center;">
										<td><%=i+1%></td>
										<td><%=list.get(i).getName()%></td>
										<td><%=list.get(i).getId()%></td>
										<td><input type="button" value="선택" onclick="selectBtn('<%=list.get(i).getId()%>', <%=list.get(i).getNo()%>)"/></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				</div>
				</div>
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>