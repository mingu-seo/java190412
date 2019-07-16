<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>예약확인</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub6-3.css">
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
            <!-- 예약취소 창 -->
            <div class="reservation-cancel2-page">
                <div class="headline">
                    <p>예약취소</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="re-cancel2-page-text">
                    <img src="/img/con2-4.png">
                    <h2>Reservation</h2>
                    <p>2019년 06월 20일 오전 10:00분<br/><span>남정우 </span>님의 예약을 취소하시겠습니까?</p>
                </div>
                <div class="cancel2-checkbox-page clear">
                    <a class="re-cancel2-check-in" href="#">예</a>
                    <a class="re-cancel2-check-out" href="#">아니요</a>
                </div>
            </div>
            <!-- 예약취소 마지막 창 -->
            <div class="reservation-cancel-page">
                <div class="headline">
                    <p>예약취소</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="re-cancel-page-text">
                    <img src="/img/con2-4.png">
                    <h2>Reservation</h2>
                    <p>2019년 06월 21일 13:18분<br/><span>남정우 </span>님의 예약이 취소 되었습니다.</p>
                </div>
                <div class="cancel-checkbox-page">
                    <a class="re-cancel-check-in" href="#">확인</a>
                </div>
            </div>
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>마이페이지</h2>
                    <p>my page</p>
                </div>
                <ul class="sub-bar">
                    <li><a href="my-infor.jsp">나의정보</a></li>
                        <li><a href="my-pet.jsp">나의반려동물</a></li>
                    <li class="on"><a href="my-res.jsp">예약확인</a></li>
                    <li><a href="my-ask.jsp">문의내역</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>예약확인</h3>
                <p>Reveration</p>
                <div class="sub6-3-main">
                    <div class="sub6-3-head clear">
                        <img src="/icon/sub6-icon-person.jpg">
                        <h3><span>남정우</span> 님의 예약 정보입니다.</h3>
                    </div>
                    <div class="sub6-3-boxgroup">
                        <div class="sub6-3-box">
                            <h2>일반진료</h2>
                            <p><span>담당의사</span>최 경 욱 / 진료수의사</p>
                            <p><span>진료과목</span>외과</p>
                            <p><span>진료내용</span>사고 드레싱</p>
                            <p><span>참고사항*</span>-</p>
                            <p><span>예약시간</span>2019 년 &nbsp; 06 월 &nbsp; 20 일 &nbsp;&nbsp; &nbsp; 오전 &nbsp; 10 : 00  &nbsp;예약</p>
                            <div class="sub6-3-btn clear">
                                <div><a href="sub3-1.html">예약변경</a></div>
                                <div class="cancel-btn"><a href="#">취소하기</a></div>
                            </div>
                        </div>
                        <div class="sub6-3-box">
                            <h2>예방접종</h2>
                            <p><span>담당의사</span>최 경 욱 / 진료수의사</p>
                            <p><span>진료과목</span>내과</p>
                            <p><span>진료내용</span>심장사상충</p>
                            <p><span>참고사항*</span>입마개필수*</p>
                            <p><span>예약시간</span>2019 년 &nbsp; 07 월 &nbsp; 01 일 &nbsp;&nbsp; &nbsp; 오후 &nbsp; 02 : 00  &nbsp;예약</p>
                            <div class="sub6-3-btn">
                                <div><a href="sub3-1.html">예약변경</a></div>
                                <div class="cancel-btn"><a href="#">취소하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="sub6-3-more"><a href="sub3-1.html">예약 하러 가기</a></div>
                </div>
            </div>
        </div>
    </div>
       <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>