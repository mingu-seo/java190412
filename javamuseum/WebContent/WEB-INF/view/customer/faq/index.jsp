<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.faq.*"%>
<%@ page import="property.SiteProperty"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	FaqVO param = (FaqVO) request.getAttribute("vo");
	ArrayList<FaqVO> list = (ArrayList) request.getAttribute("list");
	int totCount = (Integer) request.getAttribute("totCount");
	int totPage = (Integer) request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이벤트</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/news3.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script type="text/javascript" src="/js/isotope.pkgd.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function(event) {
			var filter = $(".filtering").isotope({
				itemSelector : '.all',
				layoutMode : 'fitRows'
			});
			$(".btn-group li").click(function(event) {
				event.preventDefault();
				var value = $(this).attr("data-name");

				filter.isotope({
					filter : value,
					transitionDuration : 500
				});
			});
		});
		//Q&A 접었다가 펼치는 기능 
		$(".con7-left").click(function() {

			var onCheck = $(this).children(".con7-leftbg").hasClass("on"); // true or false 의 값을 oncheck에 담아줌 

			if (onCheck) { //oncheck = true 일 때
				// 내 자신한테 아코디언 효과를 줄 때
				$(this).children(".con7-leftbg").removeClass("on"); // 화살표 이미지에 on을 붙여 노출시킴
				$(this).siblings(".con7-cont").hide(); // 텍스트 내용에 on을 붙여 노출시킴
			} else { //oncheck = false 일 때
				$(".con7-leftbg").removeClass("on"); // 기존의 화살표를 모두 지우는 작업
				$(".con7-cont").hide(); // 기존의 내용들을 모두 지우는 작업

				$(this).children(".con7-leftbg").addClass("on"); // 화살표 이미지에 on을 붙여 노출시킴
				$(this).siblings(".con7-cont").show(); //텍스트 내용에 on을 붙여 노출시킴
			}

		});

		//첫화면 높이값 안잡히는 부분 스크립트로 처리

		var hei = $(".con3-center").height();
		$(".members-wrap").height(hei);

		// 텝메뉴(버튼)
		$(".con2-center li").click(function() {
			var btnnember = $(this).index();
			$(".members-wrap > div").hide();
			$(".members-wrap > div").eq(btnnember).show();
		});
	});
</script>
</head>
<body>
	<div id="header">
		<!-- 마이페이지 시작 -->
		<div class="h-top clear">
			<ul class="login">
				<li><a href="login.html">LOGIN</a></li>
				<li><a href="membership.html">JOIN</a></li>
				<li><a href="mypage.html">MY PAGE</a></li>
			</ul>
		</div>
		<!-- 마이페이지 끝 -->
		<!-- 서브페이지 시작 -->
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
		<!-- 서브페이지 끝 -->
	</div>
	<div class="con">
		<!-- 메인배너 시작 -->
		<div class="con1">
			<div class="con1-box">
				<h3>News</h3>
				<P>FAQ</P>
			</div>
		</div>
		<!-- 메인배너 -->
		<!-- 왼쪽 서브페이지 시작-->
		<div class="con2 clear">
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
			<!-- 왼쪽 서브페이지 끝 -->
			<!-- faq 시작 -->
			<div class="con2-right">
				<div class="con7-center">
					<div class="con7-text">
						<h2>FAQ</h2>
						<h4>방문하시는 고객님들이 자주하시는 질문</h4>
					</div>
					<div class="con7-qabox">
						<div class="con7-qa">



								<div>
								<%
									if (totCount == 0) {
								%>
								
									<p class="first">등록된 글이 없습니다.</p>
								
								<%
									} else {

										FaqVO data;
										for (int i = 0; i < list.size(); i++) {
											data = list.get(i);
								%>
								










								
									<ul class="con7-left clear">
										<li><img src="/img/mypage-Q.png"></li>
										<li><p class="title">
												<%=data.getQuestion()%>
											</p>
											</li>
										<li class="con7-leftbg"></li>
									</ul>
								
									<div class="con7-cont">
										<ul class="con7-sub">
											<li><img src="/img/mypage-A.png"></li>
											<li><p class="title">
													<%=data.getAnswer()%>
												</p>
												</li>
										</ul>
									</div>
								
									<%
										}
										}
									%>

								</div>
								

							







						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- faq 끝 -->
	

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
</body>
</html>