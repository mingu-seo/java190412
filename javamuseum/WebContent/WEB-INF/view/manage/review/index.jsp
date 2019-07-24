<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.review.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
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
					<h2>REVIEW- [목록]</h2>
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
									<col class="w4" />
									<col class="w4" />
									<col class="w6" />
									<col class="w6" />
									<col class="w6" />
									<col class="" />
									<col class="" />
									<col class="" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">전시이름</th>
										<th scope="col">이미지</th>
										<th scope="col">제목</th> 
										<th scope="col">내용</th>
										<th scope="col">평점</th>
										<th scope="col">조회수</th>
										<th scope="col">좋아요수</th> 
										<th scope="col">작성일</th> 
										<th scope="col" class="last">삭제</th>
									</tr>
								</thead>
								<tbody>
								<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="12">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										ReviewVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
								%>
									<tr <%=topClass%>>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>
										<td <%=targetUrl%> class="member"><%=data.getMember_pk()%></td>
										<td <%=targetUrl%> class="display"><%=data.getDisplay_pk()%></td>
										<td <%=targetUrl%> class="imagename"><%=data.getImagename()%></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle()%></td>
										<td <%=targetUrl%> class="contents"><%=data.getContents()%></td>
										<td <%=targetUrl%> class="score"><%=data.getReview_score()%></td>
										<td <%=targetUrl%> class="readno"><%=data.getReadno()%></td>
										<td <%=targetUrl%> class="like_cnt"><%=data.getLike_cnt()%></td>
										
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
										
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
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
									<a class="wbtn" href="write"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index" method="post">
								<div class="search">
									
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="id" <%=Function.getSelected(param.getStype(), "member") %>>아이디</option>
										<option value="display_pk" <%=Function.getSelected(param.getStype(), "display_pk") %>>전시회</option>
										<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
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