<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>

<%
MemberVO param = (MemberVO)request.getAttribute("vo");
ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>

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
					<h2>관리자관리 - [회원목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						
							
							
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									
									
									<col class="w20" />
															
									<col class="w8" />
									<col class="w10" />
									
								
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										
										
										<th scope="col">이름</th>
											
										<th scope="col">등급</th>	 																
										<th scope="col">포인트</th>
										 
										
									
									</tr>
								</thead>
								<tbody>
								
							
								<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="10">등록된 자료가 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										for (int i=0; i<list.size(); i++) {
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, list.get(i).getNo())+"'\"";
											
								%>
								
									<tr>
									<%
									String[] nameArr = list.get(i).getName().split(",");								
									%>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										
																			
										<td <%=targetUrl%>><%=nameArr[0]%> <%=nameArr[1] %></td>
																			
										<td <%=targetUrl%>><%=CodeUtil.getMgrade(list.get(i).getGrade())%></td>	 
										<td <%=targetUrl%>><%=list.get(i).getPoint() %></td>																	
										
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
									<a class="wbtn" href="write"><strong>회원가입</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							
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