<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>오시는길</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub1-3.css">
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
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>병원소개</h2>
                    <p>Information</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/intro/intro-hi.do">인사말</a></li>
                    <li><a href="/intro/intro-staff.do">의료진소개</a></li>
                    <li class="on"><a href="/intro/intro-map.do">오시는길</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>오시는 길</h3>
                <p>Direction</p>
                <img src="/img/map.jpg">
                <div class="text">
                    <div class="text1 clear">
                        <div>
                            <h4>주소</h4>
                            <h5>Address</h5>
                        </div>
                        <div>
                            <p>경기도 성남시 분당구 황새울로 319번길 수의과학회관 1~4층</p>
                        </div>
                    </div>
                    <div class="text1 clear">
                        <div>
                            <h4>자가용</h4>
                            <h5>Own Car</h5>
                        </div>
                        <div>
                            <p>*승용차를 이용하시는 경우 본원 주차 안내원의 안내를 받으시길 바랍니다.</p>
                        </div>
                    </div>
                    <div class="text1 clear">
                        <div>
                            <h4>버스</h4>
                            <h5>Bus</h5>
                        </div>
                        <div>
                            <p>분당 <span>"서현역"</span> 혹은 <span>"삼성플라자(재생병원)"</span> 에서 하차 → 분당 소방서 방향으로 도보 →<br/> 
                                    롯데 마트 후방 흰색 건물 해마루가 위치</p>
                        </div>
                    </div>
                    <div class="text1 clear">
                        <div>
                            <h4>지하철</h4>
                            <h5>Subway</h5>
                        </div>
                        <div>
                            <p><span>분당선 서현역</span>에서 내려 4번출구 → 삼성플라자 2번 게이트로 나와 직진 →<br/>
                                    횡단보도를 건너 50미터 직진하다 좌측 골목 → 10미터 거리의 좌측에 해마루 위치</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>