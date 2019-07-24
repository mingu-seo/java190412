<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.program.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ProgramVO param = (ProgramVO)request.getAttribute("vo");
ArrayList<ProgramVO> list = (ArrayList)request.getAttribute("list");
ArrayList<ArrayList<HashMap>> olist = (ArrayList<ArrayList<HashMap>>) request.getAttribute("olist");

int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
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

function goDelete(v) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process?no="+v+"&cmd=delete";
	}
}

function goSearch() {
	$("#searchForm").submit();
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
					<h2>프로그램 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w10" />
									<col class="w10" />
									<col class="w15" />
									<col class="w9" />
									<col class="w9" />
									<col class="w9" />
									<col class="w9" />
									<col class="w9" />
									<col class="w9" />
									<col class="w10" />
									<col class="w4" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">카테고리</th> 
										<th scope="col">제 목</th> 
										<th scope="col">강 사</th>
										<th scope="col">기 간</th>
										<th scope="col">신청인원</th>
										<th scope="col">가격</th>
										<th scope="col">포스터</th>
										<th scope="col">상태</th>
										<th scope="col">등록일</th>
										<th scope="col">프로그램일자</th>
										<th scope="col">프로그램시간</th>
										<th scope="col" class="last">삭제</th>
										
									</tr>
								</thead>
								<tbody>
								<% if (list.size() == 0) { %>	
									<tr>
										<td class="first" colspan="14">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										ProgramVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, list.get(i).getNo())+"'\"";
								%>
								
								
									<tr>
										<td class="first"rowspan=""><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										<td <%=targetUrl%>rowspan=""><%=data.getNo()%></td>
										<td <%=targetUrl%>rowspan=""><%=CodeUtil.getCategory(data.getCategory())%></td>
										<td <%=targetUrl%>rowspan=""><%=data.getTitle()%></td>
										<td <%=targetUrl%>rowspan="" ><%=data.getInstructor()%></td>
										<td <%=targetUrl%>rowspan=""><%=data.getP_time()%></td>
										<td <%=targetUrl%>rowspan="" >신청인원/<%=data.getMax_mem()%></td>
										<td <%=targetUrl%>rowspan=""><%=data.getPrice()%></td>
										<td <%=targetUrl%>rowspan=""><img src="/upload/program/<%=data.getImagename()%>" width="100" height="100"></td>
										<td <%=targetUrl%>rowspan=""><%=data.getState()%></td>
										<td <%=targetUrl%>rowspan=""><%=DateUtil.getDateTimeFormat(data.getRegistdate())%></td>
										<td>
										<table>
													<% for (int j=0; j<olist.get(i).size(); j++) { %>
										
													<tr>
														<td><%=olist.get(i).get(j).get("date") %></td>
														
													</tr>
	
													<% } %>
										</table>
										</td>
										<td>
										<table>
													<% for (int j=0; j<olist.get(i).size(); j++) { %>
										
													<tr>
														<td><%=olist.get(i).get(j).get("time") %></td>
														
													</tr>
	
													<% } %>
										</table>											
											</td>
										<td class = "last"rowspan=""><input type = "button" value="삭제" onclick="goDelete(<%=list.get(i).getNo()%>);"/></td>
									</tr>
								<%
									}
								}
								%>
								</tbody>
							</table>
							<input type="hidden" name="state" id="state" value="<%=param.getState()%>"/>
							<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="<%=param.getTargetURLParam("write", param, 0)%>"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
			 				<%=Page.indexList(param.getReqPageNo(), totPage, request)%> 
							<!-- //페이징 처리 -->
 							<form name="searchForm" id="searchForm" action="list" method="post">
								<div class="search">
									<select name="display" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getDisplay(), -1)%>>노출여부전체</option>
										<option value="0" <%=Function.getSelected(param.getDisplay(), 0)%>>숨김</option>
										<option value="1" <%=Function.getSelected(param.getDisplay(), 1)%>>노출</option>
									</select>
									<select name="state" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getCategory(), -1)%>>카테고리 전체</option>
										<option value="0" <%=Function.getSelected(param.getCategory(), 0)%>>아동</option>
										<option value="1" <%=Function.getSelected(param.getCategory(), 1)%>>청소년</option>
										<option value="2" <%=Function.getSelected(param.getCategory(), 2)%>>성인</option>
									</select>

									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
										<option value="instructor" <%=Function.getSelected(param.getStype(), "instructor") %>>강사</option>
										<option value="contents" <%=Function.getSelected(param.getStype(), "contents") %>>내용</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div> 
							</form> 
							<!-- //search --> 
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