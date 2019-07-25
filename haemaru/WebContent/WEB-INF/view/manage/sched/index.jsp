<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.doctor.sched.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	SchedVO param = (SchedVO) request.getAttribute("vo");
	ArrayList<SchedVO> list = (ArrayList) request.getAttribute("list");
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
						<h2>의료진 일정관리 - [목록]</h2>
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
											<col class="w15" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="w5" />
											<col class="" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col"class="first">번호</th>
												<th scope="col">이름</th>
												<th scope="col">일요일<br>시작시간 
												</th>
												<th scope="col">일요일<br>종료시간 
												</th>
												<th scope="col">월요일<br>시작시간
												</th>
												<th scope="col">월요일<br>종료시간
												</th>
												<th scope="col">화요일<br>시작시간
												</th>
												<th scope="col">화요일<br>종료시간
												</th>
												<th scope="col">수요일<br>시작시간
												</th>
												<th scope="col">수요일<br>종료시간
												</th>
												<th scope="col">목요일<br>시작시간
												</th>
												<th scope="col">목요일<br>종료시간
												</th>
												<th scope="col">금요일<br>시작시간
												</th>
												<th scope="col">금요일<br>종료시간
												</th>
												<th scope="col">토요일<br>시작시간
												</th>
												<th scope="col">토요일<br>종료시간
												</th>
												<th scope="col" class="last"></th>
											</tr>
										</thead>
										<tbody>
											<%
												if (list.size() == 0) {
											%>
											<tr>
												<td class="first" colspan="17">등록된 회원이 없습니다.</td>
											</tr>
											<%
												} else {
													String targetUrl = "";
													for (int i = 0; i < list.size(); i++) {
														targetUrl = "style='cursor:pointer;' onclick=\"location.href='"
																+ param.getTargetURLParam("read", param, list.get(i).getNo()) + "'\"";
											%>
											<tr>
												<td class="first"><%=list.get(i).getNo()%></td>
												<td><%=list.get(i).getName()%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getSun_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getSun_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getMon_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getMon_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getTue_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getTue_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getWed_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getWed_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getThu_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getThu_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getFri_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getFri_end())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getSat_start())%></td>
												<td><%=CodeUtil.getDoctorScheduleName(list.get(i).getSat_end())%></td>
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
								<!--//btn-->
								<!-- 페이징 처리 -->
								<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
								<!-- //페이징 처리 -->
								<form name="searchForm" id="searchForm" action="index"
									method="post">
									<div class="search">
										<select name="stype" title="검색을 선택해주세요">
											<option value="all"
												<%=Function.getSelected(param.getStype(), "all")%>>전체</option>
											<option value="name"
												<%=Function.getSelected(param.getStype(), "name")%>>이름</option>
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