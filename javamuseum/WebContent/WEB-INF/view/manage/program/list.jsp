<%@page import="com.sun.org.apache.bcel.internal.classfile.Code"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.program.*" %>
<%@ page import="manage.reservation.*" %>

<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ProgramVO param = (ProgramVO)request.getAttribute("param");
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
									<col class="w3" /> <!-- checkbox -->
									<col class="w3" /> <!-- 번호 -->
									<col class="w6" /> <!-- 카테고리 -->
									<col class="w10" /><!-- 포스터 -->
									<col class="w19" /><!-- 프로그램명 -->
									<col class="w5" /><!-- 강사 -->
									<col class="w5" /><!-- 가격 -->
									<col class="w5" /><!-- 상태 -->
									<col class="w5" /><!-- 등록일-->
									<col class="w5" /><!-- 삭제 -->
									<col class="w10" /><!-- 기간 -->
									<col class="w9" /><!-- 프로그램일자 -->
									<col class="w5" /><!-- 프로그램시간 -->
									<col class="w10" /><!-- 프로그램인원 -->
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">카테고리</th> 
										<th scope="col">포스터</th>
										<th scope="col">프로그램명</th> 
										<th scope="col">강 사</th>
										<th scope="col">가격</th>
										<th scope="col">상태</th>
										<th scope="col">등록일</th>
										<th scope="col" >삭제</th>
										<th scope="col">기 간</th>
										<th scope="col">프로그램일자</th>
										<th scope="col">프로그램시간</th>
										<th scope="col"class="last">신청인원</th>
										
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
										<td class="first"rowspan="<%=olist.get(i).size()%>"><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=data.getNo()%></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=CodeUtil.getCategory(data.getCategory())%></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><img src="/upload/program/<%=data.getImagename()%>" width="100" height="100"></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=data.getTitle()%></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>" ><%=data.getInstructor()%></td>
										
	
										
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=data.getPrice()%></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=data.getState()%></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=DateUtil.getDateTimeFormat(data.getRegistdate())%></td>
										<td rowspan="<%=olist.get(i).size()%>"><input type = "button" value="삭제" onclick="goDelete(<%=list.get(i).getNo()%>);"/></td>
										<td <%=targetUrl%>rowspan="<%=olist.get(i).size()%>"><%=data.getP_time()%></td>
												<% for (int j=0; j<olist.get(i).size(); j++) { %>
														<td <%=targetUrl%>rowspan="1"><%=olist.get(i).get(j).get("date") %></td>
														<td <%=targetUrl%>rowspan="1"><%=CodeUtil.getP_timeName((Integer)olist.get(i).get(j).get("time")) %></td>
														<td class = "last"<%=targetUrl%>rowspan="1" ><%=olist.get(i).get(j).get("member_cnt") %> 명/<%=data.getMax_mem()%> 명</td>
														</tr>
													<% } %>
									
									</tr>
								<%
									}
								}
								%>
								</tbody>
							</table>
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