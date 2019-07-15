<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sub5-6.css">
    <link rel="stylesheet" href="css/footer.css">
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
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="sub5-1.html">공지사항</a></li>
                    <li><a href="sub5-2.html">FAQ</a></li>
                    <li class="on"><a href="sub5-3.html">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>공지사항</h3>
                <p>Notice</p>
                <!-- 문의글 내용 부분 -->
                <div class="sub5-6-area">
                    <div class="sub5-6-info clear">
                        <h5><span>제목</span>[소식] 해마루이차진료동물병원 김진경 원장 취임 인터뷰</h5>
                        <div class="sub5-6-writer clear">
                            
                            <div class="sub5-6-day">
                                <p>해마루동물병원</p>
                                <p>2019-07-05</p>
                            </div>
                        </div>
                    </div>
                    <div class="sub5-6-box">
                        <p>김진경 해마루이차진료동물병원장<br/>
                            - 서울대학교 수의과대학 수석 졸업 및 국가고시 수석합격 (2004)
                            - 서울대학교 수의과대학 석박사 수료 (내과학)<br/><br/>
                             
                             
                             
                             Q.  해마루이차진료동물병원장 취임을 축하드립니다! 원장을 맡게 된 배경과 소감에 대해 말씀해주세요.<br/>
                             A.  안녕하세요, 반갑습니다. ㈜해마루는 좀더 효율적인 책임 운영을 위해 올 5월초부터 해마루 동물병원과 경영관리본부를 분리하고 김현욱 전임원장은 해마루 대표원장 및 헬스앤메디슨 CEO로 전임하게 되었습니다. 그러한 사업부 개편의 일환으로, 제가 10년 이상 해마루 동물병원에 근무하면서 해마루 동물병원의 장단점을 잘 알고 복잡한 이차진료병원의 특성에 맞게 병원내 소통을 원활하게 하고 일을 해결해 나가는데 적임자라고 평가되어 70여명 임직원의 해마루 동물병원 원장을 맡게 되었습니다.
                            최근 몇 년간 해마루 동물병원 부서장 세대교체와 내과 전체의 리더로서 이미 많은 진료와 과업무를 담당하고 있었던 터라 병원장이라는 직책과 책임이 부담이 되는 것은 사실이지만, 제 자신과 저를 도와주는 해마루 동물병원 식구들을 믿고 열심히 해보고자 합니다.<br/><br/>
                             
                             
                             Q.  현재 해마루이차진료동물병원은 내과, 외과, 영상의학과, 응급중환자의료센터의 분과 시스템으로 운영되고 있는데요. 그 이유와 장점은 무엇인가요?<br/>
                             A.  해마루 동물병원은 일차진료를 보지 않는 국내 최초의 순수 이차진료병원으로, 의뢰병원 원장님들께서 보내주시는 소중한 복합질환 환자들에 대한 최선의 진단과 치료결과를 내기 위해 노력을 다해 왔습니다. 노령의 복합질환 환자들을 진단 치료하기 위해서는 어느 한 분과나 한 수의사가 잘해서 되는 것이 아니라, 내과, 외과, 영상과, 응급중환자과가 유기적으로 협력해야 하는 것은 당연할 것입니다. 환자 진단 치료 면에서 대학병원만큼의 확실한 분과진료와 병원 내 원활한 부서간 소통이라는 2마리 토끼를 모두 잡을 수 있는 병원이라는 점을 자신 있게 말씀 드리고 싶습니다. 여러 분과의 진단과 치료를 종합적으로 받아야 하는 복합질환 환자가 반드시 좋은 결과로 개선되는 최상의 진료와 보호자 만족을 제공하는 이차진료 동물병원으로 계속 나아갈 것입니다.<br/><br/>
                             
                             
                             Q.  최근 해마루이차진료동물병원은 각과 부서장 구성의 변화가 많은 것으로 알고 있는데, 각과 부서장 소개를 대신 부탁 드립니다. 앞서 자신하셨던 최선의 분과 진료가 제대로 이루어질 수 있는 건가요?<br/>
                             A.  물론입니다. 이전에 계셨던 부서장들 모두 제가 가장 좋아하고 존경하는 수의사들이셨지만, 지금 부서장들도 과간 소통이 잘되며 각 과별로 임상 경험이 오래된 뛰어난 분들이십니다. 해마루 동물병원은 저 김진경 내과부장(원장 겸임), 김세은 외과부장, 이가현 영상진단과부장, 김성훈 응급중환자과부장, 김태은 진료협력부장이 맡고 있으며 이전보다 긴밀한 과별 조율을 진행하는 데 중점을 두고 있기 때문에 대형병원 같지 않은 순발력 있는 대응이 가능합니다. 제대로 된 방향으로 점점 좋아지는 해마루 동물병원이 될 것입니다.<br/>
                            또한, 이 자리를 빌어 해마루 동물병원의 체계적인 정보 공유 시스템을 소개드리고 싶습니다. 해마루 동물병원은 매일 아침 진료진 라운드를 통해 환자 상태를 공유하고 주치의들의 진단 및 치료를 다함께 검토하고 논의합니다. 매주 각과 세미나를 통해 최신 수의학 지식을 내부 공유하고 매월 전체 진료진 세미나를 통해 공통으로 알아야 할 지식을 공유하고 향후 진단 및 치료계획을 업데이트 해나갑니다. 지속적인 자체 교육 시스템을 통해, 해마루 모든 수의사들이 숨쉬듯 진료케이스를 고민하고 스터디하며 성장해나갈 수 있으며, 이것이 바로 해마루의 강점이라고 생각합니다. 또한 의뢰된 환자를 통해 직접 경험한 임상지식과 더불어 새로운 지식을 iHAEDU를 통해 전국의 임상 수의사분들과 아낌없이 나누어 한국 반려동물 수의 임상 발전을 선도하고 있다고 자부합니다.<br/><br/></p>
                    </div>
                    <ul class="sub5-6-btn clear">
                        <li><a href="sub5-1.html">목록으로</a></li>
                       
                    </ul>
                    <ul class="sub5-6-page">
                        <li><a href="sub5-3.html"><span>이전글</span><span>진료예약 문의 드립니다.</span><span>윤미연(mail***)</span><span>2019-05-04</span></a></li>
                        <li><a href="sub5-3.html"><span>다음글</span><span>고양이 중성화수술 문의드립니다.</span><span>이윤(mail***)</span><span>2019-05-01</span></a></li>
                    </ul>
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