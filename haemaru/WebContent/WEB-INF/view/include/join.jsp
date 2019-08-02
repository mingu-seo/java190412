  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <form class="join-form" id="joinFrm" method="POST" action="/member/join" onsubmit="return goJoin();">
                        <div class="email_box">
                            <span><label for="id_input" class="label">이메일</label></span>
                            <input type="text" maxlength="20" id="email1" name="email1" class="half-size">
                            <select class="emial-select" name="email2" id="email2">
                                <option value="@naver.com">@naver.com</option>
                                <option value="@daum.net">@daum.net</option>
                                <option value="@gmail.com">@gmail.com</option>
                            </select>
                        </div>
                        <div class="pass_box">
                            <span><label for="id_pass_join"  class="label">비밀번호</label></span>
                            <input type="password" maxlength="12" id="id_pass_join" name="pw" placeholder="비밀번호를 입력하세요." class="cover-size">
                        </div>
                        <div class="pass_box_check">
                            <span><label for="id_pass_check"  class="label">비밀번호확인</label></span>
                            <input type="password" maxlength="12" id="id_pass_check" 	placeholder="비밀번호를 다시 입력하세요." class="cover-size">
                        </div>
                        <div class="name_box">
                            <span><label for="id_input"  class="label">이름</label></span>
                            <input type="text" maxlength="5" id="id_input" name="name" placeholder="이름을 입력하세요." class="cover-size">
                        </div>
                        <div class="birth_box">
                            <span><label for="id_birth"  class="label">생년월일</label></span>
                            <input type="text" maxlength="8" id="birth_input" name="birth" placeholder="ex ) 19890107" class="cover-size">
                        </div>
                        <div class="phone_box">
                            <span><label for="id_phone"  class="label">전화번호</label></span>
                            <select class="phone-select" id="tel1" name="tel1">
                                <option value='010'>010</option>
                                <option value='011'>011</option>
                                <option value='018'>018</option>
                            </select>
                            <input type="text" maxlength="4" id="tel2" name="tel2"  class="half-size">
                            <input type="text" maxlength="4" id="tel3" name="tel3"  class="half-size half">
                        </div>
                        <div class="join-btn clear">
                            <input type="reset" value="취소" id="btn_reset">
                            <input type="submit" value="회원가입" id="btn_submit">
                        </div>
                        <input type="hidden" name="email" id="email" value="" />
                        <input type="hidden" name="tel" id="tel" value="" />
                        <input type="hidden" name="idcheck" id="idcheck" value="0" />
                    </form>
                    <ul class="join-bot clear">
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">이메일무단수집거부</a></li>
                     </ul>
                </div>
            </div>
        </div>