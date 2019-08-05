<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%
ArrayList<UExhibitionVO> list = (ArrayList)request.getAttribute("edList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>미술관소개</title>
<link rel="stylesheet" href="/css/sub-exhibition2.css">
<style>
</style>
<script src="https://kit.fontawesome.com/3db09483e7.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
	$(function() {
		//작품 클릭시 레이어 팝업 등장 구문

		/*con2-box-wrap 높이값 유동적으로 조정*/

		var hei = $(".con2-box-wrap").children(".con2-box").eq(0).height();
		$(".con2-box-wrap").height(hei);

		$("#exhi-select").change(
			function() {

				$.ajax({
					type : "GET",
					url : "/user/exhibition/subExhibition2?startdate="+$("#exhi-select").val(),
					async : false,
					success : function (data) {
						console.log($("#exhi-select").val());
						$(".con2-box").show();
					}
				});
				
				/*선택한  option 태그의 순서값 받아오기
				var optIndex = $("#exhi-select option").index($("#exhi-select option:selected"));

				$(".con2-box-wrap").children(".con2-box").fadeOut();
				$(".con2-box-wrap").children(".con2-box").eq(optIndex).fadeIn();

				보이는  con2-box 높이만큼  con2-box-wrap 높이를 재설정
				hei = $(".con2-box-wrap").children(".con2-box").eq(optIndex).height();
				$(".con2-box-wrap").height(hei); */
				
				/* $("#subexhi").submit();*/
			}); 

		$(".con2-box-list").click(function(event) {
			event.preventDefault();
			$(".con4-bg").show();
		})
		$(".con4 #submit-btn2").click(function() {
			$(".con4-bg").hide();
		});
		$(".con4-epilogue").click(function(event) {
			event.preventDefault();
			var list = $(this).hasClass("on") //클릭한 자기자신에게 on이 붙어있는지 없는지 확인

			if (list) { //on이 붙어있을때 - true
				$(this).removeClass("on");
				$(this).siblings(".con4-ep-cont").stop().slideUp();
			} else { //on이 없을때 - false
				$(".con4-epilogue").removeClass("on")
				$(this).addClass("on");
				$(".con4-epilogue").siblings(".con4-ep-cont").stop().slideUp();
				$(this).siblings(".con4-ep-cont").stop().slideDown();
			}
		})
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	<div class="con">
		<!-- 상단 배너구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>EXHIBITION</h3>
				<P>지난 전시</P>
			</div>
		</div>
		<!-- 전시 목록 구역 -->
		<div class="con2">
			<div class="con2-center">
				<div class="con2-text clear">
					<div class="con2-text-h3" id="topArea">
						<h3>PAST EXHIBITION</h3>
					</div>
					<!-- 날짜 선택구역 -->
					<div class="calender">
						<form method="GET" action="subExhibition2" id="subexhi">
							<select id="exhi-select" name="startdate" >
								<option value="all" <%=("all".equals(param.getStartdate())) ? "selected" : ""%>>전체</option>
								<option value="2019" <%=("2019".equals(param.getStartdate())) ? "selected" : ""%>>2019</option>
								<option value="2018" <%=("2018".equals(param.getStartdate())) ? "selected" : ""%>>2018</option>
								<option value="2017" <%=("2017".equals(param.getStartdate())) ? "selected" : ""%>>2017</option>
							</select>
						</form>
					</div>
					<!-- 날짜 선택구역 -->
				</div>
				<!-- 전시 작품 박스 -->
				<div class="con2-box-wrap">
					<div class="con2-box">
						<%for(int i = 0; i < list.size(); i++){ %>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="/upload/exhibition/<%=list.get(i).getImagename()%>">
								</div>
								<div class="con2-box-right">
									<h4><%=list.get(i).getTitle()%></h4>
									<p><%=list.get(i).getPreview()%></p>
									<span><%=list.get(i).getStartdate()%></span>
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
						<%} %>
					</div>
					<!-- <div class="con2-box">
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-1.jpg">
								</div>
								<div class="con2-box-right">
									<h4>The World between Empires: Art and Identity in the
										Ancient Middle East</h4>
									<p>
										A new perspective on the vibrant artistic and cultural
										identities that flourished<br /> at the edges of two ancient
										empires as they competed for regional control.
									</p>
									<span>November 28 . 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-2.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Ragnar Kjartansson, Death Is Elsewhere</h4>
									<p>This exhibition is the world premiere of a major new
										work by Icelandic artist Ragnar Kjartansson, considered one of
										the most prominent performance and video artists of his
										generation.</p>
									<span>November 7 . 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-3.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Camp: Notes on Fashion</h4>
									<p>Through more than 250 objects dating from the
										seventeenth century to the present, The Costume Institute's
										spring 2019 exhibition explores the origins of camp's
										exuberant aesthetic.</p>
									<span>October 13. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-4.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Phenomenal Nature: Mrinalini Mukherjee</h4>
									<p>
										Mrinalini Mukherjee's first retrospective<br /> in the United
										States brings together over fifty works by the artist.
									</p>
									<span>September 29. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-5.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Play It Loud: Instruments of Rock & Roll</h4>
									<p>This exhibition explores the instrumentation of the rock
										band and how individual artists used their instruments to
										create their unique sound as well as their visual identity.</p>
									<span>August 12. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-6.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Art of Native America: The Charles and Valerie Diker
										Collection</h4>
									<p>This exhibition showcases more than one hundred
										masterworks that represent the achievements of artists from
										many culturally distinct indigenous traditions across North
										America.</p>
									<span>August 8. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-7.jpg">
								</div>
								<div class="con2-box-right">
									<h4>The Roof Garden Commission: Alicja Kwade, ParaPivot</h4>
									<p>With equal parts poetry and critical acumen, Alicja
										Kwade's work explores the systems that humans have developed
										to make sense of an otherwise unfathomable universe.</p>
									<span>June 25. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-8.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Home Is a Foreign Place: Recent Acqusitions in Context</h4>
									<p>This installation of recent acquisitions explores the
										meanings of "home" and "place" in our increasingly interwoven
										globe.</p>
									<span>May 13. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
					</div>
					<div class="con2-box">
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-1sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>In Praise of Painting: Dutch Masterpieces at The Met</h4>
									<p>
										Dutch paintings of the seventeenth century have been a
										highlight of The Met collection since the Museum's founding
										purchase in 1871. This exhibition brings together some of the
										Museum's greatest<br /> paintings to present this remarkable
										chapter of art history in a new light.
									</p>
									<span>November 11 . 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-2sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Epic Abstraction: Pollock to Herrera</h4>
									<p>This exhibition explores large-scale abstract painting,
										sculpture, and assemblage through works from The Met
										collection, including works by Jackson Pollock, Louise
										Nevelson, Judit Reigl, Mark Bradford, and Mark Rothko.</p>
									<span>October 21 . 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-3sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Atea: Nature and Divinity in Polynesia</h4>
									<p>Featuring some thirty exceptional works of art, this
										exhibition celebrates the creative ingenuity of Polynesian
										artists who drew from the natural world to give material
										expression to their understanding of the divine.</p>
									<span>July 13. 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-4sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Seeing the Divine: Pahari Painting of North India</h4>
									<p>This exhibition will focus on a vibrant new style of
										depicting the Hindu gods that emerged in the Punjab hills of
										North India during the seventeenth and eighteenth centuries.</p>
									<span>June 15. 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left">
									<img src="img/sub-exhibition2-5sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Selections from the Department of Drawings and Prints:
										Rembrandt</h4>
									<p>This installation features works chosen to commemorate
										the 350th anniversary of the death of the great Dutch
										draftsman, painter, and printmaker Rembrandt van Rijn.</p>
									<span>May 18. 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list clear">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-6sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Watercolors of the Acropolis: Émile Gilliéron</h4>
									<p>The exhibition features five drawings by virtuoso
										watercolorist Émile Gilliéron (1850–1924) —three of them more
										than eleven feet long—that depict ancient architectural
										sculptures on the Athenian Acropolis.</p>
									<span>April 28. 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-7sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Lucio Fontana: On the Threshold</h4>
									<p>The first retrospective of Lucio Fontana in the United
										States in more than four decades includes sculptures,
										paintings, ceramics, drawings, and environments made between
										1929 and 1968, in a reassessment of the artist's legacy.</p>
									<span>March 11. 2017</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
						<div class="con2-box-list">
							<a href="#">
								<div class="con2-box-left clear">
									<img src="img/sub-exhibition2-8sec.jpg">
								</div>
								<div class="con2-box-right">
									<h4>Home Is a Foreign Place: Recent Acqusitions in Context</h4>
									<p>This installation of recent acquisitions explores the
										meanings of "home" and "place" in our increasingly interwoven
										globe.</p>
									<span>May 13. 2018</span>
									작품 호버시
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									작품 호버시
								</div>
							</a>
						</div>
					</div> -->
				</div>
				<!-- 더보기란 -->
				<div class="more">
					<a href="#">Show More</a>
				</div>
				<!-- 더보기란 -->
			</div>
		</div>
		<!-- 작품 클릭시 레이어팝업창 -->
		<div class="con4">
			<div class="con4-bg">
				<div class="con4-gr">
					<div class="con4-header">
						<h3>전시후기</h3>
					</div>
					<div class="con4-center">
						<ul class="con4-top clear">
							<li class="con4-top-img"><img
								src="img/sub-exhibition2-1thr.jpg"></li>
							<li class="con4-top-text">
								<h4>로봇 일러스트레이션을 통해</h4>
								<h4>기계적 판타지를 구현하는</h4>
								<h3>하지메 소라야마 / Hajime Sorayama</h3>
								<p>하지메 소라야마는 40여 년 동안 메탈을 소재로 에어 브러시 페인팅 기법을</p>
								<p>이용한 로봇 일러스트레이션과 조각을 선보여 왔다. 작가는 인간의 형태를 정확히 따르고</p>
								<p>있는 휴머노이드(humanoid)를 통해 인간과 기계에 대한 통합적인 아름다움을 보여주며,</p>
								<p>일본 내 다양한 대중문화 콘텐츠로 등장한 기계적 판타지의 서막을 열었다.</p>
							</li>
						</ul>
						<div class="con4-bot">
							<div class="con4-bot-title">
								<h4>BEST 한줄평 / 후기</h4>
							</div>
							<div class="con4-bot-text">
								<div class="con4-bot-text-list">
									<div class="con4-epilogue clear">
										<div class="rating">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
										<div class="notice">
											<p class="notice-title">관람후기제목</p>
											<p class="auther">
												<span>김**</span> <span>2019-07-04</span>
											</p>
										</div>
									</div>
									<div class="con4-ep-cont">
										후기 잘봤습니다.<br /> 후기 잘봤습니다.
									</div>
								</div>
							</div>
							<div class="con4-bot-text">
								<div class="con4-bot-text-list">
									<div class="con4-epilogue clear">
										<div class="rating">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
										<div class="notice">
											<p class="notice-title">관람후기제목</p>
											<p class="auther">
												<span>이**</span> <span>2019-07-04</span>
											</p>
										</div>
									</div>
									<div class="con4-ep-cont">
										후기 잘봤습니다.<br /> 후기 잘봤습니다.
									</div>
								</div>
							</div>
							<div class="con4-bot-text">
								<div class="con4-bot-text-list">
									<div class="con4-epilogue clear">
										<div class="rating">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
										<div class="notice">
											<p class="notice-title">관람후기제목</p>
											<p class="auther">
												<span>박**</span> <span>2019-07-04</span>
											</p>
										</div>
									</div>
									<div class="con4-ep-cont">
										후기 잘봤습니다.<br /> 후기 잘봤습니다.
									</div>
								</div>
							</div>
						</div>
						<ul class="write clear">
							<form method="GET" action="insert.php">
								<li><input type="text" id="text" name="text"
									placeholder="내용을 입력하세요"></li>
								<li><input type="submit" id="write-submit"
									name="write-submit" value="등록"></li>
							</form>
						</ul>
						<div class="con4-btn clear">
							<ul class="btn-group clear">
								<li><button id="submit-btn2">닫기</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>