  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <form class="login-form" method="POST" action="test.php">
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
                    <!-- 히든으로 갖고와야됨 -->
        </div>