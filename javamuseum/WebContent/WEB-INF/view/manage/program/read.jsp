<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="manage.program.*"%>
<%@ page import="java.util.*"%>
<%
	ProgramVO param = (ProgramVO) request.getAttribute("vo");
	ProgramVO data = (ProgramVO) request.getAttribute("data");
	ArrayList<HashMap> olist = (ArrayList<HashMap>) request.getAttribute("olist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">

   $(function(){
      $("#delBtn").click(function(){
         goDelete();
      });
   });
   
   function goDelete() {
      var del = confirm ('삭제하시겠습니까?');
      if (del){
         document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
      }
   }

   function reserve(date, time) {
	      var res = confirm ('프로그램을 신청하시겠습니까?');
	      if (res){
	         document.location.href = "reserve?no=<%=data.getNo()%>&title=<%=data.getTitle()%>&date="+date+"&time="+time;
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
						<h2>프로그램관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="프로그램 관리 기본내용입니다.">
									<colgroup>
										<col width="35%" />
										<col width="25%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<tbody>
									<td rowspan="<%=olist.size()+10 %>">
									<img src="/upload/program/<%=data.getImagename()%>" width="500" height="500">
									</td>
										<tr>
											<th scope="row"><label for="">번호</label></th>
											<td colspan="4"><%= data.getNo() %></td>
										</tr>
										<tr>
											<th scope="row"><label for="">대상</label></th>
											<td colspan="4"><%= data.getTarget() %></td>
										</tr>
										<tr>
											<th scope="row"><label for="">교육시간</label></th>
											<td colspan="4"><%= data.getP_time() %></td>
										</tr>
										<tr>
											<th scope="row"><label for="">교육비</label></th>
											<td colspan="4"><%= data.getPrice() %></td>
										</tr>
										<tr>
											<th scope="row"><label for="">강사명</label></th>
											<td colspan="4"><%=data.getInstructor()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">강의장소</label></th>
											<td colspan="4"><%=data.getLocation()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td colspan="4"><%=DateUtil.getDateTimeFormat(data.getRegistdate())%></td>
										</tr>
										<tr>
											<th>프로그램 기간</th>
											<td>프로그램 날짜</td>
											<td>프로그램 시간</td>
											<td>프로그램 신청인원</td>
											<td>프로그램 신청하기</td>
											
										</tr>
										
										<tr>
											<%
												for (int i = 0; i < olist.size(); i++) {
											%>
											<tr>
												<td><input type="checkbox" name="no" id="no"
													value="<%=olist.get(i).get("no")%>" /></td>
												<td><%=olist.get(i).get("date")%></td>
												<td><%=CodeUtil.getP_timeName((Integer)olist.get(i).get("time"))%></td>
												<td><%=olist.get(i).get("member_cnt") %> 명 / <%=data.getMax_mem() %> 명</td>
												<td>
												<%
												if(data.getMax_mem() > Integer.parseInt(String.valueOf(olist.get(i).get("member_cnt")))){ 
													String a = "'"+olist.get(i).get("date")+"'";
													
												%>	
												
												<input type="button" value="신청" onclick="reserve(<%=a%>, <%=olist.get(i).get("time")%>)"/>
												<%
												}
											%>
											</td>
											</tr>
											<%} %>
											<td></td>
										</tr>


										<tr>
											<th scope="row"colspan="6" ><label for="">상세정보</label></th>
										</tr>
										<tr>
										<td colspan="6"><%=data.getContents()%></td>
										</tr>

									</tbody>


								</table>


								<input type="hidden" name="program_pk" id="program_pk" value="<%=data.getNo()%>" />
								
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("list", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns"
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" id="delBtn"><strong>삭제</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="#" id="optiondelBtn"><strong>옵션
												삭제</strong></a>
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
					
					<!--//content -->
				</div>
				<!--//container -->
				<!-- E N D :: containerArea-->
			</div>
			<!--//canvas -->
		</div>
		<!--//wrap -->

		<script>
		function getReviewList(){
			$.ajax({
				type : "GET",
				url : "/manage/product/reviewList?no=<%=data.getNo()%>",
				async : false,
				success : function(data) {
				$(".reviewListArea").html(data);
				}
			});
		}
		
		
		$(function(){
			$("#reviewListBtn").click(function(){
				
				getReviewList();
		});

				$("#reviewInsertBtn").click(function() {

					if ($("#review_name").val() == "") {
						alert('이름을 입력하세요.');
						$("#review_name").focus();
						return false;
					}
					if ($("#review_contents").val() == "") {
						alert('리뷰을 입력하세요.');
						$("#review_contents").focus();
						return false;
					}
					var data= $("#reviewFrm").serialize();
					console.log(data);
					$.ajax({
						type : "POST",
						url : "/review/insert.do",
						data : data,
						async : false,
						success : function(data) {
							alert("정상적으로 추가되었습니다.");
							$("#review_name").val("");
							$("#review_contents").val("");
							getReviewList();
						}
					});
				});

			});
		
			
		function delReview(no) {
		   var del = confirm ('삭제하시겠습니까?');
			$.ajax({
				type : "POST",
				url : "/review/delete.do?no="+no,
				async : false,
				success : function() {
					alert("정상적으로 삭제되었습니다.");
					getReviewList();
				}
			});
		}
		</script>
</body>
</html>