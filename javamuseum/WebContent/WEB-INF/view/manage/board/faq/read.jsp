<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.faq.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
	FaqVO param = (FaqVO) request.getAttribute("vo");
	FaqVO data = (FaqVO) request.getAttribute("data");
	ArrayList<FaqVO> list = (ArrayList)request.getAttribute("list");
	int totCount = (Integer)request.getAttribute("totCount");
	int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#").click(function(){
			goDelete();
		});
	});
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	}
	
	function groupDelete() {	
		if ( isSeleted(document.frm.no) ){
			if (confirm ('삭제하시겠습니까?')) {
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
						<h2>공지상황관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->

					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="회원 관리 기본내용입니다.">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
										<col width="15%" />
										<col width="35%" />
										<col width="35%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">질문</label></th>
											<td><%=data.getQuestion()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">답변</label></th>
											<td><%=data.getAnswer()%></td>
										</tr>
										
									</tbody>
								</table>

								<input type="hidden" name="cmd" id="cmd" value="groupDelete" />
								<input type="hidden" name="stype" id="stype"
									value="<%=param.getStype()%>" /> <input type="hidden"
									name="sval" id="sval" value="<%=param.getSval()%>" />

								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns"
											href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
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

	<script>
	

	</script>


</body>
</html>