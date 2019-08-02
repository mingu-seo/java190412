<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="../css/personal_info.css">
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
    <title>정보입력</title>
</head>
<body>
<!--     <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">Book</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../pkg/special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../pkg/room_offer.html">Room Package</a></li>
                                                <li><a href="../pkg/dining_offer.html">Dining Package</a></li>
                                                <li><a href="../pkg/etc_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="../room/room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="../room/room-detail-subpage2.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="../room/room-detail-subpage3.html">Namsan Presidential Suite</a></li>
                                                <li><a href="../room/room-detail-subpage4.html">Spa Sanctuary Suite</a></li>
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
                        <a href="#">Facilites</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="../facilites.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilites.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilites.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilites.html#f4">Sauna</a></li>
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
                                                <a href="../membership/notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
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
                                                        반얀트리에 대한<br/>
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
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <li><a href="#">SIGN IN</a></li>
                </ul>
                <a href="../membership/sign_in.html">Sign in</a>
            </div>
        </div>
    </div> -->
    <%@ include file="../header_menu.jsp" %>
    
    <div id="container">
        <div class="option_channel clear">
            <h1 class="head-title">객실예약</h1>

            <!-- 상단 제목 아래 객실예약 진행 순서 -->
            <ul class="cha_index clear">
                <li><a href="#">객실검색 <span>></span> </a></li>
                <li><a href="add_option">객실예약</a></li>
                <li class="current-page"><a href="#"><span>></span>정보입력</a></li>
                <li><a href="#"><span>></span> 예약완료</a></li>
            </ul>
            
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <form action="#" method="GET">
                <div class="section-wrap clear">
                    <!-- 왼쪽 정보 입력 박스 구역 -->
                    <div class="left-section">
                        
                        <div class="add01">
                            <div class="sec01-title">
                                <p>예약고객 정보 입력</p>
                            </div>

                            <div class="name_ko">
                                    <label for="name_ko">성명 (한글)＊</label>
                                    <input type="text" id="name_ko" placeholder="성">
                                    <input type="text" id="name_ko" placeholder="이름">
                            </div>

                           <!--  <div class="name_en clear">
                                    <div class="name_en_title">
                                        <label for="name_en">성명 (영문)＊</label>
                                    </div>
                                    <div class="name_en_area">
                                        <select>
                                            <option>선택안함</option>
                                            <option>Ms.</option>
                                            <option>Mr.</option>
                                        </select>
                                        <input type="text" id="name_en" placeholder="Family Name">
                                        <input type="text" id="name_en" placeholder="First Name">
                                        <p>* 여권에 기재된 영문 성명과 동일하게 기입해 주십시오.</p>
                                    </div>
                            </div> -->

                            <div class="phoneNumber">
                                    <label for="phoneNumber">연락처＊</label>
                                    <select>
                                        <option>선택</option>
                                        <option>010</option>
                                        <option>011</option>
                                        <option>017</option>
                                    </select>
                                    <input type="text" id="number" placeholder="숫자만 입력가능">
                            </div>

                            <div class="email">
                                    <ul class="email_adress clear">    
                                        <li class="email-title">
                                            <label for="email">이메일＊</label>
                                        </li>
                                    
                                        <li>
                                            <input type="text" id=emailID value title="이메일 아이디 입력" maxlength="40">
                                        </li>

                                        <li class="at">@</li>

                                        <li>
                                            <input type="text" id="emailAdress" value title="이메일 주소 입력" maxlength="40">
                                        </li>
                                        <li class="adress">
                                                <select>
                                                        <option>직접입력</option>
                                                        <option>naver.com</option>
                                                        <option>hanmail.net</option>
                                                        <option>google.com</option>
                                                </select>
                                        </li>
                                    </ul>
                            </div>
                        </div>

                        <div class="add01">
                                <div class="sec01-title">
                                        <p>상세 가격 정보</p>
                                </div>
                               
                                <table>
                                    <tr>
                                        <th></th>
                                        <th>총 예약 금액<br/>
                                            [1박,1객실]</th>
                                    </tr>
                                    <tr>
                                        <th>객실/패키지 가격</th>
                                        <td>KRW 247,500</td>
                                    </tr>
                                    <tr>
                                            <th>추가 옵션 가격</th>
                                            <td>KRW 0</td>
                                    </tr>
                                    <tr>
                                            <th>봉사료(10%),<br/>
                                                부가가치세(10%)<br/>
                                              전 일정, 전 객실에 적용</th>
                                            <td>KRW 51,975</td>
                                    </tr>
                                    <tr>
                                            <th>총 예약 금액</th>
                                            <td><p>KRW 299,475</p></td>
                                    </tr>
                                    
                                </table>
                        </div>

                        <div class="add01 card">
                                <div class="sec01-title">
                                        <p>결제 방식 선택</p>
                                </div>
                                
                                <div class="cardType">
                                        <label for="name_ko">결제 방식<span>＊</span></label>
                                        <button>무통장입급</button>
                                        <button>카드결제</button>
                                </div>
                        </div>
                             
                    </div>

                    <!-- 오른쪽 금액 추가 및 결제버튼 구역 -->
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
                                        <input id="countsubmit" type="submit" value="예약 완료" href="confirm_room">
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