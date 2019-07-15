<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>해마루(2조)</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/main-layout.css">
    <link rel="stylesheet" href="css/footer.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <!-- 전체 마우스 휠 슬라이드 플러그인 -->
    <script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <!-- 다섯번째 슬라이드 화면 플러그인 -->
    <script type="text/javascript" src="js/modernizr.custom.97074.js"></script> 
    <script type="text/javascript" src="js/jquery.hoverdir.js"></script>
    <script type="text/javascript" src="js/hoverdir.js"></script>
    <!-- banner2 화면 텍스트 플러그인 -->
    <script type="text/javascript" src="js/textyle.min.js"></script>
    <!-- 첫번째  화면 슬라이드  -->
    <script type="text/javascript" src='js/mainSlider.js'></script>
    <!-- 전체 화면 마우스 휠 -->
    <script type="text/javascript" src='js/mainMousewheel.js'></script>
    <!-- 그 외 적용 자바스크립트 -->
    <script type="text/javascript" src="js/custom.js"></script>
</head>
<body>
    <!-- header html -->
    <div id="header">
        <!-- 로그인 -->
        <div id="login-wrap"><!--화면 끄는 코드--></div>
        <div id="login">
                    <div class="login-center">
                        <div class="head-box clear">
                            <p>Login</p>
                            <img src="icon/footer-icon.png">
                        </div>
                        <div class="login-page">
                            <div class="back-arrow">
                                <a href="#"><img src="icon/backarrow.png">
                                <P>뒤로가기</P></a>
                            </div>
                            <h1 class="login-logo">
                                <a href="#"><img src="icon/logo_lightgreen.png"></a>
                            </h1>
                            <form class="login-form" method="GET" action="test.php">
                                <div class="login-email">
                                    <input type="text" maxlength="20" id="email_input" name="email_input" placeholder="E-Mail">
                                </div>
                                <div class="login-password">
                                    <input type="password" maxlength="12" id="id_pass" name="id_pass" placeholder="Password">
                                </div>
                                <div class="login-btn">
                                    <input type="submit" value="LOGIN"  id="btn_submit1">
                                </div>
                                <ul class="login-sub-btn clear">
                                    <li><a href="#">비밀번호 찿기</a></li>
                                    <li><a href="#">회원가입</a></li>
                                </ul>
                            </form>
                            <ul class="login-bot clear">
                                <li><a href="#">개인정보처리방침</a></li>
                                <li><a href="#">이메일무단수집거부</a></li>
                            </ul>
                        </div>
                    </div>
        </div>
        <!-- 회원가입 -->
        <div id="join-area">
            <div class="join-box">
                <div class="join-head">
                    <p>Join</p>
                    <img src="icon/footer-icon.png">
                </div>
                <div class="join-page">
                    <div class="join-back-arrow">
                        <a href="#"><img src="icon/backarrow.png">
                        <P>뒤로가기</P></a>
                    </div>
                    <h1 class="join-logo">
                        <a href="#"><img src="icon/logo_lightgreen.png"></a>
                    </h1>
                    <form class="join-form" method="GET" action="text.php">
                        <div class="email_box">
                            <span><label for="id_input" class="label">이메일</label></span>
                            <input type="text" maxlength="20" id="id_input" name="id_input" class="half-size">
                            <select class="emial-select">
                                <option>@ naver.com</option>
                                <option>@ daum.net</option>
                                <option>@ gmail.com</option>
                            </select>
                        </div>
                        <div class="pass_box">
                            <span><label for="id_pass_join"  class="label">비밀번호</label></span>
                            <input type="password" maxlength="12" id="id_pass_join" name="id_pass_join" placeholder="비밀번호를 입력하세요." class="cover-size">
                        </div>
                        <div class="pass_box_check">
                            <span><label for="id_pass_check"  class="label">비밀번호확인</label></span>
                            <input type="password" maxlength="12" id="id_pass_check" name="id_pass_check" placeholder="비밀번호를 다시 입력하세요." class="cover-size">
                        </div>
                        <div class="name_box">
                            <span><label for="id_input"  class="label">이름</label></span>
                            <input type="text" maxlength="5" id="id_input" name="id_input" placeholder="이름을 입력하세요." class="cover-size">
                        </div>
                        <div class="birth_box">
                            <span><label for="id_birth"  class="label">생년월일</label></span>
                            <input type="text" maxlength="8" id="birth_input" name="birth_input" placeholder="ex ) 19890107" class="cover-size">
                        </div>
                        <div class="phone_box">
                            <span><label for="id_phone"  class="label">전화번호</label></span>
                            <select class="phone-select">
                                <option>010</option>
                                <option>011</option>
                                <option>018</option>
                            </select>
                            <input type="text" maxlength="4" id="phone_input" name="phone_input"  class="half-size">
                            <input type="text" maxlength="4" id="phone_input" name="phone_input"  class="half-size half">
                        </div>
                        <div class="join-btn clear">
                            <input type="reset" value="취소" id="btn_reset">
                            <input type="submit" value="회원가입" id="btn_submit">
                        </div>
                    </form>
                    <ul class="join-bot clear">
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">이메일무단수집거부</a></li>
                     </ul>
                </div>
            </div>
        </div>
        <!-- Right Fix -->
        <div class="fix-menu-box">
            <ul class="fix-menu">
                <li class="os"><a href="#"></a></li>
                <li><a href="#">병원소개</a></li>
                <li><a href="#">진료과목</a></li>
                <li><a href="#">입양후기</a></li>
                <li><a href="#">입양프로필</a></li>
                <!-- <li class="oq"><a href="#">오시는길</a></li> -->
            </ul>
            <!-- <div class="fix-menu-text">오시는 길</div> -->
        </div>
        <h1 class="header-logo"><a href="index.html"><img src="icon/logo_lightgreen.png"></a></h1>
        <!-- GNB MENU -->
        <div class="header-center clear">
            <!-- gnb & sub menu -->
            <ul class="gnb clear">
                <li>
                    <a href="sub1-1.do">병원소개</a>
                    <ul class="header-sub">
                        <li><a href="sub1-1.do">인사말</a></li>
                        <li><a href="sub1-2.html">의료진소개</a></li>
                        <li><a href="sub1-3.html">오시는길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub2-1.html">진료과목</a>
                    <ul class="header-sub">
                        <li><a href="sub2-1.html">외과</a></li>
                        <li><a href="sub2-2.html">내과</a></li>
                        <li><a href="sub2-3.html">영상의학과</a></li>
                        <li><a href="sub2-4.html">응급의료센터</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub3-1.html">예약</a>
                    <ul class="header-sub">
                        <li><a href="sub3-1.html">진료예약</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub4-1.html">입양</a>
                    <ul class="header-sub">
                        <li><a href="sub4-1.html">프로필</a></li>
                        <li><a href="sub4-2.html">입양후기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub5-1.html">고객센터</a>
                    <ul class="header-sub">
                        <li><a href="sub5-1.html">공지사항</a></li>
                        <li><a href="sub5-2.html">FAQ</a></li>
                        <li><a href="sub5-3.html">문의하기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub6-1.html">마이페이지</a>
                    <ul class="header-sub">
                        <li><a href="sub6-1.html">나의정보</a></li>
                        <li><a href="sub6-2.html">나의반려동물</a></li>
                        <li><a href="sub6-3.html">예약확인</a></li>
                        <li><a href="sub6-4.html">문의내역</a></li>
                    </ul>
                </li>
            </ul>
            <!-- 끝 -->
        </div>
        <!-- 로그인 메뉴들-->
        <ul class="login-box clear">
            <li><a href="https://www.facebook.com/haemaruah/"></a></li>
            <li><a href="https://www.youtube.com/results?search_query=%ED%95%B4%EB%A7%88%EB%A3%A8%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90"></a></li>
            <li><a href="https://instagram.com/haemaru_ah?igshid=zw6yyof9s7ka"></a></li>
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원가입</a></li>
        </ul>
        <!-- 끝 -->
        <!-- 비밀번호 찿기 -->
        <div id="pass-lost">
            <div class="pass-head">
                <p>Find</p>
                <img src="icon/footer-icon.png">
            </div>
            <div class="pass-page">
                <div class="pass-back-arrow">
                    <a href="#"><img src="icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-logo">
                    <a href="#"><img src="icon/logo_lightgreen.png"></a>
                </h1>
                <form class="pass-form" method="GET" action="text.php">
                    <div class="email-pass-box">
                        <span><label for="email_pass_input" class="label">어려움을 겪고 있는 해마루 계정</label></span>
                    </div>
                    <div>
                        <input type="text" maxlength="5" id="name_pass_input" name="name_pass_input" class="pass-size" placeholder="이름을 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="8" id="birth_pass_input" name="birth_pass_input" class="pass-size" placeholder="생년월일을 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="11" id="number_pass_input" name="number_pass_input" class="pass-size" placeholder="전화번호를 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="20" id="email_pass_input" name="email_pass_input" class="pass-size" placeholder="이메일을 입력하세요.">
                    </div>
                    <div>
                        <input type="submit" value="인증번호 보내기" id="pass-lost-submit">
                    </div>
                </form>
                <ul class="pass-bot clear">
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이메일무단수집거부</a></li>
                </ul>
            </div>
        </div>
        <!-- 끝 -->
        <!-- 비밀번호 찾기 인증확인창 -->
        <div id="pass-chk">
            <div class="pass-chk-head">
                <p>Find</p>
                <img src="icon/footer-icon.png">
            </div>
            <div class="pass-chk-page">
                <div class="pass-chk-back-arrow">
                    <a href="#"><img src="icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-chk-logo">
                    <a href="#"><img src="icon/logo_lightgreen.png"></a>
                </h1>
                <form class="pass-chk-form" method="GET" action="text.php">
                    <div class="email-pass-chk-box">
                        <span><label for="email_pass_chk_input" class="label">어려움을 겪고 있는 해마루 계정</label></span>
                    </div>
                    <div>
                        <input type="text" maxlength="20" id="email_pass_chk_input" name="email_pass_input" class="pass-size" placeholder="인증번호를 입력하세요.">
                    </div>
                    <div>
                        <input type="submit" value="확인" id="pass_chk-submit">
                    </div>
                </form>
                <ul class="pass-chk-bot clear">
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이메일무단수집거부</a></li>
                </ul>
            </div>
        </div>
    </div> 
    <div id="container">
        <!-- 첫번째  화면 베너 -->
        <div class="con1">
            <div class="con1-box">
                <!-- 베너 시작 -->
                <div class="banner">
                    <div class="panel">
                        <!-- 베너 첫번째 화면 -->
                        <div class="view">
                            <div class="view-img"></div>
                            <div class="view-bg"></div>
                            <div class='view1 clear'>
                                <div>
                                    <div class="view1-text" >
                                        <h4>Welcome to Haemaru Medical</h4>
                                        <p>전문적인 치료가 가능한 2차 진료기관</p>
                                    </div>
                                    <div class="circle-play clear">
                                        <div class="circle"><a href="https://www.youtube.com/results?search_query=%ED%95%B4%EB%A7%88%EB%A3%A8%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90">재생</a></div>
                                        <div class="circle-text">Watch Haemaru youtube</div>
                                    </div>
                                </div>
                                <div class="view1-video">
                                    <div class="view1-video-dummy"></div>
                                    <iframe class="video1" width="560" height="315" src="https://www.youtube.com/embed/yreutGikE3Y?controls=0&autoplay=1&loop=1&playlist=jiKUAS2kcKI?&mute=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                        <!-- 베너 두번쨰 화면 -->
                        <div class="view">
                            <div class="view2-text">
                                <h4 class="text-js-1">H A E M A R U&nbsp;&nbsp;&nbsp;&nbsp;A D O P T I O N</h4>
                                <h5 class="text-js-2">Adoption Review</h5>
                            </div>
                            <div class="view2-bot clear">
                                <div class="view2-bot-img"></div>
                                <h6><a href='sub4-1.html'>View Propile</a></h6>
                            </div>
                        </div>
                        <!-- 베너 세번째 화면 -->
                        <div class="view clear">
                            <ul class="view-3 clear">
                                <li>
                                    <!-- 이미지 사이즈 900px -->
                                    <div class="section-img">
                                        <img src="img/banner_right_01.jpg">
                                        <div class="section-text">
                                            <div class="hours">
                                            <h3>24시간 응급의료센터</h3>
                                            <a href="sub2-4.html">view more</a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </li>
                                 <li>
                                     <!-- 이미지 사이즈 1800px -->
                                    <div class="section-img">
                                        <img src="img/banner-main-test.jpg">
                                        <div class="section-text2">
                                            <h4>H A E M A R U&nbsp;&nbsp;&nbsp;&nbsp;M E D I C A L</h4>
                                            <h5>Medical Information</h5>
                                        </div>
                                    </div>
                                </li>
                                 <li>
                                     <!-- 이미지 사이즈 1000px -->
                                    <div class="section-img">
                                        <img class="view3-img-3" src="img/con4-1.jpg">
                                        <div class="section-text">
                                            <img src="img/heamaru_clinic.png">
                                            <p class="medical-text"><a href="sub2-1.html">외과</a>&nbsp;&nbsp;&nbsp;<a href="sub2-2.html">내과</a>&nbsp;&nbsp;&nbsp;<a href="sub2-3.html">영상의학과</a></a></p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 베너 하단 동그라미 버튼 -->
                    <ul class="banner-btn clear">
                        <li class="on"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                    </ul>
                    <!-- 베너 좌 우 버튼 -->
                    <div class="prev"><img src="img/bannerarrow.png"></div>
                    <div class="next"><img src="img/bannerarrownext.png"></div>
                </div>
                <!-- 베너 끝 -->
                <!-- 끝 -->
            </div>
        </div>
        <!-- 두번째  화면 -->
        <div class="con2">
            <div class="con2-box clear">
                <div class="con2-info1">
                    <a href="sub2-4.html">
                    <h3>24 HOURS 응급 의료센터</h3>
                    <h4>Emergency MedicalCare</h4>
                    <p>풍부한 경험과 체계적인 진료를 바탕으로<br/>응급진료가 필요한 모든 동물들에게<br/>치료를 제공해드릴 수 있습니다.</p>
                    </a>
                </div>
                <div class="con2-info2">
                    <a href="sub1-3.html">
                        <h3>찿아 오시는 길</h3>
                        <h4>How to Find</h4>
                        <img src="img/mapbg.png">
                    </a>
                </div>
                <div class="con2-info3">
                    <h3>진료안내</h3>
                    <h4>Medical Information</h4>
                    <div class="con2-time">
                        <p><span>평일</span><span>토요일</span>: <span>10 : 00 - 6 : 00</span></p>
                        <p><span>일요일</span><span>공휴일</span>: <b>휴무</b></p>
                        <p>tel. 031 781 2992</p>
                    </div>
                </div>
                <div class="con2-info4">
                    <h3>Reservation</h3>
                    <div class="reser-btn">
                        <a href="sub3-1.html">진료예약</a>
                    </div>
                    <div class="reser-btn">
                        <a href="sub6-3.html">예약확인</a>
                    </div>
                   
                </div>
                <div class="con2-info5">
                    <h3>공지사항</h3>
                    <h4>Notice</h4>
                    <div class="notice-btn">
                        <a href="sub5-1.html">
                        <h6>[소식] 해마루이차진료동물병원 김진경 원장 취임 인터뷰</h6>
                        <p>2019-06-04</p>
                        </a>
                    </div>
                    <div class="notice-btn">
                        <a href="sub5-1.html">
                        <h6>[칼럼] 반려동물 건강이야기 - 전염성 강한 ‘강아지 인플루엔자’ 주의보</h6>
                        <p>2019-03-02</p>
                        </a>
                    </div>
                    <div class="notice-btn">
                        <a href="sub5-1.html">
                        <h6>[카드뉴스] 마이크로바이옴이란?</h6>
                        <p>2019-04-22</p>
                        </a>
                    </div>
                </div>
                <div class="con2-info6">
                    <h3>의료진소개</h3>
                    <h6>Medical Staff</h6>
                    <div class="con2-tab">
                        <ul class="con2-tab-list clear">
                            <li class="on"><a href="#">원장</a></li>
                            <li><a href="#">수의사</a></li>
                            <li><a href="#">테크니션</a></li>
                            <li><a href="#">리셉션리스트</a></li>
                        </ul>
                        <div class="con2-tab-box-group">
                            <div class="con2-tab-box clear">
                                <div class="con2-tab-box-area clear">
                                    <div class="con2-tab-img"><img src="img/kimhyunone.png"></div>
                                    <div class="con2-tab-img">
                                        <h4>김현욱</h4>
                                        <h5>Director of Hospital</h5>
                                        <h5>원장/대표이사</h5>
                                        <h6>Profile</h6>
                                        <a href="sub1-2.html"><p>View All</p></a>
                                    </div>
                                    <div class="con2-tab-img"><img src="img/kimjinone.png"></div>
                                    <div class="con2-tab-img">
                                        <h4>김진경</h4>
                                        <h5>Director of Hospital</h5>
                                        <h5>원장/내과부장</h5>
                                        <h6>Profile</h6>
                                        <a href="sub1-2.html"><p>View All</p></a>
                                    </div>
                                </div>
                                <div class="con2-tab-box-area clear">
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/cho.png">
                                            <div class="con2-tab-img-text">
                                                <h4>최새롬</h4>
                                                <h5>Veterinarian</h5>
                                                <h5>내과/팀장</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/nam.png">
                                            <div class="con2-tab-img-text">
                                                <h4>남예림</h4>
                                                <h5>Veterinarian</h5>
                                                <h5>내과/팀장</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/lee.png">
                                            <div class="con2-tab-img-text">
                                                <h4>이승현</h4>
                                                <h5>Veterinarian</h5>
                                                <h5>내과/진료수의사</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                </div>
                                <div class="con2-tab-box-area clear">
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/tec_01.png">
                                            <div class="con2-tab-img-text">
                                                <h4>박혜란</h4>
                                                <h5>Technician</h5>
                                                <h5>내과/파트장</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/tec_02.png">
                                            <div class="con2-tab-img-text">
                                                <h4>남예림</h4>
                                                <h5>Technician</h5>
                                                <h5>내과/테크니션</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/tec_03.png">
                                            <div class="con2-tab-img-text">
                                                <h4>이승현</h4>
                                                <h5>Technician</h5>
                                                <h5>내과/테크니션</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                </div>
                                <div class="con2-tab-box-area clear">
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/rec_01.png">
                                            <div class="con2-tab-img-text">
                                                <h4>국선영</h4>
                                                <h5>Receptionist</h5>
                                                <h5>원무과/과장</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/rec_02.png">
                                            <div class="con2-tab-img-text">
                                                <h4>김종민</h4>
                                                <h5>Receptionist</h5>
                                                <h5>원무과/매니저</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                        <div class="con2-tab-img2 clear">
                                            <img src="img/rec_03.png">
                                            <div class="con2-tab-img-text">
                                                <h4>김현정</h4>
                                                <h5>Receptionist</h5>
                                                <h5>원무과/매니저</h5>
                                                <h6>Profile</h6>
                                                <a href="sub1-2.html"><p>View All</p></a>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 세번째  화면 -->
        <div class="con3">
            <div class="con3-box">
                <div class="con3-info clear">
                    <div class="con3-view">
                        <a href="sub2-1.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-1.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>정형외과</h3>
                                <p>Orthopedics</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-1.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-2.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>흉부외과</h3>
                                <p>Thoracic surgery</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-2.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-3.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>내분비내과</h3>
                                <p>Endocrinology Internal Medicine</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-2.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-4.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>소화기내과</h3>
                                <p>Digestive Internal Medicine</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-2.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-5.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>신경내과</h3>
                                <p>Neurology</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-3.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-6.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>방사선검사</h3>
                                <p>Radiation examination</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-3.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-7.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>초음파검사</h3>
                                <p>Ultrasound examination</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                    <div class="con3-view">
                        <a href="sub2-4.html">
                            <div class="con3-view-img"><img src="img/subcon3/subcon3-8.jpg"></div>
                            <div class="con3-view-bg"></div>
                            <div class="con3-view-text">
                                <h3>응급중환자의료센터</h3>
                                <p>Emergency and Critical Care Medicine</p>
                                <img src="icon/medicine-class.png">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="con3-bot">
                <div class="con3-bot-left">
                    <div class="con3-bot-text clear">
                        <h5>Hamaru Clinic</h5>
                        <h6>고객에게 행복을 직원에게 즐거움을 반려동물에게<br/>최상의 진료 서비스를 제공하려 노력하는 해마루 동물병원입니다.</h6>
                        <a href="sub2-1.html">more</a>
                    </div>
                </div>
                <!-- <div class="con3-bot-right"></div> -->
            </div>
        </div>
        <!-- 네번째  화면 -->
        <div class="con5">
            <div class="con5-text">
                <h3>입양 후기</h3>
            </div>
            <div class="con5-box clear">
                <div class="con5-box-info">
                    <div class="con5-box-info-img">
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-20.jpg"></a>
                    </div>
                    <div class="con5-box-info-text">
                        <h5>Haemaru adoption</h5>
                        <h4>봉봉이가 우리 집에 온 날</h4>
                        <p>Praesent in nunc sit amet orci dignissim mollis. Pellentesque elementum lacinia urna, 
                            sit amet scelerisque libero...</p>
                    </div>
                    <div class="review-writer clear">
                        <div class="writer-1 con5-img-1"></div>
                        <div class="writer-2">
                            <h6>rronn1</h6>
                            <p>September 5. 2019</p>
                        </div>
                    </div>
                </div>
                <div class="con5-box-info">
                    <div class="con5-box-info-img">
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-21.jpg"></a>
                    </div>
                    <div class="con5-box-info-text">
                        <h5>Haemaru adoption</h5>
                        <h4>우리 똘이가 집에 온 날~</h4>
                        <p>Praesent in nunc sit amet orci dignissim mollis. Pellentesque elementum lacinia urna, 
                            sit amet scelerisque libero...</p>
                    </div>
                    <div class="review-writer clear">
                        <div class="writer-1 con5-img-2"></div>
                        <div class="writer-2">
                            <h6>NamJ</h6>
                            <p>November 22. 2019</p>
                        </div>
                    </div>
                </div>
                <div class="con5-box-info">
                    <div class="con5-box-info-img">
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-22.jpg"></a>
                    </div>
                    <div class="con5-box-info-text">
                        <h5>Haemaru adoption</h5>
                        <h4>사랑스런 둘리 입양 후기!</h4>
                        <p>Praesent in nunc sit amet orci dignissim mollis. Pellentesque elementum lacinia urna, 
                            sit amet scelerisque libero...</p>
                    </div>
                    <div class="review-writer clear">
                        <div class="writer-1 con5-img-3"></div>
                        <div class="writer-2">
                            <h6>KimFlowerDure</h6>
                            <p>September 5. 2019</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="con5-bot clear">
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-9.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"> <img src="img/con4-2/con4-2-4.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-5.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"> <img src="img/con4-2/con4-2-6.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"><img src="img/con4-2/con4-2-7.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
                <div class="con5-bot-info clear">
                    <div>
                        <a href="sub4-2.html"> <img src="img/con4-2/con4-2-8.jpg"></a>
                    </div>
                    <div>
                        <h5>Haemaru adoption</h5>
                        <h6>Welcome my love house with pet!</h6>
                    </div>
                </div>
            </div>
        </div>
        <!-- 다섯번째  화면 -->
        <div class="con4">
            <div class="con4-center">
                <div class="con4-title">
                    <h4>입양 프로필</h4>
                    <h3>아이들과 함께하며<br/>
                    사람과 동물이 함께 존중하며<br/>
                    나란히 함께 할 수 있는 해마루</h3>
                    <div class="con4-more-btn">
                        <a href="sub4-2.html" class="more-btn-a">
                            <span class="con4-more-bg"></span>
                            <span class="con4-more-text">Propile More</span>
                        </a>
                    </div>
                </div>
                <div class="con4-box-group clear">
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color1">   
                            <div class="con4-hover"> 
                                <h4>뭉치</h4>
                                <img src="icon/icon_man.png">
                                <p>나이 : 2개월</p>
                                <p>푸들</p>
                                <p class="con4-more">MORE</p>
                            </div>
                        </a>
                            <div class="con4-box-text clear">
                                <div class="text-left clear">
                                    <img src="icon/heart.png">
                                </div>
                                <div>
                                    <p>뭉치</p>
                                </div>
                            </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color2">
                        <div class="con4-hover">
                            <h4>똘이</h4>
                            <img src="icon/icon_women.png">
                            <p>나이 : 4개월</p>
                            <p>고양이</p>
                            <p class="con4-more">MORE</p>
                        </div>
                        </a>  
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                            <p>토르</p>
                            </div>
                        </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color3">
                        <div class="con4-hover">
                            <h4>깜이</h4>
                            <img src="icon/icon_man.png">
                            <p>나이 : 3개월</p>
                            <p>닥스훈트</p>
                            <p class="con4-more">MORE</p>
                        </div>
                        </a>
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                            <p>깜이</p>
                            </div>
                        </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color4">
                        <div class="con4-hover">
                            <h4>아부</h4>
                            <img src="icon/icon_man.png">
                            <p>나이 : 2개월</p>
                            <p>고슴도치</p>
                            <p class="con4-more">MORE</p>
                        </div>
                          </a>
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                            <p>아부</p>
                            </div>
                        </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color5">
                        <div class="con4-hover">
                            <h4>이아고</h4>
                            <img src="icon/icon_man.png">
                            <p>나이 : 1살</p>
                            <p>앵무새</p>
                            <p class="con4-more">MORE</p> 
                        </div>
                        </a>
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                            <p>이아고</p>
                            </div>
                        </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color6">
                        <div class="con4-hover bg6">
                            <h4>냥냥이</h4>
                            <img src="icon/icon_women.png">
                            <p>나이 : 1살</p>
                            <p>고양이</p>
                            <p class="con4-more">MORE</p>
                        </div>
                        </a>
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                                <p>냥냥이</p>
                            </div>
                        </div>
                    </div>
                    <div class="con4-box">
                        <a href="sub4-1.html" class="hover-color7">
                        <div class="con4-hover bg6">
                            <h4>점박이</h4>
                            <img src="icon/icon_women.png">
                            <p>나이 : 2살</p>
                            <p>레오파드</p>
                            <p class="con4-more">MORE</p>
                        </div>
                        </a>
                        <div class="con4-box-text clear">
                            <div class="text-left clear">
                                <img src="icon/heart.png">
                            </div>
                            <div>
                            <p>점박이</p>
                            </div>
                        </div>
                    </div>                 
                </div>
                <!-- <div class="con4-arrow">
                    <a href="sub4-1.html">
                    <img src="icon/right-arrow.png">
                    <p>More</p>
                    </a>
                </div> -->
            </div>
        </div>
    </div>
    <!-- 하단 지도 -->
    <div id="footer">
        <div class="footer-direction-area">
        <div class="footer-direction-center clear">
            <div  style="float:left;">
                <h3>Direction</h3>
                <p>오시는 길</p>
            </div>
            <!-- 맵 연동은 맨 마지막 -->
            <!-- <div id="map" style="width:837px;height:428px; float:left; margin-left:50px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b39455382198dd3c3860a5e9a81fdcc3"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(37.38563310000001,127.12113090000003),
                    level: 3
                };
        
                var map = new kakao.maps.Map(container, options);
            </script> -->
        </div>
    </div>
    <div class="footer-basic">
        <div class="footer-center clear">
            <div class="fot-left">
                <h1 class="fot-logo"><a href="#"><img src="icon/logo_lightgreen.png"></a></h1>
                <p>© 2016 HAEMARU Referral Animal Hospital All rights Reserved.</p>
            </div>
            <div class="fot-right clear">
                <div class="right-1">
                    <p>Address</p>
                    <p>경기도 성남시 분당구 황새울로 319번길 수의과학회관 1~4층</p>
                    <div class="fot-phone">
                        <p>Tel.</p>
                        <p> 031 ) 781 - 2992</p>
                    </div>
                    <div class="fot-fax">
                        <p>Fax.</p>
                        <p>031 ) 781 - 2993</p>
                    </div>
                </div>
                <div class="right-2">
                    <p>E-mail</p>
                    <p>help@haemaru.co.kr</p>
                    <ul class="fot-info clear">
                        <li><a href="#">개인정보취급방침</a></li>
                        <li><a href="#">이메일무단수집거부</a></li>
                    </ul>
                </div>
            </div>
            <img class="fot-icon" src="icon/footer-icon.png">
        </div>
    </div>
</div>
</body>
</html>