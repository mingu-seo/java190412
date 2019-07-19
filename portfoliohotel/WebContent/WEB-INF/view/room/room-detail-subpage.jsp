<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/slick-theme.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header-fixed.css">
    <link rel="stylesheet" href="/css/room-detail-subpage.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/slick-slide.js"></script>
    <script type="text/javascript">
        $(function(){
            
                $(".book").click(function(event){
                    event.preventDefault();
                    $(".book-wrap").show();
                });
                $(".book-close > a").click(function(){
                    $(".book-wrap").hide();
                });
                $("#book-start").datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "0D"
                    
                });
                $("#book-end").datepicker({
                    monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                    dateFormat: "yy-mm-dd",
                    yearRange: "2019:2019",
                    minDate: "1D"
                });
             
        });
    </script>
    <title>호텔객실</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../room_offer.html">Room Package</a></li>
                                                <li><a href="../room_offer.html">Dining Package</a></li>
                                                <li><a href="../room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="room-detail-subpage.do">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="room-detail-subpage2.do">Namsan Pool Premier Suite</a></li>
                                                <li><a href="room-detail-subpage3.html">Namsan Presidential Suite</a></li>
                                                <li><a href="room-detail-subpage4.html">Spa Sanctuary Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="#">The Festa</a></li>
                                                <li><a href="#">Granum Dining Lounge</a></li>
                                                <li><a href="#">Moon Bar</a></li>
                                                <li><a href="#">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="#">Meeting</li>
                                                <li><a href="#">Wedding</a></li>
                                                <li><a href="#">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilities.html#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop facil-right">
                                                
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
                                                <a href="../membership/mypage.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        호텔 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../membership/faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        호텔에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../membership/qna.html">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        호텔에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="../membership/sign_in.do">SIGN IN</a>
            </div>
        </div>
    </div>
    
    <!-- 컨테이너 영역 시작 -->
    <div id="container">
        <div class="container">
            <!-- 서브페이지 상단 타이틀 -->
            <h1>NAMSAN POOL DELUX ROOM</h1>

            <!-- 객실 사진 슬라이드 영역 -->
            <div class="slide">
                <div class="sub_page_panel">
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
            </div>
            <div class="room-btn clear">
                    <button class="slick-prev"></button>
                    <button class="slick-next"></button>
            </div>

            <div class="brief">
                <h5>더 호텔에 위치한 남산 풀 디럭스 룸은 50㎡부터 56㎡의 면적으로 안락한 공간에서 편안한 휴식을 즐기실 수 있습니다. 한 층에 4개의 객실이 자리하고 있으며<br/>
                    객실에 설비된 릴랙세이션 풀은 반얀트리에서의 휴식을 더욱 특별하게 만들어 드립니다. 릴랙세이션 풀에서 스파를 즐기며 아름다운 서울의 전경을 바라보는 <br/>
                    시간은 몸과 마음을 채우는 특별한 휴식을 선사합니다.
                </h5>

                <div class="book"><a href="#">객실 예약하기</a></div>

                <div class="book-wrap">
                    <div class="direct-reservation">
                        <h2>RESERVATION</h2>
                        <div class="d-r-input clear">
                            <form>
                                <div class="d-r-input1">
                                    <input type="text" id="book-start">
                                    <p>~</p>
                                    <input type="text" id="book-end"> 
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
                                    <a href="/book/add_option.do">객실 예약</a>
                                </div>
                            </form>
                        </div>
                        <p class="book-close"><a href="#">X</a></p>
                    </div>    
                </div>       
                
            </div>
            
            <div class="info-box">
                <ul class="info-detail clear line">
                    <li class="title">기본정보</li>
                    <li clear>
                        <ul class="themost">
                            <li>체크인</li>
                            <li>체크아웃</li>
                            <li>위치</li>
                            <li>전망</li>
                            <li>객실타입</li>
                        </ul>

                        <ul class="second">
                            <li>15:00</li>
                            <li>12:00</li>
                            <li>더호텔 14F~16F</li>
                            <li>남산 & 시티뷰</li>
                            <li>원룸</li>
                        </ul>
                    </li>
                </ul>

                <ul class="info-detail clear line">
                        <li class="title">편의시설</li>
                        <li clear>
                            <ul class="themost1">
    
                                <li>·릴렉세이션 풀</li>
                                <li>·킹사이즈 침대</li>
                                <li>·49인치 TV(51개 채널)</li>
                                <li>·보스 스피커</li>
                                <li>·캡슐 커피 머신</li>
                            </ul>
    
                            <ul class="themost2">
                                <li>·전기 주전자</li>
                                <li>·커피, 차 티백 무료제공</li>
                                <li>·미니 바</li>
                                <li>·금고</li>
                            </ul>
                        </li>
                </ul>

                <ul class="info-detail clear">
                            <li class="title">투숙객 혜택</li>
                            <li clear>
                                <ul class="themost1">
        
                                    <li>·피트니스 클럽 무료 이용</li>
                                    <li>·실내 수영장 무료 이용</li>
                                    <li>·사우나 유료 이용 (27,500원)</li>
                                    <li>·모앙클레르 10% 할인</li>
                                    <li>·반얀트리 스파 & 갤러리 10% 할인</li>
                                    <li><p>(매월 첫째주 화요일 휴관일로 이용이 제한됩니다.)</p></li>
                                </ul>
        
                            </li>
                </ul>
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
                    <li><a href="#"><img src="../img/sns1.png"></a></li>
                    <li><a href="#"><img src="../img/sns2.png"></a></li>
                    <li><a href="#"><img src="../img/sns3.png"></a></li>
                    <li><a href="#"><img src="../img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="../img/footericon1.png"></li>
                    <li><img src="../img/footericon2.png"></li>
                    <li><img src="../img/footericon3.png"></li>
                    <li><img src="../img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>

    
</body>
</html>