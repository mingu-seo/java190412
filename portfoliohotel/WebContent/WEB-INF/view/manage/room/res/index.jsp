<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="room.res.*" %>
<%@ page import="room.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ArrayList<Room_resVO> list = (ArrayList)request.getAttribute("list");
Room_resVO param = (Room_resVO)request.getAttribute("vo");
RoomVO rvo = (RoomVO)request.getAttribute("rvo");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<style>
.category, .search {
	width: 1826.88px;
	height: 36px;
	margin: 0 auto;
}

.search th {
	background: #2D2F34;
	color:#FFFFFF;
	border-color:#2D2F34;
}
.search td {
	padding-left:10px;
	padding-right:10px;
}
</style>
<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			$("#frm").submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해주세요.");
	}
}

function goDelete(no) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "/manage/room/res/process?no="+no+"&cmd=delete";
	}
}

function goSearch() {
	$("#searchForm").submit();
}

$(function(){
	$(".submenu").hide();
	$(".menu").mouseover(function(){
        $(this).find(".submenu").stop().slideDown();
    });
    $(".menu").mouseleave(function(){
        $(this).find(".submenu").stop().slideUp();
    });
    
    $("#scheckin, #scheckout").change(function(){
    	console.log($("#scheckin").val());
    	console.log($("#scheckout").val());
    });
});

</script>
<title>관리자 객실 목록</title>
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
					<h2>객실 예약 관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<br/>
				<div>
					<table class="category" border="1" bordercolor="black">
						<colgroup>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
							<th><a href="/manage/room/res/index?category=0">전체 예약</a></th>
							<th><a href="/manage/room/res/index?category=1">지난 예약</a></th>
							<th><a href="/manage/room/res/index?category=2">다가오는 예약</a></th>
							<th><a href="/manage/room/res/index?category=3">신청된 예약</a></th>
							<th><a href="/manage/room/res/index?category=4">취소된 예약</a></th>
						</tr>
					</table>
					<br/>
					<table class="search" border="1" bordercolor="black">
						<colgroup>
							<col width="10%"/>
							<col width="22%"/>
							<col width="10%"/>
							<col width="22%"/>
							<col width="10%"/>
							<col width="22%"/>
						</colgroup>
						<tr>
							<th>숙박기간</th>
							<td><input type="date" name="scheckin" id="scheckin"></input> ~ <input type="date" name="scheckout" id="scheckout"></input></td>
							<th>예약 상태</th>
							<td>
								<input type="radio" name="category" >지난 예약</input>
								<input type="radio" name="category" >다가오는 예약</input>
								<input type="radio" name="category" >신청된 예약</input>
								<input type="radio" name="category" >취소된 예약</input>
							</td>
							<th>검색</th>
							<td>
								<select>
									<option name="all">전체</option>
									<option name="guest_kname">고객 한글명</option>
									<option name="guest_ename">고객 영문명</option>
									<option name="guest_email">고객 이메일</option>
									<option name="room_name">객실명</option>
								</select>
								<input type="text" id="search" name="search"></input>
								<img src="/manage/img/btn_search.gif"/>
							</td>
						</tr>
					</table>
				</div>
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="/manage/room/res/process" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w10" />
									<col class="w10" />
									<col class="w8" />
									<col class="w20" />
									<col class="w5" />
									<col class="w5" />
									<col class="w5" />
									<col class="w10" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">체크인</th> 
										<th scope="col">체크아웃</th> 
										<th scope="col">예약 고객</th> 
										<th scope="col">객실</th> 
										<th scope="col">인원_성인</th> 
										<th scope="col">인원_어린이</th> 
										<th scope="col">예약 상태</th> 
										<th scope="col">예약일</th> 
										<th scope="col"></th> 
									</tr>
								</thead>
								<tbody>
									<%
									String targetUrl = "";
									String topClass = "";
									Room_resVO data;
									
									for (int i=0; i<list.size(); i++) {
										data = list.get(i);
										targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";	
									%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<td><%=data.getNo()%></td>
										<td><%=data.getCheckin() %></td>
										<td><%=data.getCheckout() %></td>
										<td <%=targetUrl%>><%=data.getGuest_kname() %></td>
										<td><%=data.getRoom_name() %></td>
										<td><%=data.getAdult() %></td>
										<td><%=data.getKid() %></td>
										<%
										if(data.getRes_state() == 0) {
										%>
										<td style="color:#ff0000"><%=CodeUtil.getResState(data.getRes_state()) %></td>
										<%
										} else {
										%>
										<td style="color:#0000ff"><b><%=CodeUtil.getResState(data.getRes_state()) %></b></td>
										<%
										}
										%>
										<td <%=targetUrl%>><%=data.getBookdate() %></td>
										<td class="last"><input type="button" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/></td>
									</tr>
								<%
										}
								%>
								</tbody>
							</table>
							<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
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