<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/slick-theme.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/facilites.css">
        <link rel="stylesheet" href="css/footer.css">
        <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="js/gnb.js"></script>
        <script type="text/javascript" src="js/slick.js"></script>
        <script type="text/javascript" src="js/slick-slide.js"></script>
        <script type="text/javascript" src="js/aos.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            
                //AOS 플러그인 시작구문
                AOS.init();            
            
                 //마우스 휠 플러그인 사용구문
 
                //delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

                $("#container > div").mousewheel(function(event,delta){    
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
            });
        </script>
    <title>테스트</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="index.html"><img src="img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="room_offer.html">Room Package</a></li>
                                                <li><a href="room_offer.html">Dining Package</a></li>
                                                <li><a href="room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="#">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="#">Namsan Pool Premier Suite</a></li>
                                                <li><a href="#">Namsan Presidential Suite</a></li>
                                                <li><a href="#">Spa Sanctuary Suite</a></li>
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
                    <li>
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="#">The Oasis</a></li>
                                                    <li><a href="#">Indoor Swimming Pool</a></li>
                                                    <li><a href="#">Fitness Centre</a></li>
                                                    <li><a href="#">Sauna</a></li>
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
                                                <a href="notice.html" class="notice-a">
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
                                                <a href="faq.html">
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
                                                <a href="qna.html">
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
                <a href="sign_in.html">Sign in</a>
            </div>
        </div>
    </div>
    <div id="container">
        <div class="banner">
            <h2>
                THE PLACES FOR YOUR<br/>
                HEALTH AND RELAXATION
            </h2>
        </div>
        <div class="contents">
            <div class="contents-center">
                <h3>FACILITES</h3>
                <div class="facilities-box">
                    <div  id="f1" class="facilities1 clear">
                        <div class="facilities-bg"></div>
                        <div class="facilities-text">
                            <h4>오아시스<span>The Oasis</span></h4>
                            <p>남산의 아름다운 전경 속에 자리한 오아시스는<br/>
                                 도심 속 한가로운 휴양을 위한 최적의 장소입니다.
                                 <br/>쾌적한 온도로 유지되는 온수풀, 해외 반얀트리 리조트 풀빌라의 분위기를 느낄 수 있는<br/>
                                 프라이빗 카바나가 선사하는 여름의 여유를 즐길 수 있습니다.
                            </p>
                            <table>
                                <tr>
                                    <td>위치</td>
                                    <td class="table-a">야외공간</td>
                                </tr>
                                <tr>
                                    <td>운영시간</td>
                                    <td class="table-a">기간별 상이</td>
                                </tr>
                                <tr>
                                    <td>문의</td>
                                    <td class="table-a">02-2250-8230</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="f2" class="facilities2 clear">
                        <div class="facilities-text">
                                <h4>실내 수영장<span>Indoor Swimming Pool</span></h4>
                                <p>반얀트리 브랜드 고유의 자연친화적인 컨셉으로 디자인된 실내 수영장은 성인은 물론<br/>
                                     영유아까지 안전한 수영을 즐길 수 있습니다. 안전을 고려하여 설계된 연령대에 맞는
                                     <br/>선베드와 자쿠지에서 여유로운 시간을 즐겨보세요.
                                </p>
                                <table>
                                    <tr>
                                        <td>위치</td>
                                        <td class="table-a">더클럽 3층 (로비층)</td>
                                    </tr>
                                    <tr>
                                        <td>운영시간</td>
                                        <td class="table-a">06:00 - 21:00</td>
                                    </tr>
                                    <tr>
                                        <td>문의</td>
                                        <td class="table-a">02-2250-8105</td>
                                    </tr>
                                </table>
                        </div>
                        <div class="facilities-bg"></div>
                    </div>
                    <div id="f3" class="facilities3 clear">
                        <div class="facilities-bg"></div>
                        <div class="facilities-text">
                            <h4>피트니스 센터<span>Fitness Centre</span></h4>
                            <p>세계 최고 수준의 운동 기구와 인공 암벽, 다양한 프로그램이<br/>
                                운영된 스튜디오가 마련되어 있습니다.
                                 <br/>따사로운 자연 채광과 수려한 남산의 전경을 감상하며 몸과 마음이 상쾌해지는 <br/>
                                 시간을 경험 해보세요.
                            </p>
                            <table>
                                <tr>
                                    <td>위치</td>
                                    <td class="table-a">더클럽 1층,2층,루프탑</td>
                                </tr>
                                <tr>
                                    <td>운영시간</td>
                                    <td class="table-a">06:00-22:00 (매월 첫째 주 화요일 정기 휴관)</td>
                                </tr>
                                <tr>
                                    <td>문의</td>
                                    <td class="table-a">02-2250-8162</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="f4" class="facilities4 clear">
                        <div class="facilities-text">
                                <h4>사우나<span>Sauna</span></h4>
                                <p>특별 제작된 독립 샤워 부스에서 수업, 색체, 음악을 이용한 테라피 샤워를<br/>
                                     즐길 수 있는 'Experiece Shower'와 건식, 습식 사우나가 마련된 사우나 시설에서
                                     <br/>일상에서의 피로를 녹여보시기 바랍니다.
                                </p>
                                <table>
                                    <tr>
                                        <td>위치</td>
                                        <td class="table-a">더클럽 2층</td>
                                    </tr>
                                    <tr>
                                        <td>운영시간</td>
                                        <td class="table-a">06:00 - 22:00(매월 첫째 주 화요일 정기 휴관)</td>
                                    </tr>
                                    <tr>
                                        <td>문의</td>
                                        <td class="table-a">02-2250-8118</td>
                                    </tr>
                                </table>
                        </div>
                        <div class="facilities-bg"></div>
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