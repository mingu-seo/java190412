<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>외과</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sub2-1.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/reset.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
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
                    <p>information</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="sub2-1.html">외과</a></li>
                    <li ><a href="sub2-2.html">내과</a></li>
                    <li><a href="sub2-3.html">영상의학과</a></li>
                    <li><a href="sub2-4.html">응급중환자의료센터</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>외과</h3>
                <p>Surgery</p>
                <div class="medicine-box clear">
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                                <div class="medicine-hover">
                                    <div class="medicine-opa">
                                        <h4>일반 외과</h4>
                                        <h6>General Surgery</h6>
                                        <img src="icon/medicine-class.png">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>일반 외과</h3>
                            <h5>일반 외과에서는 소화기, 비뇨기, 간담도계, 내분비계, 생기계, 귀질환과 같은 Soft tissue에 대한 수술을 진행하고 있습니다. 특히 내과 및 중환자 수의사와 협업하여 노령견에 있어 수술적인 접근이 필요한 종양이나 비뇨기계, 담도폐쇄에 대해 많은 수술을 진행하고 있습니다. 이런 수술을 진행함에 있어 최신 기법을 도입하여 레이저, 스텐트, 복강경 등 다양한 시술이 가능할 수 있도록 노력하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>흉부 외과</h4>
                                    <h6>Thoracic surgery</h6>
                                    <img src="icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>흉부 외과</h3>
                            <h5>흉부 외과에서는 접근하기 어려운 흉강 내에 발생한 질환에 대한 정밀한 수술들이 이루어지고 있습니다. 흉강 내를 지나가는 식도 관련 질환, 외상 혹은 선천적 이상으로 인한 다양한 형태의 탈장들, 동맥관 개존증이나 우대동맥궁 잔존증과 같은 혈관 기형, 폐실질 질환에 대해 숙련된 노하우를 바탕으로 수술을 실시하고 있습니다..</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>정형 외과</h4>
                                    <h6>Orthopedics</h6>
                                    <img src="icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>정형 외과</h3>
                            <h5>정형외과에서는 골절과 관절 질환의 수술적 교정을 담당합니다. 골절의 유형과 환자의 상태에 따라 내고정 혹은 외골격 고정술을 실시하며, 특히 일반적인 수술로는 치료가 어려운 복잡 골절과 개방성 골절에 대해서는 외골격 고정술을 적용하여 연부 조직의 손상을 최소화 하여 수술 후 빠른 치유가 가능하도록 만전을 기하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>신경 외과</h4>
                                    <h6>Neurosurgery</h6>
                                    <img src="icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>신경 외과</h3>
                            <h5>신경 검사를 통해 병변 부위를 국소화한 후 MRI검사를 통해 확진과 기타 질환과의 감별을 합니다. 필요한 경우 응급 수술을 통해 척수 손상이 추가적으로 발생하기 전에 탈출 된 디스크 물질을 제거하여 환자가 빠르게 회복할 수 있도록 하고 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>치과</h4>
                                    <h6>Dentist</h6>
                                    <img src="icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>치과</h3>
                            <h5>치과에서는 만성 질환이 있거나 노령 등의 이유로 마취가 어려운 환자의 예방적 스케일링에서부터 치주 질환이 있는 환자의 전문적인 치주치료까지 환자의 치아상태에 따른 치과 관리를 종합적으로 실시하고 있습니다. 육안이나 일반 방사선 사진으로 확인하기 힘든 치근, 치주의 질환이 의심될 경우, 보다 정밀히 진단하기 위하여 구강 내 방사선(Intraoral radiograph) 촬영을 실시합니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>안과</h4>
                                    <h6>Ophthalmology</h6>
                                    <img src="icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>안과</h3>
                            <h5>안과에서는 신경 안과적 검사에서부터 안저 검사까지 총체적인 안검사를 통해 다양한 안과 질환을 진단합니다. 안약 투약으로 치료 가능한 단순한 각결막 질환에서부터 안검 이상 교정을 위한 안검 성형, 첩모제거와 같은 기본 안과 수술을 포함하여, 백내장, 녹내장 수술과 같은 미세수술까지도 전문적으로 진행하고 있습니다. 또한 망막 전위도 검사(ERG) 통하여 선천성 망막 질환의 조기 진단이나 후천성 망막질환의 확진이 가능하며, 이 검사를 통하여 백내장 수술 이전에도 망막의 기능 이상 여부를 확인할 수 있습니다.</h5>
                        </div>
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