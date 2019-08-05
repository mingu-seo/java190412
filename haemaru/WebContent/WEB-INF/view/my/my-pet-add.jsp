<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 반려동물 추가부분 -->
<div id="pet-plus">
            <div class="pet-plus-area">
                <div class="petplus-head">
                    <p>반려동물 추가</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="petplus-page">
                    <div class="petplus-back-arrow">
                        <a href="#"><img src="/icon/backarrow.png">
                        <P>뒤로가기</P></a>
                    </div>
                    <h1 class="petplus-logo">
                        <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                    </h1>
                    <div class="pet-plus-box clear">
                        <div class="petplus-img">
                            <div>
                                <img src="/img/sub6-2-petimg.jpg">
                            </div>
                            <div><a href="#"><input type="file" id="image_tmp" name="image_tmp"/>파일찾기</a></div>
                        </div>
                        <div class="petplus-text">
                            <form class="petplus-form" method="POST" action="/my/my-pet-add.do" enctype="multipart/form-data">
                                <div class="petplus_name_box">
                                    <span><label for="id_input" class="label">이름</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="name" class="cover-size2" placeholder="이름을 입력하세요.">
                                </div>
                                <div class="petplus_age_box">
                                    <span><label for="id_input" class="label">나이</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="age" class="cover-size2" placeholder="나이를 입력하세요.">
                                </div>
                                <div class="petplus_gender_box"><span><label for="id_input" class="label">성별</label></span>
									<input type="radio" id="radio01" name="gender" value="2" ><label for="radio01" class="label">남아</label>
									<input type="radio" id="radio02" name="gender" value="1" ><label for="radio02" class="label">여아</label>
								</div><br>
                                <div class="petplus_list_box">
                                    <span><label for="id_input" class="label">품종</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="breed" class="cover-size2" placeholder="ex ) 도베르만">
                                </div>
                                <div class="petplus_doc_box">
                                    <span><label for="id_input" class="label">최근 접종 현황</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="vac" class="cover-size2">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="bot-plus">
                        <div class="petplus-form-btn">
                            <div class="petplus-btn clear">
                                <input type="reset" value="취소" id="btn_reset3">
                                <input type="button" value="반려동물 추가" id="btn_submit3" onclick="goSave();">
                            </div>
                        </div>
                        <ul class="petplus-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>