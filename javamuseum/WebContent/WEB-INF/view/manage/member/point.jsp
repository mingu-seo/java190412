<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%
PointVO param = (PointVO)request.getAttribute("vo");
MemberVO mparam = (MemberVO)request.getAttribute("mvo");

ArrayList<PointVO> list = (ArrayList)request.getAttribute("list");

int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
</head>
<script>
function goSave() {
	$("#frm").submit();
}
</script>
<body> 
		
<!--//wrap -->
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
				<h2><%=mparam.getName()%>님의 포인트내역 - [현재 포인트: <%=mparam.getPoint()%>]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<form name="frm" id="frm" action="process.do" method="post">
					<select name="state">
						<%=CodeUtil.getPointOption(0) %>
					</select>
					금액: <input type="text" id="accum" name="accum"/>&nbsp
					내용: <input type="text" id="memo" name="memo"/>&nbsp
					<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<table width="1000px" border="0" cellspacing="0" cellpadding="0" summary="포인트내역입니다.">
								<colgroup>
									<col class="w10" />
									<col class="w10" />
									<col class="w20" />
									<col class="w30" />
									<col class="w30" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">구분</th>
										<th scope="col">금액</th>
										<th scope="col">내용</th>
										<th scope="col" class="last">일자</th>
									</tr>
								</thead>
								<tbody>
									<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="10">등록된 자료가 없습니다.</td>
									</tr>
								<%
									 } else {
										for (int i=0; i<list.size(); i++) {
								%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										<td><%=CodeUtil.getPointName(list.get(i).getState())%></td>
										<td><%=list.get(i).getAccum()%></td>
										<td><%=list.get(i).getMemo()%></td>
										<td><%=DateUtil.getDateTimeFormat(list.get(i).getRegistdate())%></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="pointwrite"/>
							<input type="hidden" name="member_pk" value="<%=param.getMember_pk()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="point?member_pk=<%=mparam.getNo() %>" method="post">
								<div class="search">
									<select name="state" onchange="$('#searchForm').submit();">
										<option value="2" <%=Function.getSelected(param.getState(), 2)%>>전체</option>
										<option value="0" <%=Function.getSelected(param.getState(), 0)%>>적립</option>
										<option value="1" <%=Function.getSelected(param.getState(), 1)%>>사용</option>
									</select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="accum" <%=Function.getSelected(param.getStype(), "accum") %>>금액</option>
										<option value="memo" <%=Function.getSelected(param.getStype(), "memo") %>>내용</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />&nbsp
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
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