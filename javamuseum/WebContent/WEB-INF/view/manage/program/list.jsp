<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.program.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ProgramVO param = (ProgramVO)request.getAttribute("vo");
ArrayList<ProgramVO> list = (ArrayList)request.getAttribute("list");
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
	
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w8" />
									<col class="w30" />
									<col class="w10" />
									<col class="w15" />
									<col class="w8" />
									<col class="w15" />
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
										<th scope="col">포스터</th>
										<th scope="col">상태</th>
										<th scope="col" class="last">삭제</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first" colspan="10">등록된 글이 없습니다.</td>
									</tr>
								</tbody>
							</table>
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
			<%-- 				<%=Page.indexList(param.getReqPageNo(), totPage, request)%> --%>
							<!-- //페이징 처리 -->
<%-- 							<form name="searchForm" id="searchForm" action="index" method="post">
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
							</form> --%>
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