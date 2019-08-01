<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="room.*" %>
<%@ page import="java.util.*"%>
<%
ArrayList<Room_optVO> list_o = (ArrayList<Room_optVO>)request.getAttribute("list_o");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/header-fixed.css">
    <link rel="stylesheet" href="../css/add_option.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <script>
        $(function(){
            //left-section 높이값 알아내서 right-section 높이값을 동일하게
            var leftHei = $(".left-section").height();
            $(".right-section").height(leftHei+2);
            var secHei = $(".section-wrap").height();
            //스크롤 했을때 
            $(window).scroll(function(){
                //스크롤바 위치값 알아내기
                var scTop = $(this).scrollTop();
                //section-wrap 시작하는 위치값 알아내기
                var secWrap = $(".section-wrap").offset().top;
                //footer 시작하는 위치값 알아내기
                var ftStart = $("#footer").offset().top-800;
                
                if(scTop >= secWrap && scTop < secHei-390) {
                    $(".confirmation-box").addClass("fix");
                }
                else if(scTop >= secHei-390) {
                    $(".confirmation-box").removeClass("fix");
                    $(".confirmation-box").addClass("fix2");
                }
                else {
                    $(".confirmation-box").removeClass("fix2");
                    $(".confirmation-box").removeClass("fix");
                }
            });
        });
    </script>
    <title>객실예약</title>
</head>
<body>
<%@ include file="../header_menu.jsp" %>

    <div id="container">
        <div class="option_channel clear">
            <h1 class="head-title">객실예약</h1>
            <ul class="cha_index clear">
                <li><a href="/book/check_room">객실검색 <span>></span> </a></li>
                <li class="current-page"><a href="#">객실예약</a></li>
                <li><a href="/book/personal_info"><span>></span>정보입력</a></li>
                <li><a href="/book/confirm_room"><span>></span> 예약완료</a></li>
            </ul>
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <form action="#" method="GET">
                <div class="section-wrap clear">
                    <div class="left-section">
                        <div class="sec01-title">
                            <p>추가 옵션 선택</p>
                        </div>

						<%
						if(list_o.size() > 0) {
							for(int i=0; i<list_o.size(); i++) {
						%>
							<div class="add0<%=i==0 ? "1":"2"%>">
								<div class="add-detail">
									<h3><%=list_o.get(i).getName() %></h3>
									<p><%=list_o.get(i).getInstruction() %></p>
									<div class="detail-pic"><img src="/upload/room_opt/<%=list_o.get(i).getImage() %>"/></div>
								</div>
								<div class="option-box">
									<ul class="option-detail">
									<%
									if(!list_o.get(i).getInfo_1().equals("")) {
									%>
										<li>· <%=list_o.get(i).getInfo_1() %></li>
									<%
									}
									if(!list_o.get(i).getInfo_2().equals("")) {
									%>
										<li>· <%=list_o.get(i).getInfo_2() %></li>
									<%
									}
									%>
									</ul>
									<div class="chk-box">
										<p><%=list_o.get(i).getInfo() %></p>
										<div class="number-chk">
											<select>
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
										</div>
									</div>
								</div>
							</div>
						<%
							}
						}
						%>
                    </div>

                    <div class="right-section">
                        <div class="confirmation-box">
                                <div class="content-area01">
                                    <h2>온라인 확정 요금</h2>
                                    <p>- 온라인 확정 요금 (최소 및 변경 불가 요금)</p>

                                    <h3>NAMSAN POOL DELUXE ROOM[1객실]</h3>
                                    <h3 class="point01">2019년 00월 00일(월) ~ 2019년 00월 00일 [0박]</h3>
                                    <h3>어른0명 / 아이0명</h3>
                                </div>

                                <div class="content-area02 area clear">
                                    <ul class="title01">
                                        <li><h3>객실/패키지 총 금액</h3></li>
                                        <li><h3>추가 옵션s 총 금액</h3></li>
                                        <li><h3>세금 및 수수료</h3></li>
                                    </ul>

                                    <ul class="price01">
                                        <li><h3>KRW 324,000</h3></li>
                                        <li><h3>KRW 0</h3></li>
                                        <li><h3>KRW 68,040</h3></li>
                                    </ul>
                                </div>

                                <div class="content-area03 area clear">
                                    <ul class="title02 clear">
                                        <li class="total-price">총 예약 금액</li>
                                        <li>KRW 392,040</li>
                                    </ul>
                                    <p>(투숙기간. 객실 수. 옵션 포함, 세금 및 수수료 각 10%포함)</p>

                                    <div class="next-but">
                                        <input id="countsubmit" type="submit" value="다음" href="personal_info">
                                    </div>

                                    <h4><span></span>예약 안내</h4>
                                    <p>· 당일 예약에 대해서는 취소 및 변경이 불가능합니다.</p>
                                </div>

                                <div class="content-area04 area">
                                    <h4><span></span>객실 예약문의 00-0000-0000</h4>
                                </div>
                        </div>
                    </div>
                </div>   
            </form> 
        </div>
    </div>

    <div id="footer">
            <!-- <div class="footer-logo"><img src="img/footer_logo.png"></div> -->
            
            <div class="footer-center">
                <div class="footer-top">
                    <ul class="company-info clear">
                        <li><a href="#">호텔소개</a></li>
                        <li><a href="#">오시는 길</a></li>
                        <li><a href="#">문의</a></li>
                        <li><a href="#">인재채용</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                    </ul>
                    <ul class="sns clear">
                        <li><a href="#"><img src="/img/sns1.png"></a></li>
                        <li><a href="#"><img src="/img/sns2.png"></a></li>
                        <li><a href="#"><img src="/img/sns3.png"></a></li>
                        <li><a href="#"><img src="/img/sns4.png"></a></li>
                    </ul>
                </div>
                <div class="footer-bottom">
                    <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                        서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                    </h5>
                    <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                    <ul class="support-logo clear">
                        <li><img src="/img/footericon1.png"></li>
                        <li><img src="/img/footericon2.png"></li>
                        <li><img src="/img/footericon3.png"></li>
                        <li><img src="/img/footericon4.png"></li>
                    </ul>
                </div>
            </div>
    </div>
</body>
</html>