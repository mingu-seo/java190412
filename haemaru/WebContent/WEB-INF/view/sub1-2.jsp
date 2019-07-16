<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>의료진소개</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sub1-2.css">
    <link rel="stylesheet" href="css/footer.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <!-- 정렬 플러그 인 -->
    <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="js/sub1-2.js"></script>
</head>
<body>
    <!-- header html -->
    <div id="header">
        <div id="login-wrap"><!--화면 끄는 코드--></div>
        <!-- 로그인 -->
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
                                <option>naver.com</option>
                                <option>daum.net</option>
                                <option>gmail.com</option>
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
        <h1 class="header-logo"><a href="index.html"><img src="icon/logo_lightgreen.png"></a></h1>
        <!-- GNB MENU -->
        <div class="header-center clear">
            <!-- gnb & sub menu -->
            <ul class="gnb clear">
                <li>
                    <a href="sub1-1.html">병원소개</a>
                    <ul class="header-sub">
                        <li><a href="sub1-1.html">인사말</a></li>
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
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>병원소개</h2>
                    <p>Information</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="sub1-1.html">인사말</a></li>
                    <li class="on"><a href="sub1-2.html">의료진소개</a></li>
                    <li><a href="sub1-3.html">오시는길</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <div class="top-arrow">
                    <a href="#">
                        <img src="icon/top-arrow.png">
                        <p>위로가기</p>
                    </a>
                </div>
                <h3>의료진소개</h3>
                <p>Staff</p>
                <!-- 탭 메뉴 리스트 부분 -->
                <ul class="tab-list clear">
                    <li data-staff='*' class="on"><a href="#">원장</a></li>
                    <li data-staff='.staff2'><a href="#">수의사</a></li>
                    <li data-staff='.staff3'><a href="#">테크니션</a></li>
                    <li data-staff='.staff4'><a href="#">리셉션리스트</a></li>
                </ul>
                <!-- 의사 부분 -->
                <div class="tab-info clear">
                    <div class="staff1">
                        <img src="img/staff/sub1.png">
                        <h4>원장 / 대표이사</h4>
                        <h5>김 현 욱</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1">
                        <img src="img/staff/sub2.png">
                        <h4>원장 / 대표이사</h4>
                        <h5>김 진 경</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub3.png">
                        <h4>내과 / 팀장</h4>
                        <h5>남 예 림</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub4.png">
                        <h4>내과 / 팀장</h4>
                        <h5>최 새 롬</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub5.png">
                        <h4>내과 / 진료수의사</h4>
                        <h5>이 승 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub6.png">
                        <h4>외과 / 부장</h4>
                        <h5>김 세 은</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub7.png">
                        <h4>외과 / 진료수의사</h4>
                        <h5>최 경 욱</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub8.png">
                        <h4>영상의학과 / 부장</h4>
                        <h5>이 가 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub9.png">
                        <h4>영상의학과 / 팀장</h4>
                        <h5>김 보 은</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub10.png">
                        <h4>응급중환자센터 / 부장</h4>
                        <h5>김 성 훈</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub11.png">
                        <h4>응급중환자센터 / 팀장</h4>
                        <h5>김 하 나</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub12.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>김 은 실</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub13.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>소 하 연</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub14.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>송 주 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub15.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>남 우 진</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub16.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>양 재 원</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub17.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>조 유 재</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="img/staff/sub18.png">
                        <h4>응급중환자센터 / 부장</h4>
                        <h5>임 재 학</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff3">
                        <img src="img/staff/sub19.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>박 혜 린</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub20.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>정 유 진</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub21.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>안 미 희</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub22.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 은 박</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub23.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>정 소 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub24.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>백 현 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub25.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>박 다 정</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub26.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 민 지</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub27.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>손 세 미</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="img/staff/sub28.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 슬 기</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub30.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 현 정</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub29.png">
                        <h4>원무과 / 과장</h4>
                        <h5>국 선 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub32.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 미 현</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub31.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 종 민</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub34.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>최 양 윤</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="img/staff/sub33.jpg">
                        <h4>원무과 / 매니저</h4>
                        <h5>오 혜 진</h5>
                        <a href="#">MORE</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
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