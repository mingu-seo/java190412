<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
RoomVO read = (RoomVO)request.getAttribute("read");
RoomVO param = (RoomVO)request.getAttribute("vo");
ArrayList<HashMap> list = (ArrayList<HashMap>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
jQuery(window).load(function(){
	oEditors = setEditor("instruction"); // 에디터 셋팅
});

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

function goSave() {
	
	
	var sHTML = oEditors.getById["instruction"].getIR();
	if (sHTML == "" || sHTML == "<p><br></p>") {
		alert('제품 정보를 입력하세요.');
		$("#instruction").focus();
		return false;
	} else {
		oEditors.getById["instruction"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	
	return true;
	/* $("#frm").submit(); */
}

$(function(){		
	var trIdx = 0;		
	$(".addBtn").click(function(){
		var trObj = "<tr class='addTr'>";
		trObj += "	<td><input type=\"text\" name=\"name_s\"/></td>";
		trObj += "	<td><input type=\"button\" value=\"삭제\" class=\"delBtn\"/></td>";
		trObj += "</tr>";
		$("#table_s").append(trObj);
		trIdx++;
		
		$(".delBtn").off("click");
		$(".delBtn").click(function(){
			var idx = $(".delBtn").index(this);
			$(".addTr").eq(idx).remove();
		});
	});		
});

</script>
<title>관리자 객실 등록</title>
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
					<h2>객실 관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th>객실 종류</th>
										<td colspan="5"><input type="text" id="name" name="name" class="w50" value="<%=read.getName() %>"/></td>
									</tr>
									<tr>
										<th>객실 가격</th>
										<td colspan="2"><input type="text" id="price" name="price" class="w25" value="<%=read.getPrice() %>"/></td>
										<th>객실 수량</th>
										<td colspan="2"><input type="text" id="count" name="count" class="w25" value="<%=read.getCount() %>"/></td>
									</tr>
									<tr>
										<th>성인(기본정원)</th>
										<td colspan="2"><input type="text" id="adult" name="adult" class="w25" value="<%=read.getAdult() %>"/></td>
										<th>어린이(기본정원)</th>
										<td colspan="2"><input type="text" id="kid" name="kid" class="w25" value="<%=read.getKid() %>"/></td>
									</tr>
									<tr>
										<th scope="row" rowspan="2"><label for="">객실 이미지</label></th>
										<td>
											<% if (read.getImage1() == null || "".equals(read.getImage1())) { %>
											<input type="file" name="image_tmp1" id="image_tmp1" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org1(), "UTF-8"), read.getImage1()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org1()) %></a><br/>
														<input type="checkbox" id="image_chk1" name="image_chk1" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp1" id="image_tmp1" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage2() == null || "".equals(read.getImage2())) { %>
											<input type="file" name="image_tmp2" id="image_tmp2" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org2(), "UTF-8"), read.getImage2()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org2()) %></a><br/>
														<input type="checkbox" id="image_chk2" name="image_chk2" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp2" id="image_tmp2" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage3() == null || "".equals(read.getImage3())) { %>
											<input type="file" name="image_tmp3" id="image_tmp3" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org3(), "UTF-8"), read.getImage3()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org3()) %></a><br/>
														<input type="checkbox" id="image_chk3" name="image_chk3" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp3" id="image_tmp3" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage4() == null || "".equals(read.getImage4())) { %>
											<input type="file" name="image_tmp4" id="image_tmp4" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org4(), "UTF-8"), read.getImage4()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org4()) %></a><br/>
														<input type="checkbox" id="image_chk4" name="image_chk4" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp4" id="image_tmp4" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage5() == null || "".equals(read.getImage5())) { %>
											<input type="file" name="image_tmp5" id="image_tmp5" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org5(), "UTF-8"), read.getImage5()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org5()) %></a><br/>
														<input type="checkbox" id="image_chk5" name="image_chk5" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp5" id="image_tmp5" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
									</tr>
									<tr>
										<td>
											<% if (read.getImage6() == null || "".equals(read.getImage6())) { %>
											<input type="file" name="image_tmp6" id="image_tmp6" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org6(), "UTF-8"), read.getImage6()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org6()) %></a><br/>
														<input type="checkbox" id="image_chk6" name="image_chk6" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp6" id="image_tmp6" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage7() == null || "".equals(read.getImage7())) { %>
											<input type="file" name="image_tmp7" id="image_tmp7" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org7(), "UTF-8"), read.getImage7()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org7()) %></a><br/>
														<input type="checkbox" id="image_chk7" name="image_chk7" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp7" id="image_tmp7" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage8() == null || "".equals(read.getImage8())) { %>
											<input type="file" name="image_tmp8" id="image_tmp8" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org8(), "UTF-8"), read.getImage8()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org8()) %></a><br/>
														<input type="checkbox" id="image_chk8" name="image_chk8" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp8" id="image_tmp8" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage9() == null || "".equals(read.getImage9())) { %>
											<input type="file" name="image_tmp9" id="image_tmp9" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org9(), "UTF-8"), read.getImage9()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org9()) %></a><br/>
														<input type="checkbox" id="image_chk9" name="image_chk9" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp9" id="image_tmp9" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
										<td>
											<% if (read.getImage10() == null || "".equals(read.getImage10())) { %>
											<input type="file" name="image_tmp10" id="image_tmp10" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.ROOM_UPLOAD_PATH, 
															java.net.URLEncoder.encode(read.getImage_org10(), "UTF-8"), read.getImage10()) %>" target="_blank">
															<%= Function.checkNull(read.getImage_org10()) %></a><br/>
														<input type="checkbox" id="image_chk10" name="image_chk10" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="image_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="image_tmp10" id="image_tmp10" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>	
										</td>
									</tr>
									<tr>
										<th>객실 소개</th>
										<td colspan="5"><textarea id="instruction" name="instruction" style="width:100%;"><%=read.getInstruction() %></textarea></td>
									</tr>
									<tr>
										<th>체크인 시간</th>
										<td colspan="2"><input type="text" id="checkin_time" name="checkin_time" class="w25" value="<%=read.getCheckin_time() %>"/></td>
										<th>체크아웃 시간</th>
										<td colspan="2"><input type="text" id="checkout_time" name="checkout_time" class="w25" value="<%=read.getCheckout_time() %>"/></td>
									</tr>
									<tr>
										<th>객실 위치</th>
										<td colspan="5"><input type="text" id="location" name="location" class="w50" value="<%=read.getLocation() %>"/></td>
									</tr>
									<tr>
										<th>객실 전망</th>
										<td colspan="2"><input type="text" id="landscape" name="landscape" class="w25" value="<%=read.getLandscape() %>"/></td>
										<th>객실 타입</th>
										<td colspan="2"><input type="text" id="type" name="type" class="w25" value="<%=read.getType() %>"/></td>
									</tr>
								</tbody>
							</table>
							
							<table border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="15%" />
								</colgroup>
								<tbody>						
									<input type="button" value="추가" class="w5 addBtn"></input>
											
									<table id="table_s">
										<tr>
											<th>*편의시설</th>
											<th></th>
										</tr>
										<%
											if (list.size() == 0) {
										%>
										<tr>
											<td class="first" colspan="4">등록된 자료가 없습니다.</td>
										</tr>
										<%
											} else {
												for (int i = 0; i < list.size(); i++) {
													HashMap list_o = list.get(i);
										%>
										<tr class="addTr<%=i%>">
											<td><input type="text" name="name_s" value="<%=list_o.get("name_s")%>"/></td>
											<td><input type="button" value="삭제" onclick="delTr('addTr<%=i%>')"/></td>
										</tr>
										<%
												}
											}
										%>
									</table>									
								</tbody>
							</table>
							
							<input type="hidden" name="cmd" value="edit" />
							<input type="hidden" name="no" id="no" value="<%=param.getNo() %>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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