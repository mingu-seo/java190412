<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="user.exhibition.*" %>
<%
ArrayList<UExhibitionVO> list = (ArrayList)request.getAttribute("edList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
%>
<div class="con2-box">
	<%for (int i = 0; i < list.size(); i++) {%>
	<div class="con2-box-list clear">
		<a href="javascript:;" onclick="pastReview(<%=list.get(i).getNo()%>)">
			<div class="con2-box-left">
				<img src="/upload/exhibition/<%=list.get(i).getImagename()%>">
			</div>
			<div class="con2-box-right">
				<h4><%=list.get(i).getTitle()%></h4>
				<p><%=list.get(i).getPreview()%></p>
				<span><%=list.get(i).getStartdate()%> ~ <%=list.get(i).getEnddate()%></span>
				<!-- 작품 호버시 -->
				<div class="con2-box-plus">
					<div class="con2-box-plus-img">
						<img src="/img/sub-exhibition2-plus.png">
					</div>
					<div class="con2-box-plus-text">관람평 / 후기</div>
				</div>
				<!-- 작품 호버시 -->
			</div>
		</a>
	</div>
	<%}%>
</div>
