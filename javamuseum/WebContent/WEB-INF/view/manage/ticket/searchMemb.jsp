<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%@ page import="manage.exhibition.*" %>
<%
TicketVO param = (TicketVO)request.getAttribute("param");
ArrayList<ExhibitionVO> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<style>
	.insert_number {
		width:30px;
	}
</style>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		// 달력
		initCal({id:"displaydate",type:"day",today:"y"});
		initCal({id:"reservedate",type:"day",today:"y"});
		initCal({id:"paydate",type:"day",today:"y"});
		initCal({id:"canceldate",type:"day",today:"y"});
	});
	
	function goSave() {

		if ($("#id").val() == "") {
			alert('아이디를 입력하세요.');
			$("#id").focus();
			return false;
		}
		
		return true;
	}
	function searchMemb(){
		window.open("searchMemb", "회원 아이디 찾기", "width=600, height=700, left=100, top=50");
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
					<h2>예매내역 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="process" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">회원 아이디</label></th>
										<td colspan="3"><input type="text" name="id" value=""/>&nbsp;&nbsp;<input type="button" value="아이디 찾기" onclick="searchMemb()"/></td>
									</tr>
									<tr>
										<th scope="row"><label for="">전시관</label></th>
										<td>
											<select name="display_pk">
											<%for(int i = 0; i < list.size(); i++){ %>
												<option value='<%=list.get(i).getNo()%>'>[<%=i+1%>관] <%=list.get(i).getTitle()%></option>
											<%} %>
											</select>
										</td>
										<th scope="row"><label for="">관람일</label></th>
										<td>
											<input type="text" id="displaydate" name="displaydate" class="inputTitle" value="<%=DateUtil.getToday()%>" readonly/>&nbsp;
											<span id="CaldisplaydateIcon">
												<img src="/manage/img/calendar_icon.png" id="CaldisplaydateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row">인원</th>
										<td colspan="3">총 <input type="text" class="insert_number" name="number" value="0"/> 명  (노인: <input type="text" class="insert_number" name="old_number" value="0"/> 명 / 성인: <input type="text" class="insert_number" name="adult_number" value="0"/> 명 / 학생: <input type="text" class="insert_number" name="student_number" value="0"/> 명)</td>
									</tr>
									<tr>
										<th scope="row"><label for="">사용 포인트</label></th>
										<td><input type="text" name="usepoint" value="0"/></td>
										<th scope="row"><label for="">적립 포인트</label></th>
										<td><input type="text" name="storepoint" value="0"/>&nbsp;<span style="color:gray">(결제 금액의 5% 적립)</span></td>
									</tr>
									<tr>
										<th scope="row"><label for="">결제 수단</label></th>
										<td>
											<select name="method">
												<option value="bank">무통장</option>
												<option value="card">>신용카드</option>
											</select>
										</td>
										<th scope="row"><label for="">결제 금액</label></th>
										<td><input type="text" name="pay_price" value="0"/></td>
									</tr>
									<tr>
										<th scope="row"><label for="">예매일</label></th>
										<td>
											<input type="text" id="reservedate" name="reservedate" class="inputTitle" value="<%=DateUtil.getToday()%>" readonly/>&nbsp;
											<span id="CalreservedateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalreservedateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">예매 상태</label></th>
										<td>
											<select name="reservestate">
												<option value="1">예매완료</option>
												<option value="2">예매취소</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">결제일</label></th>
										<td>
											<input type="text" id="paydate" name="paydate" class="inputTitle" value="<%=DateUtil.getToday()%>" readonly/>&nbsp;
											<span id="CalpaydateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalpaydateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">결제 상태</label></th>
										<td>
											<select name="paystate">
												<option value="1">결제완료</option>
												<option value="2">결제대기</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">예매취소일</label></th>
										<td>
											<input type="text" id="canceldate" name="canceldate" class="inputTitle" value="<%=DateUtil.getToday()%>" readonly/>&nbsp;
											<span id="CalcanceldateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalcanceldateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">환불 상태</label></th>
										<td>
											<select name="refundstate">
												<option value="1">-</option>
												<option value="2">환불완료</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="cmd" id="cmd" value="write"/>
								<input type="hidden" name="no" id="no" value="<%=param.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onclick="$('#frm').submit();"><strong>저장</strong></a>
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