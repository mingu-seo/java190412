<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.qna.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<QnaReplyVO> list = (ArrayList<QnaReplyVO>)request.getAttribute("list");
%>
<script type="text/javascript">
	function goDelete(v) {	
		if (confirm ('삭제하시겠습니까?')) {
			document.location.href="/review/delete.do?no="+v+"&cmd=delete";
		}
	}
</script>
					<div id="blist">
						<h3>상품후기</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w5"/>
									<col class="w10"/>
									<col class=""/>
									<col class="w10"/>
									<col class="w5"/>									
								</colgroup>
								<thead>
									<th scope="col" class="first">평점</th>
									<th scope="col">작성자</th>
									<th scope="col">후기</th>
									<th scope="col">작성일</th>
									<th scope="col" class="last"></th>
								</thead>
								<tbody>
								<%
								if (list.size() == 0){ %>
									
									<tr>
										<td colspan="4">등록된 리뷰가 없습니다.</td>
									</tr>
									<%
								}else{
									for(int i=0; i<list.size(); i++){
									%>							
									<tr>
										<td><%=list.get(i).getScore()%></td>
										<td><%=list.get(i).getName() %></td>
										<td><%=list.get(i).getContents() %></td>
										<td><%=list.get(i).getRegistdate() %></td>
										<td><input type="button" value="삭제" onclick="delReview(<%=list.get(i).getNo()%>);"/></td>
									</tr>
									<%
									}
								}
									%>
									</tbody>
							</table>
						</div>