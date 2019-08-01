<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="util.*" %>
<%@ page import="manage.exhibition.*" %>
<%
TicketVO param = (TicketVO)request.getAttribute("param");
ArrayList<TicketVO> list = (ArrayList)request.getAttribute("list");
ArrayList<ExhibitionVO> ingList = (ArrayList)request.getAttribute("ingList");
ArrayList<ExhibitionVO> exList = (ArrayList)request.getAttribute("exList");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
jQuery(window).load(function(){
	initCal({id:"startdate1",type:"day",today:"y"});  
	initCal({id:"enddate1",type:"day",today:"y"});
	initCal({id:"startdate2",type:"day",today:"y"});  
	initCal({id:"enddate2",type:"day",today:"y"});
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

function disState() {
	var disFrm = document.getElementById('dis_state');
	disFrm.submit();
}

function reserveCan(no, member_pk, idx) {
	if(confirm("예매를 취소하시겠습니까?") == true){
		$.ajax({
			type : "post",
			url : "/reserve/update?no="+no+"&member_pk="+member_pk,
			data : {
				reservestate : 2
				},
			async : false,
			success : function(data) {
				alert("예매가 취소되었습니다.");
				$("#reserve_can").remove();
				$(".cancel_date").eq(idx).text("<%=DateUtil.getToday()%>");
			}
		});
	}
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
					<h2>예매 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<!-- 전시 상태 선택 -->
							<form name="searchForm" id="searchForm" action="index" method="post">
								<div class="search" style="width:100%;">
								<table style="width:800px; border-right:1px solid #cccdd0; margin:0 auto;">
									<tr>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">예매일</th>
										<td width="50%">
											<input type="text" id="startdate1" name="startdate1" style="width:110px;" value="<%=Function.getText(param.getStartdate1())%>" readonly/>&nbsp;
											<span id="Calstartdate1Icon">
												<img src="/manage/img/calendar_icon.png" id="Calstartdate1IconImg" style="cursor:pointer;"/>
											</span>
											&nbsp;~&nbsp;
											 <input type="text" id="enddate1" name="enddate1" style="width:110px;" value="<%=Function.getText(param.getEnddate1()) %>" readonly/>&nbsp;
											<span id="Calenddate1Icon">
												<img src="/manage/img/calendar_icon.png" id="Calenddate1IconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">예매 상태</th>
										<td>
											<input type="radio" name="resStateSave" value="1" style="width:15px; height:15px;" <%=Function.getChecked(param.getResStateSave(), 1)%> ondblclick="this.checked=false"/>예매 완료&nbsp;
											<input type="radio" name="resStateSave" value="2" style="width:15px; height:15px;" <%=Function.getChecked(param.getResStateSave(), 2)%> ondblclick="this.checked=false"/>예매 취소
										</td>
									</tr>
									<tr>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">결제일</th>
										<td width="50%">
											<input type="text" id="startdate2" name="startdate2" style="width:110px;" value="<%=Function.getText(param.getStartdate2())%>" readonly/>&nbsp;
											<span id="Calstartdate2Icon">
												<img src="/manage/img/calendar_icon.png" id="Calstartdate2IconImg" style="cursor:pointer;"/>
											</span>
											&nbsp;~&nbsp;
											 <input type="text" id="enddate2" name="enddate2" style="width:110px;" value="<%=Function.getText(param.getEnddate2())%>" readonly/>&nbsp;
											<span id="Calenddate2Icon">
												<img src="/manage/img/calendar_icon.png" id="Calenddate2IconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">결제 상태</th>
										<td>
											<input type="radio" name="payStateSave" value="1" style="width:15px; height:15px;" <%=Function.getChecked(param.getPayStateSave(), 1)%> ondblclick="this.checked=false"/>결제 완료&nbsp;
											<input type="radio" name="payStateSave" value="2" style="width:15px; height:15px;" <%=Function.getChecked(param.getPayStateSave(), 2)%> ondblclick="this.checked=false"/>결제 대기
										</td>
									</tr>
									<tr>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">관람 작품</th>
										<td>
											<select name="display_pk" style="width:300px">
												<option value="0">전체</option>
												<option value="0" disabled>----------------------전시중인 작품----------------------</option>
												<%for(int i = 0; i < ingList.size(); i++){ %>
												<option value="<%=ingList.get(i).getNo()%>" <%=Function.getSelected(param.getDisplay_pk(), ingList.get(i).getNo())%>>[<%=i+1%>관] <%=ingList.get(i).getTitle()%></option>
												<%} %>
												<option value="0" disabled>-------------------지난 작품, 대기 작품------------------</option>
												<%for(int i = 0; i < exList.size(); i++){%>
												<option value="<%=exList.get(i).getNo()%>" <%=Function.getSelected(param.getDisplay_pk(), exList.get(i).getNo())%>><%=exList.get(i).getTitle()%></option>
												<%} %>
											</select>
										</td>
										<th style="width:15%; background-color:#eeeff0; border:1px solid #cccdd0;">결제 방식</th>
										<td>
											&nbsp;&nbsp;<input type="radio" name="meth" value="bank" style="width:15px; height:15px;" <%=Function.getChecked1(param.getMeth(), "bank")%> ondblclick="this.checked=false"/>무통장입금
											&nbsp;<input type="radio" name="meth" value="card" style="width:15px; height:15px;" <%=Function.getChecked1(param.getMeth(), "card")%> ondblclick="this.checked=false"/>카드 결제										
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<select name="stype" title="검색을 선택해주세요">
												<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
												<option value="id" <%=Function.getSelected(param.getStype(), "id") %>>회원 ID</option>
												<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>작품</option>
											</select>
											<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
											<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
											<input type="button" value="초기화" style="width:60px; height:23px; float:right;" onclick="location.href='/manage/ticket/index'"/>
										</td>
									</tr>
								</table>
								</div>
							</form>
							<!-- //전시 상태 선택 -->
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w5" />
									<col class="w8" />
									<col class="" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w8" />
									<col class="w8" />
									<col class="w8" />
									<col class="w8" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">회원 이름</th>
										<th scope="col">관람 작품</th>
										<th scope="col">관람일</th>
										<th scope="col" class="last">예매일</th>
										<th scope="col" class="last">예매취소일</th>
										<th scope="col">예매 상태</th>
										<th scope="col">결제 방법</th>
										<th scope="col">결제 상태</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
								<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="11">등록된 자료가 없습니다.</td>
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
										<td <%=targetUrl%>><%=list.get(i).getId()%></td>
										<td <%=targetUrl%>><%=list.get(i).getTitle()%></td>
										<td <%=targetUrl%>><%=list.get(i).getDisplaydate()%></td>
										<td <%=targetUrl%>><%=list.get(i).getPaydate()%></td>
										<td <%=targetUrl%> class="cancel_date"><%=list.get(i).getCanceldate()%></td>
										<td <%=targetUrl%>><%=CodeUtil.getResStateSave(list.get(i).getReservestate())%></td>
										<td <%=targetUrl%>><%=CodeUtil.getPaymentName(list.get(i).getMethod())%></td>
										<td <%=targetUrl%>><%=CodeUtil.getPayStateSave(list.get(i).getPaystate())%></td>
										<td>
											<%if(list.get(i).getReservestate() == 1){ %>
											<input type="button" id="reserve_can" name="reserve_can" value="예매취소" onclick="reserveCan(<%=list.get(i).getNo()%>, <%=list.get(i).getMember_pk()%>, <%=i %>)" style="cursor:pointer"/>
											<%} else { %>
											-
											<%} %>
										</td>
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