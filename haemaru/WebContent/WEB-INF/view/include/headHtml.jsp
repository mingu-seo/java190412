  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- header html -->
    <div id="header">
        <!-- 로그인 -->
        <div id="login-wrap"><!--화면 끄는 코드--></div>
        <div id="login">
                    <div class="login-center">
                        <div class="head-box clear">
                            <p>Login</p>
                            <img src="/icon/footer-icon.png">
                        </div>
                        <div class="login-page">
                            <div class="back-arrow">
                                <a href="#"><img src="/icon/backarrow.png">
                                <P>뒤로가기</P></a>
                            </div>
                            <h1 class="login-logo">
                                <a href="#"><img src="/icon/logo_lightgreen.png"></a>
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
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="join-page">
                    <div class="join-back-arrow">
                        <a href="#"><img src="/icon/backarrow.png">
                        <P>뒤로가기</P></a>
                    </div>
                    <h1 class="join-logo">
                        <a href="#"><img src="/icon/logo_lightgreen.png"></a>
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

        <h1 class="header-logo"><a href="/index.do"><img src="/icon/logo_lightgreen.png"></a></h1>
        <!-- GNB MENU -->
        <div class="header-center clear">
            <!-- gnb & sub menu -->
            <ul class="gnb clear">
                <li>
                    <a href="/intro/intro-hi.do">병원소개</a>
                    <ul class="header-sub">
                        <li><a href="/intro/intro-hi.do">인사말</a></li>
                        <li><a href="/intro/intro-staff.do">의료진소개</a></li>
                        <li><a href="/intro/intro-map.do">오시는길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="department/surgery.do">진료과목</a>
                    <ul class="header-sub">
                        <li><a href="department/surgery.do">외과</a></li>
                        <li><a href="department/internal.do">내과</a></li>
                        <li><a href="department/radiology.do">영상의학과</a></li>
                        <li><a href="department/emergency.do">응급의료센터</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/reservation/index.do">예약</a>
                    <ul class="header-sub">
                        <li><a href="/reservation/index.do">진료예약</a></li>
                    </ul>
                </li>
                <li>
                    <a href="adopt/animalprofile">입양</a>
                    <ul class="header-sub">
                        <li><a href="adopt/animalprofile">프로필</a></li>
                        <li><a href="adopt/review/review.do">입양후기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="cscenter/notice/notice.do">고객센터</a>
                    <ul class="header-sub">
                        <li><a href="cscenter/notice/notice.do">공지사항</a></li>
                        <li><a href="cscenter/faq/faq.do">FAQ</a></li>
                        <li><a href="cscenter/qna/qna.do">문의하기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/my/my-infor.do">마이페이지</a>
                    <ul class="header-sub">
                        <li><a href="/my/my-infor.do">나의정보</a></li>
                        <li><a href="/my/my-pet.do">나의반려동물</a></li>
                        <li><a href="/my/my-res.do">예약확인</a></li>
                        <li><a href="/my/my-ask.do">문의내역</a></li>
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
                <img src="/icon/footer-icon.png">
            </div>
            <div class="pass-page">
                <div class="pass-back-arrow">
                    <a href="#"><img src="/icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-logo">
                    <a href="#"><img src="/icon/logo_lightgreen.png"></a>
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
                <img src="/icon/footer-icon.png">
            </div>
            <div class="pass-chk-page">
                <div class="pass-chk-back-arrow">
                    <a href="#"><img src="/icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-chk-logo">
                    <a href="#"><img src="/icon/logo_lightgreen.png"></a>
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
