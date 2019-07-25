<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	DoctorVO param = (DoctorVO) request.getAttribute("vo");
	ArrayList<DoctorVO> list = (ArrayList) request.getAttribute("list");
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
		if (isSeleted(document.frm.no)) {
			if (confirm('삭제하시겠습니까?')) {
				document.frm.submit();
			}
		} else {
			alert("삭제할 항목을 하나 이상 선택해 주세요.");
		}
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
						<h2>의료진관리 - [목록]</h2>
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
										summary="제품 관리목록입니다.">
										<colgroup>
											<col class="w5" />
											<col class="w5" />
											<col class="w20" />
											<col class="w20" />
											<col class="w15" />
											<col class="w15" />
											<col class="" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first"><input type="checkbox"
													name="allChk" id="allChk"
													onClick="check(this, document.frm.no)" /></th>
												<th scope="col">번호</th>
												<th scope="col">이름</th>
												<th scope="col">연락처</th>
												<th scope="col">진료분야</th>
												<th scope="col">직급</th>
												<th scope="col" class="last"></th>
											</tr>
										</thead>
										<tbody>
											<%
												if (list.size() == 0) {
											%>
											<tr>
												<td class="first" colspan="8">등록된 회원이 없습니다.</td>
											</tr>
											<%
												} else {
													String targetUrl = "";
													for (int i = 0; i < list.size(); i++) {
														targetUrl = "style='cursor:pointer;' onclick=\"location.href='"
																+ param.getTargetURLParam("read", param, list.get(i).getNo()) + "'\"";
											%>
											<tr>
												<td class="first"><input type="checkbox" name="no"
													id="no" value="<%=list.get(i).getNo()%>" /></td>
												<td <%=targetUrl%>><%=list.get(i).getNo()%></td>
												<td <%=targetUrl%>><%=list.get(i).getName()%></td>
												<td <%=targetUrl%>><%=list.get(i).getTel()%></td>
												<td <%=targetUrl%>><%=CodeUtil.getDoctorDepartmentName(list.get(i).getDepartment())%>
												</td>
												<td <%=targetUrl%>><%=CodeUtil.getDoctorPositionName(list.get(i).getPosition())%>
												</td>

												<td>
													<div class="btnRight">
														<a class="btns"
															href="<%=param.getTargetURLParam("edit", param, list.get(i).getNo())%>"><strong>일정관리</strong></a>
													</div>
												</td>
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
										<a class="wbtn" href="write"><strong>글쓰기</strong> </a>
									</div>
								</div>
								<!--//btn-->
								<!-- 페이징 처리 -->
								<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
								<!-- //페이징 처리 -->
								<form name="searchForm" id="searchForm" action="index"
									method="post">
									<div class="search">
										<select name="department"
											onchange="$('#searchForm').submit();">
											<option value="0"
												<%=Function.getSelected(param.getDepartment(), 0)%>>전체</option>
											<option value="1"
												<%=Function.getSelected(param.getDepartment(), 1)%>>외과</option>
											<option value="2"
												<%=Function.getSelected(param.getDepartment(), 2)%>>내과</option>
											<option value="3"
												<%=Function.getSelected(param.getDepartment(), 2)%>>영상의학과</option>
											<option value="4"
												<%=Function.getSelected(param.getDepartment(), 2)%>>응급중환자센터</option>
										</select> <select name="stype" title="검색을 선택해주세요">
											<option value="all"
												<%=Function.getSelected(param.getStype(), "all")%>>전체</option>
											<option value="name"
												<%=Function.getSelected(param.getStype(), "name")%>>이름</option>
											<option value="tel"
												<%=Function.getSelected(param.getStype(), "tel")%>>연락처</option>
										</select> <input type="text" name="sval" value="<%=param.getSval()%>"
											title="검색할 내용을 입력해주세요" /> <input type="image"
											src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
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