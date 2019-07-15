<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/jquery-ui.css">
        <link rel="stylesheet" href="/css/slick.css">
        <link rel="stylesheet" href="/css/slick-theme.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/default.css">
        <link rel="stylesheet" href="/css/header.css">
        <link rel="stylesheet" href="/css/main-layout.css">
        <link rel="stylesheet" href="/css/footer.css">
        <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="/js/jquery-ui.js"></script>
        <script type="text/javascript" src="/js/gnb.js"></script>
        <script type="text/javascript" src="/js/logined-sub.js"></script>
        <script type="text/javascript" src="/js/banner_slider.js"></script>
        <script type="text/javascript" src="/js/slick.js"></script>
        <script type="text/javascript" src="/js/slick-slide.js"></script>
        <script type="text/javascript" src="/js/aos.js"></script>
        <script type="text/javascript" src="/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            
                //AOS 플러그인 시작구문
                AOS.init();            
            
                 //마우스 휠 플러그인 사용구문
 
                //delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

                $("#container > div:not(.nowheel)").mousewheel(function(event,delta){    
                        event.preventDefault();    

                        //마우스 휠을 올렸을때	
                        if (delta > 0) {  
                            var prev = $(this).prev().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":prev});
                        }
                    
                        //마우스 휠을 내렸을때	
                        else if (delta < 0) {  
                           var next = $(this).next().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":next});
                        }
                });

                //메인페이지 객실예약 선택 달력플러그인 사용
                $( "#start-date" ).datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "0D" 
                });

                $("#end-date").datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "0D" 
                });
            });
        </script>
    <title>테스트</title>
