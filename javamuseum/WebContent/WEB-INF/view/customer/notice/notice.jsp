<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.notice.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
NoticeVO param = (NoticeVO)request.getAttribute("vo");
ArrayList<NoticeVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/news1.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script type="text/javascript">
	$(function() {

	})
</script>
</head>
<body>
	<!-- 헤더 구역 -->
	<div id="header">
		<div class="h-top clear">
			<ul class="login">
				<li><a href="login.html">LOGIN</a></li>
				<li><a href="membership.html">JOIN</a></li>
				<li><a href="mypage.html">MY PAGE</a></li>
			</ul>
		</div>
		<div class="h-bot">
			<div class="h-bot-line"></div>
			<div class="h-bot-in clear">
				<div class="logo">
					<a href="index.html">자바미술관</a>
				</div>
				<ul class="h-menu">
					<li><a href="#">VISIT</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="sub-visit1.html">관람안내</a></li>
								<li><a href="sub-visit2.html">미술관 소개</a></li>
								<li><a href="sub-visit3.html">오시는길</a></li>
							</ul>
						</div></li>
					<li><a href="#">EXHIBITION</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="sub-exhibition1.html">현재 전시</a></li>
								<li><a href="sub-exhibition2.html">지난 전시</a></li>
							</ul>
						</div></li>
					<li><a href="#">RENTAL</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="hall.html">대관안내</a></li>
								<li><a href="hall2.html">대관신청</a></li>
							</ul>
						</div></li>
					<li><a href="#">NEWS</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="news1.html">공지사항</a></li>
								<li><a href="news2.html">이벤트</a></li>
								<li><a href="news3.html">FAQ</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 헤더 구역 -->
	</div>
	<div class="con">
		<!-- 상단 배너 구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>News</h3>
				<P>공지사항</P>
			</div>
		</div>
		<!-- 상단 배너 구역 -->
		<div class="con2 clear">
			<!-- News란 구역 -->
			<div class="con2-left">
				<h4>News</h4>
				<div class="con2-left-text">
					<p>
						<a href="news1.html">공지사항</a>
					</p>
					<p>
						<a href="news2.html">이벤트</a>
					</p>
					<p>
						<a href="news3.html">FAQ</a>
					</p>
				</div>
			</div>
			<!-- News란 구역 -->
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>공지사항</h5>
				<p>미술관 전체 소식을 알려드립니다.</p>
				<div class="tbl-box">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w1" />
									<col class="w4" />
									<col class="w6" />
									<col class="w5" />
									<col class="w5" />
									
									<col class="w2" />
								</colgroup>
								<thead>
									<tr>
										
										<th scope="col">번호</th>
										<th scope="col">작성자</th>
										<th scope="col">파일첨부</th>
										<th scope="col">제목</th> 
										
										<th scope="col">작성일</th> 
										
										
									</tr>
								</thead>
								<tbody>
								<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="7">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										NoticeVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
								%>
									<tr <%=topClass%>>
										
										<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>
										<td <%=targetUrl%> class="writer"><%=data.getWriter()%></td>
										<td><img src="/upload/notice/<%=list.get(i).getFilename()%>"  width="50" height="50"></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle()%></td>
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
										
										
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
				</div>
				<!-- 페이지 넘기는 번호구역 -->
				<div class="number-box clear">
					<div class="img-box">
						<a href="#"><img src="img/news1-prev.png"></a>
					</div>
					<div class="number">
						<a href="#">1</a>
					</div>
					<div class="number">
						<a href="news1-2.html">2</a>
					</div>
					<div class="number">
						<a href="#">3</a>
					</div>
					<div class="number">
						<a href="#">4</a>
					</div>
					<div class="number">
						<a href="#">5</a>
					</div>
					<div class="img-box">
						<a href="#"><img src="img/news1-next.png"></a>
					</div>
				</div>
				<div class="form-box">
					<form method="GET" action="insert.php">
						<select>
							<option>전체</option>
							<option>제목</option>
							<option>내용</option>
						</select> <input type="text" name="name" id="name"
							placeholder="검색어를 입력하세요."> <input type="submit"
							value="검색">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 풋터 구역 -->
	<div id="footer">
		<div class="foot-in">
			<div class="foot-top clear">
				<div class="foot-logo">
					<img src="img/logo.png">
				</div>
				<ul class="foot-menu">
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">영상정보처리기기 운영 관리방침</a></li>
					<li><a href="#">SITE MAP</a></li>
					<li><a href="#">CONTACT US</a></li>
				</ul>
			</div>
			<div class="foot-bot clear">
				<ul class="foot-bot-left">
					<li><h5>자바미술관</h5></li>
					<li>서울특별시 종로구 지하문로4길 21(통의동 35-1)</li>
					<li>(재)대림문화재단 서업자등록번호 : 305-82-09028 COPYRIGHT 2015 BY JAVA
						MUSEUM ALL RIGHT RESERVED.</li>
				</ul>
				<ul class="foot-bot-right">
					<li>전화예매 및 문의(무료전화)</li>
					<li><h6>02-720-0665</h6></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 풋터 구역 -->
</body>
</html>