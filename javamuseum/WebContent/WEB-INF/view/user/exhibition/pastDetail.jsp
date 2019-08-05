<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="user.exhibition.*" %>
<%
UExhibitionVO detail = (UExhibitionVO)request.getAttribute("detail");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
%>
<script>
	$(function(){
		$(".con4 #submit-btn2").click(function() {
			$(".con4-bg").hide();
		});
		
		$(".con5-reviews").hide();
		$(".detail").addClass("on");
		$(".review").removeClass("on");
		
		$("#submit-btn2").click(function(event){
			event.preventDefault();
			$(".con4-bg").hide();
		});
		
		$(".detail").click(function(event){
			event.preventDefault();
			$(this).addClass("on");
			$(".review").removeClass("on");
			$(".con5-reviews").hide();
			$(".con5-contents").show();
		});
		
		$(".review").click(function(event){
			event.preventDefault();
			$(this).addClass("on");
			$(".detail").removeClass("on");
			$(".con5-contents").hide();
			$("#moreReview").show();
		});
	})
</script>
<div class="con4-bg">
	<div class="con4-gr">
		<div class="con4-header">
			<h3>전시후기</h3>
		</div>
		<div class="con4-center">
			<ul class="con4-top clear">
				<li class="con4-top-img"><img src="/upload/exhibition/<%=detail.getImagename()%>"></li>
				<li class="con4-top-text">
					<h4>로봇 일러스트레이션을 통해</h4>
					<h4>기계적 판타지를 구현하는</h4>
					<h3><%=detail.getArtist()%> / Hajime Sorayama</h3>
					<p><%=detail.getPreview()%></p>
					<ul class="sub01-btn clear">
						<li class="like" id="like" onclick="getDetail(<%=detail.getLike_cnt()%>)"><a href="javascript:;">♥<%=detail.getLike_cnt()%></a></li>
					</ul>
				</li>
			</ul>
			<div class="con5-top">
				<ul class="con5-btn clear">
					<li class="detail" onclick="getDetailDes(<%=detail.getNo()%>)">상세 설명</li>
					<li class="review">리뷰</li>
				</ul>
				<div class="con5-contents">
					<%=detail.getContents()%>
				</div>
				<div class="con5-reviews">
					ㅇㅇ
				</div>
			</div>
			<div class="con4-btn clear">
				<ul class="btn-group clear">
					<li><input type="submit" id="moreReview" name="submit-btn1" value="후기 더보기"></li>
					<li><button id="submit-btn2">닫기</button></li>
				</ul>
			</div>
		</div>
	</div>
</div>