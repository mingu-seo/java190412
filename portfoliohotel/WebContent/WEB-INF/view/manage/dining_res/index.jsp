<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dining_res.*"%>
<%@ page import="property.SiteProperty"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	Dining_resVO param = (Dining_resVO) request.getAttribute("vo");
	ArrayList<Dining_resVO> list = (ArrayList) request.getAttribute("list");
	int totCount = (Integer) request.getAttribute("totCount");
	int totPage = (Integer) request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
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
		document.location.href = "process.do?no="+v+"&cmd=delete";
	}
}

function goSearch() {
	$("#searchForm").submit();
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>다이닝 예약 관리- [목록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="blist">
								<p>
									<span><strong>총 <%=totCount%>개
									</strong> | <%=param.getReqPageNo()%>/<%=totPage%>페이지</span>
								</p>
								<form name="frm" id="frm" action="process.do" method="post">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="관리자 관리목록입니다.">
										<colgroup>
											<col class="w1" />
											<col class="w1" />
											<col class="w3" />
											<col class="w3" />
											<col class="w3" />
											<col class="w2" />
											<col class="w2" />
											<col class="w2" />
											<col class="w1" />
										</colgroup>

										<thead>
										
											<tr>
												<th scope="col" class="first"><input type="checkbox"
													name="allChk" id="allChk"
													onClick="check(this, document.frm.no)" /></th>
												<th scope="col">번호</th>
												<th scope="col">예약날짜</th>
												<th scope="col">회원명</th>
												<th scope="col">다이닝명</th>
												<th scope="col">인원(성인)</th>
												<th scope="col">인원(어린이)</th>
												
												<th>
												<% if ("regdate_asc".equals(param.getOrderCond())) { %>
													<a href="index?orderCond=regdate_desc">예약일↑</a>
												<% } else if ("regdate_desc".equals(param.getOrderCond())) {%>
													<a href="index?orderCond=regdate_asc">예약일↓</a>
												<% } else { %>
													<a href="index?orderCond=regdate_asc">예약일↓</a>
												<% } %>
												</th>
													
												<th scope="col" class="last">삭제</th>
											</tr>
										</thead>
										<tbody>
											<%
												if (totCount == 0) {
											%>
											<tr>
												<td class="first" colspan="9">등록된 글이 없습니다.</td>
											</tr>
											<%
												} else {
													String targetUrl = "";
													String topClass = "";
													Dining_resVO data;
													for (int i = 0; i < list.size(); i++) {
														data = list.get(i);
														targetUrl = "style='cursor:pointer;' onclick=\"location.href='"
																+ param.getTargetURLParam("read", param, data.getNo()) + "'\"";
											%>
											<tr <%=topClass%>>
												<td class="first"><input type="checkbox" name="no"
													id="no" value="<%=data.getNo()%>" /></td>
												<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo() - 1) * param.getPageRows()) - i%></td>
												<td <%=targetUrl%> class="d_day"><%=data.getD_day()%></td>
												<td <%=targetUrl%> class="member_name"><%=data.getMember_name()%></td>
												<td <%=targetUrl%> class="dining_name"><%=data.getDining_name()%></td>
												<td <%=targetUrl%> class="adult"><%=data.getAdult()%></td>
												<td <%=targetUrl%> class="kid"><%=data.getKid()%></td>
												<td <%=targetUrl%> class="guest_regdate"><%=DateUtil.getDateTimeFormat(data.getRegdate())%></td>
												<td class="last"><input type="button" value="삭제"
													onclick="goDelete(<%=data.getNo()%>);" /></td>
											</tr>
											<%
												}
												}
											%>
										</tbody>
																			
									</table>
									
									<input type="hidden" name="cmd" id="cmd" value="groupDelete" />
									<input type="hidden" name="stype" id="stype"
										value="<%=param.getStype()%>" /> <input type="hidden"
										name="sval" id="sval" value="<%=param.getSval()%>" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong>
										</a>
									</div>
									<div class="btnRight">
										<a class="wbtn" href="write"><strong>등록</strong> </a>
									</div>
								</div>
								<!--//btn-->
								<!-- 페이징 처리 -->
								<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
								<!-- //페이징 처리 -->

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