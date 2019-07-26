<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="util.*" %>
<%
ExhibitionVO param = (ExhibitionVO)request.getAttribute("vo");
ArrayList<ExhibitionVO> list = (ArrayList)request.getAttribute("list");
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

/* function disState() {
	var disFrm = document.getElementById('searchForm');
	disFrm.submit();
} */

/* $('#dis_state').click(function() {
    $.ajax({
        type: "get",
        url: "/manage/exhibition/index",
        data: "state" : $('#dis_state').val()
        success: function() {
            console.log(3);
        }
    });
}); */

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
					<h2>전시 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 검색 조건 -->
					<div id="con_search">
						<form name="searchForm" id="searchForm" action="index" method="post">
								<div class="search" style="padding:0 550px;">
								<table border="1" cellspacing="0" cellpadding="2px" style="width:280px">
									<tr>
										<th>전시 상태</th>
										<td>&nbsp;
										<input type="checkbox" name="sstate" value="1" <%=Function.getChecked1(param.getSstate(), 1)%>/>전시 대기
										<input type="checkbox" name="sstate" value="2" <%=Function.getChecked1(param.getSstate(), 2)%>/>전시 중
										<input type="checkbox" name="sstate" value="3" <%=Function.getChecked1(param.getSstate(), 3)%>/>전시 종료
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<select name="stype" title="검색을 선택해주세요">
											<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
											<option value="artist" <%=Function.getSelected(param.getStype(), "artist") %>>작가</option>
											<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
										</select>
										<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
										<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
										</td>
									</tr>
								</table>
								</div>
							</form>
					</div>
					<!-- //검색 조건 -->
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w5" />
									<col class="w10" />
									<col class="w5" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w5" />
									<col class="w8" />
									<col class="w10" />
									<col class="w10" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">이미지</th>
										<th scope="col">전시관</th>
										<th scope="col">제목</th>
										<th scope="col">작가</th>
										<th scope="col">좋아요</th>
										<th scope="col">평점</th>
										<th scope="col">전시 상태</th>
										<th scope="col" class="last">시작일</th>
										<th scope="col" class="last">종료일</th>
									</tr>
								</thead>
								<tbody>
								<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="12">등록된 자료가 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										for (int i=0; i<list.size(); i++) {
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, list.get(i).getNo())+"'\"";
								%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										<td <%=targetUrl%>><%=list.get(i).getNo()%></td>
										<td <%=targetUrl%>><img src="/upload/exhibition/<%=list.get(i).getImagename()%>" width="50px" height="50px" /></td>
										<td <%=targetUrl%>><%=list.get(i).getHallnumber()%></td>
										<td <%=targetUrl%>><%=list.get(i).getTitle()%></td>
										<td <%=targetUrl%>><%=list.get(i).getArtist()%></td>
										<td <%=targetUrl%>><%=list.get(i).getLike_cnt()%></td>
										<td <%=targetUrl%>><%=list.get(i).getScore()%></td>
										<td <%=targetUrl%>><%=CodeUtil.getStrDisState(list.get(i).getState())%></td>
										<td <%=targetUrl%>><%=list.get(i).getStartdate()%></td>
										<td <%=targetUrl%>><%=list.get(i).getEnddate()%></td>
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
							<input type="hidden" name="state" id="state" value="<%=param.getState()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write"><strong>새전시 등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
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