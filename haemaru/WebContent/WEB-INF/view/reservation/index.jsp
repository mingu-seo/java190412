<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>예약하기</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub3-1.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
   <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- 예약확인창 부분 -->
            <div class="reservation-ck-page">
                <div class="headline">
                    <p>예약확인</p>
                    <img src="icon/footer-icon.png">
                </div>
                <div class="re-page-ck-text">
                    <img src="img/con2-4.png">
                    <h2>Reservation</h2>
                    <p>2019년 06월 20일 13:05분<br/><span>남정우 </span>님 예약 하시겠습니까?</p>
                </div>
                <div class="re-page-ck-form">
                    <form method="GET" action="text.php"><input type="text" id="re-page-ck-input" name="re-page-ck-input" placeholder="예약 관련 참고사항을 작성해주세요." maxlength="30"></form>
                </div>
                <div class="checkbox-ck-page">
                    <a class="re-check-ck-in" href="#">예</a>
                    <a class="re-check-ck-out" href="#">아니요</a>
                </div>
            </div>
            <!-- 예약 확인 마지막창 부분 -->
            <div class="reservation-page">
                <div class="headline">
                    <p>예약확인</p>
                    <img src="icon/footer-icon.png">
                </div>
                <div class="re-page-text">
                    <img src="img/con2-4.png">
                    <h2>Reservation</h2>
                    <p>2019년 06월 20일 13:05분<br/><span>남정우 </span>님의 예약이 확정 되었습니다.</p>
                </div>
                <div class="checkbox-page">
                    <a class="re-check-in" href="#">확인</a>
                </div>
            </div>
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>예약</h2>
                    <p>Reservation</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="#">진료예약</a></li>
                    <!-- <li><a href="sub6-3.html">예약확인</a></li> -->
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>예약</h3>
                <p>Reservation</p>
                <div class="search-btn"><a href="#">검색</a></div>
                <form class="reservation-check clear">
                    <div class="re-day-box">
                        <span><label for="id_day"  class="re-day">예약 날짜</label></span>
                        <select class="re-select">
                            <option >선택하기</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>
                    </div>
                    <div class="major-box">
                        <span><label for="id_major"  class="major">진료 과목</label></span>
                        <select class="major-select">
                            <option>선택하기</option>
                            <option>내과</option>
                            <option>외과</option>
                            <option>영상의학과</option>
                            <option>응급의료센터</option>
                        </select>
                    </div>
                </form>
                <div class="doctor">
                    <div class="doctor-box clear">
                        <div>
                            <img src="img/sub7.png">
                        </div>
                        <div>
                            <p><span>담당의사</span>최 경 욱 / 진료수의사</p>
                            <p><span>진료과목</span>외과</p>
                            <form><p><span>예약가능시간</span><input type="radio" id="doc_radio" name="radio_doc"><label for="doc_radio">월 오전 10시</label>
                                                             <input type="radio" id="doc_radio2" name="radio_doc"><label for="doc_radio2">수 오전 10시</label></p></form>
                            <div class="doc-btn">
                                <a href="#">예약하기</a>
                            </div>
                            <img src="icon/doctor1.jpg">
                        </div>
                    </div>
                    <div class="doctor-box clear">
                        <div>
                            <img src="img/sub11.png">
                        </div>
                        <div>
                            <p><span>담당의사</span>김 하 나 / 팀장</p>
                            <p><span>진료과목</span>응급중환자센터</p>
                            <form><p><span>예약가능시간</span><input type="radio" id="doc_radio3" name="radio_doc"><label for="doc_radio3">월 오후 2시</label>
                                                             <input type="radio" id="doc_radio4" name="radio_doc"><label for="doc_radio4">수 오후 3시</label></p></form>
                            <div class="doc-btn">
                                <a href="#">예약하기</a>
                            </div>
                            <img src="icon/doctor2.jpg">
                        </div>
                    </div>
                    <div class="doctor-box clear">
                        <div>
                            <img src="img/sub16.png">
                        </div>
                        <div>
                            <p><span>담당의사</span>양 재 원 / 진료수의사</p>
                            <p><span>진료과목</span>응급중환자센터</p>
                            <form><p><span>예약가능시간</span><input type="radio" id="doc_radio5" name="radio_doc"><label for="doc_radio5">목 오후 2시</label>
                                                             <input type="radio" id="doc_radio6" name="radio_doc"><label for="doc_radio6">금 오전 11시</label></p></form>
                            <div class="doc-btn">
                                <a href="#">예약하기</a>
                            </div>
                            <img src="icon/doctor1.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>