</head>
<body>
    <div id="header">
        <div id="logined">
            <div class="logined-box">
                <h2 class="close-btn"><a href="#">x</a></h2>
                <h3>배경민<span>님 안녕하세요.</span></h3>
                <p class="mypage"><a href="membership/mypage.html">마이페이지 <img src="img/white-arrow.png" class="white-arrow"></a></p>
                <table>
                    <tr>
                        <td class="left">등급</td>
                        <td class="right">VIP</td>
                    </tr>
                    <tr>
                        <td class="left">포인트</td>
                        <td class="right">0 P</td>
                    </tr>
                    <tr>
                        <td class="left">회원번호</td>
                        <td class="right">35001913379</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="index.html"><img src="img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="/pkg/special_promotion.do">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="/pkg/room_offer.html">Room Package</a></li>
                                                <li><a href="/pkg/dining_offer.html">Dining Package</a></li>
                                                <li><a href="/pkg/etc_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="/room/room-detail-subpage.do">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="room/room-detail-subpage2.do">Namsan Pool Premier Suite</a></li>
                                                <li><a href="room/room-detail-subpage3.do">Namsan Presidential Suite</a></li>
                                                <li><a href="room/room-detail-subpage4.do">Spa Sanctuary Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="pkg/thefesta.html">The Festa</a></li>
                                                <li><a href="pkg/granum-dining.html">Granum Dining Lounge</a></li>
                                                <li><a href="pkg/moon-bar.html">Moon Bar</a></li>
                                                <li><a href="pkg/outdoor-kitchen.html">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="meeting_wedding/meeting.html">Meeting</li>
                                                <li><a href="meeting_wedding/wedding.html">Wedding</a></li>
                                                <li><a href="meeting_wedding/familyparty.html">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li>
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="/facilities.do#f1">The Oasis</a></li>
                                                    <li><a href="/facilities.do#f2">Indoor Swimming Pool</a></li>
                                                    <li><a href="/facilities.do#f3">Fitness Centre</a></li>
                                                    <li><a href="/facilities.do#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                    <li><a href="#">Tennis Court</a></li>
                                                    <li><a href="#">Futsal Field</a></li>
                                                    <li><a href="#">Basketball Court</a></li>
                                                    <li><a href="#">Ice Rink</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                
                                                <ul class="Dining">
                                                    <li><a href="#">Troon Golf Academy</a></li>
                                                    <li><a href="#">Foresta Beauty Salon</a></li>
                                                </ul>
                                            </div>
                                        </div>
                            </div>
                    </li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="membership/notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="membership/faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="membership/qna.html">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="membership/sign_in.html">Sign in</a>
            </div>
        </div>
    </div>

    <!-- 컨테이너 영역 시작 -->
    <div id="container">

        <!-- 01베너 (슬라이드 베너) -->
        <div class="banner">
            <div class="slider">
                <div class="banner-bg1 selected">
                    <h4>PORTFOLIO<br/><span>HOTEL</span>
                    </h4>
                </div>
                <div class="banner-bg2">
                        <h4>PORTFOLIO<br/><span>HOTEL</span>
                        </h4>
                </div>
                <div class="banner-bg3">
                        <h4>PORTFOLIO<br/><span>HOTEL</span>
                        </h4>
                </div>
            </div>
            <ul class="slider-btn clear">
                <li class="on"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
            </ul>

            <!-- 간편예약조회 구역 -->
            <div class="direct-reservation">
                <h2>RESERVATION</h2>
                <div class="d-r-input clear"><!-- direct-reservation 단어 너무길어서 d-r 로 줄임 -->
                        <form>
                            <div class="d-r-input1">
                                <input type="text" id="start-date">
                                <p>~</p>
                                <input type="text" id="end-date"> 
                                <select name="adult">
                                    <option>성인</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                </select> 
                                <select name="child">
                                    <option>어린이</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                </select> 
                            </div>
                            <div class="d-r-input2">
                                <!-- <input type="submit" value="예약 조회"> -->
                                <a href="book/check_room.html">예약조회</a>
                            </div>
                        </form>
                </div>
            </div>            
        </div>

        <!-- 02호텔 상품 소개 구역 -->
        <div id="introduce">
            <div class="introduce">
                <ul class="intro-list clear">

                    <li class="intro-title">
                        <h2>HOTEL'S OFFERING</h2>
                    </li>

                    <li class="special_offer">
                        <p>SPECIAL OFFERS</p>
                        <div class="bg">
                                <a href="special_promotion.html">
                                    <div class="hover-box">
                                        <p>SPECIAL OFFER</p>
                                        <img src="img/ico_arrow.png">
                                    </div>
                                </a>
                        </div>
                        
                    </li>

                    <li class="fitness">
                        <p>FACILITIES</p>
                        <div class="bg">
                                <a href="facilites.html">
                                        <div class="hover-box">
                                            <p>FACILITIES</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="spa_relax">
                        <p>MEETING & WEDDING</p>
                        <div class="bg">
                                <a href="#">
                                        <div class="hover-box">
                                            <p>MEETING & WEDDING</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="dining">
                        <p>DINING</p>
                        <div class="bg">
                                <a href="dining.html">
                                        <div class="hover-box">
                                            <p>DINING</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>

                    <li class="event_gift">
                        <p>EVENT & GIFT</p>
                        <div class="bg">
                                <a href="#">
                                        <div class="hover-box">
                                            <p>EVENT & GIFT</p>
                                            <img src="img/ico_arrow.png">
                                        </div>
                                </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- 03스페셜 프로모션 구역 (패키지상품 슬라이드) -->
        <div id="special_promotion">

            <!-- 어두운 배경 -->
            <div class="sp-pro-bg"></div>

            <div class="special_promotion">
                <!-- 제목 -->
                <h2>SPECIAL PROMOTION</h2>

                <!-- 슬라이드 구역 -->
                <div class="promotion_panel">
                    <div class="promotion_list clear">
                        <div class="pro_list1 pro_list">
                            <a href="oasis.html">
                                <img src="img/promotion1.jpg">
                                <div class="promotion_text">
                                    <p>The Oasis Summer Package</p>
                                    <h6>반얀트리 서울의 오아시스 야외 수영장에서
                                        도심 속 완벽한 휴식을 즐겨보세요.
                                    </h6>
                                    <p class="pro_price">420,000원 부터</p>
                                </div>
                                <div class="pro-top-box">
                                    <p>Room package</p>
                                </div>
                            </a>
                        </div>

                        <div class="pro_list2 pro_list">
                                <a href="bbq.html">
                                    <img src="img/promotion2.jpg">
                                    <div class="promotion_text">
                                        <p>The Oasis BBQ Package</p>
                                        <h6>반얀트리 서울만의 특별한 풀사이드 바비큐<br/>
                                            에메랄드 빛의 야외 수영장에서 즐겨보세요.<br/>
                                        </h6>
                                        <p class="pro_price">600,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Room package</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list1 pro_list">
                                <a href="#">
                                    <img src="img/promotion3.jpg">
                                    <div class="promotion_text">
                                        <p>The Oasis Summer Package</p>
                                        <h6>더욱 여유롭고 프라이빗한 휴식을 오아시스<br/>
                                            카바나에서 즐겨보세요.<br/>
                                        </h6>
                                        <p class="pro_price">700,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Promotion</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list2 pro_list">
                                <a href="senseof.html">
                                    <img src="img/promotion4.jpg">
                                    <div class="promotion_text">
                                        <p>Sense of Romance</p>
                                        <h6>도심 속에서 즐기는 로맨틱한 여행, ‘센스<br/>
                                            오브 로맨스’ 패키지를 소개합니다.
                                        </h6>
                                        <p class="pro_price">760,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Room package</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list1 pro_list">
                                <a href="#">
                                    <img src="img/promotion5.jpg">
                                    <div class="promotion_text">
                                        <p>‘For My Parents’ & ‘For my Fiance’</p>
                                        <h6>서울의 야경이 펼쳐진 문 바에서<br/>
                                            커플들을 위한 프로포즈 & 기념일<br/>
                                            패키지를 선보입니다.
                                        </h6>
                                        <p class="pro_price">380,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Promotion</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list2 pro_list">
                                <a href="#">
                                    <img src="img/promotion6.jpg">
                                    <div class="promotion_text">
                                        <p>The Reasonable</p>
                                        <h6>싱글 몰트 위스키와 함께 서울의 야경처럼<br/>
                                            반짝이는 밤을 즐겨보시기 바랍니다.<br/>
                                        </h6>
                                        <p class="pro_price">374,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Room package</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list1 pro_list">
                                <a href="#">
                                    <img src="img/promotion7.jpg">
                                    <div class="promotion_text">
                                        <p>Petit Ibiza width Moonlight</p>
                                        <h6>환상적인 서울 야경이 펼쳐지는 문 바 야외<br/>
                                            테라스에서 프라이빗 파티를 계획해보세요.<br/>
                                        </h6>
                                        <p class="pro_price">370,000원(4인기준)</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Promotion</p>
                                    </div>
                                </a>
                        </div>

                        <div class="pro_list2 pro_list">
                                <a href="#">
                                    <img src="img/promotion8.jpg">
                                    <div class="promotion_text">
                                        <p>Granum Dinner Table</p>
                                        <h6>맛과 건강을 담은 나만의 샐러드와 풍성한<br/>
                                            메인 플래터로 푸짐한 디너를 즐겨보세요.<br/>
                                        </h6>
                                        <p class="pro_price">170,000원 부터</p>
                                    </div>
                                    <div class="pro-top-box">
                                            <p>Promotion</p>
                                    </div>
                                </a>
                        </div>
                    </div>
                </div>

                <!-- <div class="pro-prev"></div>
                <div class="pro-next"></div>
                <ul class="pro-btn-group">
                    <li class="on"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul> -->
            </div>

        </div>

       <!-- 04객실 소개 슬라이드 구역  -->
        <div id="room_suits">
                <h2>ROOMS</h2>
                <div class="room_suits clear">
                    
                    <!--객실 사진 보여줄 구역-->
                    <div class="panel">
                        <div class="room-wrap">
                            <div class="room-pic1 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic2 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic3 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic4 rooms"></div>
                        </div>
                        <div class="room-wrap">
                            <div class="room-pic5 rooms"></div>
                        </div>
                    </div>
                    <!-- 객실 화면 반얀트리 텍스트-->
                    <div class="top-title">
                        <h3>HOTEL'S ROOM</h3>
                    </div>
                    <!--객실 소개 내용과 예약버튼 들어갈 구역-->
                    <div class="room-intro-wrap">
                        <div class="room_intro">
                            <h3>Namsan Pool Deluxe Room</h3>
                            <p>릴렉세이션 풀에서 스파를 즐기며<br/>
                            아름다운 서울의 전경을 바라보는 시간은<br/>
                            몸과 마음을 채우는 특별한 휴식을 선사합니다.</p>
                            <h6>전화 <span>02-2250-8074</span></h6>
                            <h6>이메일 <span>ClubSpaSeoul@ABC.com</span></h6>
                    
                            <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="room/room-detail-subpage.html">MORE</a></li>
                                <li class="room_book"><a href="book/check_room.html">RESERVATION</a></li>
                            </ul>
                        </div>  
                        <div class="room_intro">
                            <h3>Namsan Pool Premier Suite</h3>
                            <p>서울의 전경과 남산을 감상하며 <br/>
                            더욱 로맨틱하게 만들어줄 아늑한 객실과<br/>
                            릴렉세이션 풀에서 보내는 프라이빗한 시간을<br/>
                            만끽하세요.</p>
                            <h6>전화 <span>02-2250-8074</span></h6>
                            <h6>이메일 <span>ClubSpaSeoul@ABC.com</span></h6>

                            <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="#">MORE</a></li>
                                <li class="room_book"><a href="#">RESERVATION</a></li>
                            </ul>
                        </div>
                        <div class="room_intro">
                            <h3>Namsan Presidentail Suite</h3>
                            <p>반얀트리 서울의 객실 중 가장 높은<br/>
                            층에 위치한 남산 프레지덴셜 스위트에서는<br/>
                            릴렉세이션 풀과 여유로운 분위기의 다이닝 룸,<br/>
                            두개의 침실과 욕실로 구성되어 보다 여유롭고</br>
                            품격 있는 휴식을 즐기시길 바랍니다.</p>
                            <h6>전화 <span>02-2250-8074</span></h6>
                            <h6>이메일 <span>ClubSpaSeoul@ABC.com</span></h6>
                    
                             <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="#">MORE</a></li>
                                <li class="room_book"><a href="#">RESERVATION</a></li>
                            </ul>
                        </div>
                        <div class="room_intro">
                            <h3>Spa Sanctuary Suite</h3>
                            <p>특별한 경험을 선사하는 스파 생츄어리 스위트는<br/>
                            여행의 피로를 녹여줄 웰컴 풋마사지와<br/>
                            스파 테라피를 투숙 기간 동안 무제한으로<br/>
                            즐기실 수 있으며 서울 전경과 남산의 전경을<br/>
                            객실에서 편안한 휴식을 경험해보십시오.</p>
                            <h6>전화 <span>02-2250-8074</span></h6>
                            <h6>이메일 <span>ClubSpaSeoul@ABC.com</span></h6>
                    
                             <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="#">MORE</a></li>
                                <li class="room_book"><a href="#">RESERVATION</a></li>
                            </ul>
                        </div>
                        <div class="room_intro">
                            <h3>Banyan Pool Presidential Suite</h3>
                            <p>279㎡의 복층 구조로 1층에는 도심의<br/>
                            화려한 전망이 펼쳐진 쾌적한 다이닝 룸 그리고<br/>
                            2층에는 2개의 품격있는 객실과 넓은 욕실이</br>
                            준비되어 있습니다.</p>
                            <h6>전화 <span>02-2250-8074</span></h6>
                            <h6>이메일 <span>ClubSpaSeoul@ABC.com</span></h6>
                    
                             <!-- 객실 자세히 보기/ 객실조회 버튼 -->
                            <ul class="green-box clear">
                                <li class="room_more"><a href="#">MORE</a></li>
                                <li class="room_book"><a href="#">RESERVATION</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- 객실화면 좌우로 넘어가기 위한 버튼 구역-->
                    <div class="room-btn clear">
                        <button class="slick-prev"></button>
                        <button class="slick-next"></button>
                    </div>
                    <!-- 객실 하단 정보들어갈 구역 -->
                    <ul class="room-bot-info clear">
                            <li class="room-left-info">
                                <h3>INFORMATION</h3>
                                <ul class="table1 clear">
                                    <li>
                                        <p><span class="th">체크인</span><span>15:00</span></p>
                                        <p><span class="th">체크아웃</span><span>12:00</span></p>      
                                    </li>
                                </ul>
                                <ul class="table1-1 clear">
                                    <li>
                                        <p><span class="th">전망</span><span>남산 & 시티뷰</span></p>
                                        <p><span class="th">객실타입</span><span>원룸</span></p>
                                    </li>
                                </ul>
                            </li>
                            <li class="room-right-info">
                                <h3>FACILITIES</h3>
                                <ul class="table2 clear">
                                    <li>
                                        <p class="wid-1">·피트니스 클럽</p>
                                        <p class="wid-2">·실내 수영장</p>
                                        <p>·몽상클레르 10%할인</p>
                                    </li>
                                
                                    <li>
                                            <p class="wid-1">·사우나 이용</p>
                                            <p class="wid-2">·갤러리 10%할인</p>
                                            <p>·반얀트리 스파</p>
                                    </li>
                                </ul>
                            </li>
                    </ul>  
                </div>
        </div>

        <!-- 05시설소개 구역  -->
        <div id="tyc" class="nowheel">

            <!-- 어두운배경 -->
            <div class="tyc-bg-opacity"></div>

            <!-- 가운데 정렬 -->
            <div class="tyc-center">

                <div class="tyc-title">
                    <h2>THINGS YOU CAN ENJOY</h2>
                    <h2>AT PORTFOLIO HOTEL</h2>
                </div>
                
                <div class="tyc-content">

                    <div class="tyc-list clear" data-aos="fade-right" data-aos-duration="1500">
                        <div class="tyc-list-bg">
                        </div>
                        <div class="tyc-list-text">
                            <h3>오아시스<span class="tyc-text-title">The Oasis</span></h3>
                            <h4>남산의 아름다운 전경 속에 자리한 오아시스는<br/> 도심 속 한가로운 휴양을 위한 최적의 장소입니다.<br/>
                                 쾌적한 온도로 유지되는 온수풀, 해외 반얀트리 리조트 풀빌라의 분위기를 느낄 수<br/>
                                있는 프라이빗 카바나가 선사하는 여름의 여유를 즐길 수 있습니다. 
                            </h4>
                            <table>
                                <tr>
                                    <th>위치</th>
                                    <td>야외 공간</td>
                                </tr>
                                <tr>
                                    <th>운영시간</th>
                                    <td>야외 공간</td>
                                </tr>
                                <tr>
                                    <th>문의</th>
                                    <td>02-2250-8230</td>
                                </tr>
                            </table>
                            <a href="#" class="view-details">View Details</a>
                        </div>
                    </div>

                    <div class="tyc-list clear"  data-aos="fade-left" data-aos-duration="1500">
                            <div class="tyc-list-text">
                                    <h3>남산테라스<span class="tyc-text-title">Namsan Terrace</span></h3>
                                    <h4>호텔 3층에 위치한 남산 테라스와 셀레스테는 계절마다 바뀌는 남산의 전경과<br/>
                                         도시의 경관이 시원하게 펼쳐지는 세련된 야외 연회 공간입니다. 가족 또는 <br/>
                                         가까운 지인들과 함께 즐기는 색다른 웨딩 피로연, 바비큐 파티를 비롯해 기업 행사,<br/>
                                         칵테일 리셉션 등 다양한 스타일의 행사를 계획해보세요. 우수한 셰프들이 정성껏 <br/>
                                         준비하는 다이닝 서비스는 파티를 더욱 품격 있게 빛내줍니다. 
                                    </h4>
                                    <table>
                                        <tr>
                                            <th>위치</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>운영시간</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>문의</th>
                                            <td>02-2250-8230</td>
                                        </tr>
                                    </table>
                                    <a href="#" class="view-details">View Details</a>
                                </div>
                            <div class="tyc-list-bg">
                            </div>
                            
                    </div>

                    <div class="tyc-list clear" data-aos="fade-right" data-aos-duration="1500">
                            <div class="tyc-list-bg">
                            </div>
                            <div class="tyc-list-text">
                                <h3>그라넘 다이닝 라운지<p class="tyc-text-title">Granum Dining Lounge</p></h3>
                                <h4>호텔 1층에 위치한 그라넘 다이닝 라운지는 ‘리프레싱 & 헬시’<br/>
                                    콘셉트의 모던 유러피안 퀴진 입니다. 아침에는 투숙 고객과 회원을 위한<br/>
                                     건강한 조식 뷔페가 준비되며, 점심은 계절에 따라 테마를 달리한 메인 디시와<br/>
                                     다채로운 안티파스토 및 디저트로 구성된 ‘그라넘 런치 테이블’ <br/>
                                     세미 뷔페가 펼쳐집니다. 
                                </h4>
                                <table>
                                    <tr>
                                        <th>위치</th>
                                        <td>야외 공간</td>
                                    </tr>
                                    <tr>
                                        <th>운영시간</th>
                                        <td>야외 공간</td>
                                    </tr>
                                    <tr>
                                        <th>문의</th>
                                        <td>02-2250-8230</td>
                                    </tr>
                                </table>
                                <a href="#" class="view-details">View Details</a>
                            </div>
                    </div>

                    <div class="tyc-list clear" data-aos="fade-left" data-aos-duration="1500">
                            <div class="tyc-list-text">
                                    <h3>스파<span class="tyc-text-title">Spa</span></h3>
                                    <h4>세계적인 스파 브랜드 ‘반얀트리 스파(Banyan Tree Spa)’는 아시아<br/>
                                        최초의 럭셔리 오리엔탈 스파로서, 1994년 태국 푸켓에 처음 오픈한 이래<br/>
                                        세계인의 사랑을 받고 있습니다. 반얀트리 클럽 앤 스파 서울에는 총 10개의<br/>
                                        트리트먼트 룸이 있으며 개별 욕실과 휴식 공간이 마련되어 있습니다.<br/>
                                        특별히 스파 스위트에는 트로피컬 레인미스트를 체험할 수 있는 레인미스트 룸을<br/>
                                        구비하여 스파를 위한 최적의 환경을 다각도로 구성하고 있습니다. 
                                    </h4>
                                    <table>
                                        <tr>
                                            <th>위치</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>운영시간</th>
                                            <td>야외 공간</td>
                                        </tr>
                                        <tr>
                                            <th>문의</th>
                                            <td>02-2250-8230</td>
                                        </tr>
                                    </table>
                                    <a href="#" class="view-details">View Details</a>
                                </div>
                            <div class="tyc-list-bg">
                            </div>
                            
                    </div>

                </div>
                
            </div>
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
                    <li><a href="#"><img src="img/sns1.png"></a></li>
                    <li><a href="#"><img src="img/sns2.png"></a></li>
                    <li><a href="#"><img src="img/sns3.png"></a></li>
                    <li><a href="#"><img src="img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="img/footericon1.png"></li>
                    <li><img src="img/footericon2.png"></li>
                    <li><img src="img/footericon3.png"></li>
                    <li><img src="img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>