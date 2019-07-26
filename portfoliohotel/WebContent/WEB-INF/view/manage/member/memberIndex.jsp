<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>

<%
MemberVO param = (MemberVO)request.getAttribute("vo");
ArrayList<MemberVO> list = (ArrayList)request.getAttribute("list");
MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
MemberVO data = (MemberVO)request.getAttribute("data");
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
					<h2>회원</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">													
								<colgroup>																								
									<col class="w10" />															
									<col class="w10" />
									<col class="w10" />									
								</colgroup>
								<thead>
									<tr>
																												
										<th scope="col">이름</th>											
										<th scope="col">등급</th>	 																
										<th scope="col">포인트</th>
										
									</tr>
								</thead>
								<tbody>
					<%String[] nameArr = vo.getName().split(","); %>
									<tr>
								
																																							
										<td><%= nameArr[0]%> <%=nameArr[1]%></td>																			
										<td><%=CodeUtil.getMgrade(vo.getGrade())%></td>	 
										<td><%=vo.getPoint()%></td>																											
									</tr>
							
								</tbody>
								
							</table>
							
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
							
							
							<div class="btnRight">
									<a class="btns" href="memberMypage"><strong>마이페이지</strong> </a>
									
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