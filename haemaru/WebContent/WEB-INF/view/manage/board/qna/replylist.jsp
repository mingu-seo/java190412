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
			document.location.href="/reply/delete.do?no="+v+"&cmd=delete";
		}
	}
</script>
<style>
.cont{
height: 150px;
}
</style>

					<div id="bread">
						<h3>등록된 답변</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
								<%
								if (list.size() == 0){ %>
									
									<tr>
										<td colspan="4">등록된 답변이 없습니다.</td>
									</tr>
									
									</tbody>
							</table>
									<%
								}else{
									for(int i=0; i<list.size(); i++){
									%>							
									<tr>
										<th><label for="">제목</label></th>
										<td><%=list.get(i).getTitle()%></td>
									</tr>
									<tr>
										<th class="cont"><label for="">내용</label></th>
										<td><%=list.get(i).getContents() %></td>
									</tr>
									<tr>
										<th><label for="">첨부파일</label></th>
										<td><img src="<%=list.get(i).getFilename()%>"></td>
									</tr>
									<tr>
										<th>삭제</th>
										<td><input type="button" value="삭제" onclick="delReply(<%=list.get(i).getNo()%>);"/></td>
									</tr>
									
									</tbody>
							</table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<%
									}
								}
									%>
						</div>