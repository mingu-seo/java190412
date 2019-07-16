<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>나의 반려동물 정보</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub6-2.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <script type="text/javascript" src='/js/sub6-1.js'></script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
   <div id="container">
    <!-- con1 : 배너 사진 부분-->
    <div class="con1"></div>
    <!-- con2 : 메인 부분 -->
    <div class="con2">
        <!-- 정보수정 반려동물 부분 -->
        <div id="mypet-area">
                <div class="mypet-box">
                    <div class="mypet-head">
                        <p>반려동물 정보 수정</p>
                        <img src="/icon/footer-icon.png">
                    </div>
                    <div class="mypet-page">
                        <div class="mypet-back-arrow">
                            <a href="#"><img src="/icon/backarrow.png">
                            <P>뒤로가기</P></a>
                        </div>
                        <h1 class="mypet-logo">
                            <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                        </h1>
                        <form class="mypet-form" method="GET" action="text.php">
                            <div class="petname_box">
                                <span><label for="pet_name" class="label">My pet 이름</label></span>
                                <input type="text" maxlength="20" id="pet_name" name="pet_name" class="cover-size" placeholder="이름을 입력하세요.">
                            </div>
                            <div class="petage_box">
                                    <span><label for="pet_old" class="label">My pet 나이</label></span>
                                    <input type="text" maxlength="20" id="pet_old" name="pet_old" class="cover-size" placeholder="나이를 입력하세요.">
                            </div>
                            <div class="petgender_box">
                                <span>My Pet 성별</span>
                              
                                <input type="radio" id="radio01" name="pet_sex_radio">
                                <label for="radio01"  class="label">남자</label>
                               
                                <input type="radio" id="radio02" name="pet_sex_radio">
                                <label for="radio02"  class="label">여자</label>
                            </div>
                            <div class="petlist_box">
                                    <span><label for="pet_class"  class="label">My Pet 품종</label></span>
                                    <input type="text" maxlength="5" id="pet_class" name="pet_class" class="cover-size">
                            </div>
                            <div class="petdoc_box">
                                <span><label for="pet_helth"  class="label">최근 접종 현황</label></span>
                                <input type="text" maxlength="5" id="pet_helth" name="pet_health" class="cover-size">
                            </div>
                            <div class="mypet-btn clear">
                                <input type="reset" value="취소" id="btn_reset2">
                                <input type="submit" value="수정" id="btn_submit2">
                            </div>
                        </form>
                        <ul class="mypet-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div>
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
                            <div><a href="#">파일찾기</a></div>
                        </div>
                        <div class="petplus-text">
                            <form class="petplus-form" method="GET" action="text.php">
                                <div class="petplus_name_box">
                                    <span><label for="id_input" class="label">이름</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="id_input" class="cover-size2" placeholder="이름을 입력하세요.">
                                </div>
                                <div class="petplus_age_box">
                                    <span><label for="id_input" class="label">나이</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="id_input" class="cover-size2" placeholder="나이를 입력하세요.">
                                </div>
                                <div class="petplus_gender_box">
                                    <span><label for="id_input" class="label">성별</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="id_input" class="cover-size2" placeholder="ex ) 남">
                                </div>
                                <div class="petplus_list_box">
                                    <span><label for="id_input" class="label">품종</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="id_input" class="cover-size2" placeholder="ex ) 도베르만">
                                </div>
                                <div class="petplus_doc_box">
                                    <span><label for="id_input" class="label">최근 접종 현황</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="id_input" class="cover-size2">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="bot-plus">
                        <form class="petplus-form-btn" method="GET" action="text.php">
                            <div class="petplus-btn clear">
                                <input type="reset" value="취소" id="btn_reset3">
                                <input type="submit" value="반려동물 추가" id="btn_submit3">
                            </div>
                        </form>
                        <ul class="petplus-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- sub bar 부분 (고정) -->
        <div class="fixed-sub">
            <div class="title-area">
                <h2>마이페이지</h2>
                <p>my page</p>
            </div>
            <ul class="sub-bar">
                <li ><a href="/my/my-infor.do">나의 정보</a></li>
                <li class="on"><a href="/my/my-pet.do">반려동물 정보</a></li>
                <li><a href="/my/my-res.do">예약확인</a></li>
                <li><a href="/my/my-ask.do">문의내역</a></li>
            </ul>
        </div>
        <!-- main 부분 (여기다가 하면 됨) -->
        <div class="main">
            <h3>나의 반려동물</h3>
            <p>My Pet</p>
            <!-- 펫 -->
            <div class="sub6-pet clear">
                <div class="sub6-text clear">
                    <a class="pet-plus-more" href="#">반려동물추가</a>
                </div>
                <div class="pet-box-center">
                    <div class="pet-box clear">
                        <div>
                            <img src="/img/mypagedog1.jpg">
                        </div>
                        <div>
                            <p><span>이름</span>별이</p>
                            <p><span>나이</span>3살</p>
                            <p><span>품종</span>푸들</p>
                            <p><span>성별</span>여</p>
                            <p><span>최근 접종 현황</span>4차접종완료</p>
                        </div>
                        <div>
                            <div class="sub6-more"><a href="#">EDIT</a></div>
                        </div>
                    </div>
                    <div class="pet-box clear">
                        <div>
                            <img src="/img/mypagedog2.jpg">
                        </div>
                        <div>
                            <p><span>이름</span>난이</p>
                            <p><span>나이</span>7살</p>
                            <p><span>품종</span>푸들</p>
                            <p><span>성별</span>남</p>
                            <p><span>최근 접종 현황</span>6월 심장사상충 접종</p>
                        </div>
                        <div>
                            <div class="sub6-more"><a href="#">EDIT</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sub6-botbox">
                <p><span>남 정 우</span> 님의 다음 진료 / 접종 예정일은 2019 년 06 월 20 일 입니다.</p>
            </div>
        </div>
    </div>
</div>
      <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>