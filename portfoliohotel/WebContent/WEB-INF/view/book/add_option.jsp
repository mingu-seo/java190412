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
    <div id="header">
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
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="../membership/sign_in.html">Sign in</a>
            </div>
        </div>
    </div>
    
    <div id="container">
        <div class="option_channel clear">
            <h1 class="head-title">객실예약</h1>
            <ul class="cha_index clear">
                <li><a href="check_room.html">객실검색 <span>></span> </a></li>
                <li class="current-page"><a href="#">객실예약</a></li>
                <li><a href="/book/personal_info.do"><span>></span>정보입력</a></li>
                <li><a href="#"><span>></span> 예약완료</a></li>
            </ul>
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <form action="#" method="GET">
                <div class="section-wrap clear">
                    <div class="left-section">
                        <div class="sec01-title">
                            <p>추가 옵션 선택</p>
                        </div>

                        <div class="add01">
                            <div class="add-detail">
                                <h3>스파 세션 추가</h3>
                                <p>마음과 여행으로 피곤해진 내 몸을 위한 특별한<br/>
                                    시간, 오직 반얀트리에서 누릴 수 있는 럭셔리한<br/>
                                    반얀트리만의 특화된 스파를 즐겨보세요.</p>
                                <div class="detail-pic"><img src="../img/option-img/option-spa.gif"></div>
                            </div>
                            <div class="option-box">
                                <ul class="option-detail">
                                    <li>· 60분의 힐링타임을 위한 바디마사지</li>
                                    <li>· 마사지 전과 후에 30분동안 바디 릴렉스와 바디 탄력 셋업</li>
                                </ul>

                                <div class="chk-box">
                                    <p>2019. 06. 05 ~ 2019. 06. 08(투숙 기간중 1회)</p>
                                    <p>SPA SESSION 객실 요금 KRW 210,000 [1인/1객실]</p>
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

                        <div class="add02">
                                <div class="add-detail">
                                    <h3>침대 추가</h3>
                                    <p>객실 내 이동식 침대를 추가해 드립니다. 단, <br/>
                                        한정된 수량으로 인해 수급이 불가 할 수 있습니다. <br/>
                                        체그인 시 가능 여부를 확인해드립니다.</p>
                                    <div class="detail-pic"><img src="../img/option-img/option-bed.gif"></div>
                                </div>
                                <div class="option-box">
                                    <div class="chk-box">
                                        <p>이동식 침대 KRW 50,000 [1대/1박]</p>
                                            <div class="number-chk">
                                                <select>
                                                    <option>0</option>
                                                    <option>1</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                                <div class="breifNotice">
                                    <p>* 침대 추가는 객실당 하루 1개까지 가능합니다.</p>
                                    <p>* 침대 추가 금액은 일정 기간에 적용됩니다.</p>
                                </div>

                        </div>
<!-- <input name="pass" type="text">
<select>
    <option value="포토샵">포토샵</option>
</select> -->
                        <div class="add02">
                                <div class="add-detail">
                                    <h3>Welcome Wine & Chocolate</h3>
                                    <p> 반얀트리 소믈리에와 셰프가 준비한 이탈리안<br/>
                                        빈티지 레드 와인과 치즈 플레이트를 객실에 <br/>
                                        준비해 드립니다.</p>
                                    <div class="detail-pic"><img src="../img/option-img/option-wine.gif"></div>
                                </div>
                                <div class="option-box">
                                    <div class="chk-box">
                                        <p>웰컴 와인과 치즈 KRW 66,000 [1set]</p>
                                            <div class="number-chk">
                                                <select>
                                                    <option>0</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                </select>
                                            </div>
                                    </div>
                                </div>
                                            
                        </div>

                    
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
                                        <input id="countsubmit" type="submit" value="다음">
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