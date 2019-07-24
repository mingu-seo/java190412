<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>인사말</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub1-1.css">
    <link rel="stylesheet" href="/css/footer.css">
    <!-- 스크롤 내릴 시 사진 나타내는 플러그인 -->
    <link rel="stylesheet" href="/css/aos.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <!-- 스크롤 내릴 시 사진 나타내는 플러그인 -->
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <script type="text/javascript" src="/js/sub1-1.js"></script>
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
                    <li class="on"><a href="/intro/intro-hi.do">인사말</a></li>
                    <li><a href="/intro/intro-staff.do">의료진소개</a></li>
                    <li><a href="/intro/intro-map.do">오시는길</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>인사말</h3>
                <p>Greetings</p>
                <h4 class="h4-1" data-aos="fade-up"
                data-aos-duration="2000">해마루 동물병원은 2000년 3월 한국 최초의 개인 이차진료 기관으로 설립되어 15년 이상의 역사를 가지고 있습니다.<br/>
                    '해마루'는 '해가 뜨는 언덕'이란 순 우리말로 해는 긍정과 열정을, 언덕은 누구나 함께 오를 수 있는 언덕을 상징하여 "동물과 함께하는 행복한 세상"을 만들겠다는 사명을 품고 있습니다.</h4>
                <h4 class="h4-2" data-aos="fade-up"
                data-aos-duration="2000">해마루는 중증 환자들의 진단과 치료를 위해 높은 의료 수준을 유지하기 위해 항상 노력하고 있으며<br/>
                    축적된 임상 경험을 교육사업부(iHAEDU)를 통해 전파하여 한국 뿐만 아니라 아시아 수의학과 반려동물 문화 발전에 기여하고 있습니다.<br/>
                    해마루 설립 초기부터 함께 운영한 소동물 임상의학 연구소는 반려동물 임상 연구를 넘어서 사람의 질병 진단과 치료에 도움이 되는 연구를 수행하고 있습니다.</h4>
                <h4 class="h4-3" data-aos="fade-up"
                data-aos-duration="2000">해마루는 모든 역량을 집중하여 2020년 아시아 최고의 이차진료 동물병원으로 도약하고자 합니다.<br/>
                    이를 위해 2015년 해마루 Way Project를 통해 '최고지향', '상호존중', '행복기여'를 핵심 가치로 재정립하고 '전문성', '유연성', '창조성' 있는 인재들과 함께 나아가고 있습니다.</h4>
                <h4 class="h4-4" data-aos="fade-up"
                data-aos-duration="2000">앞으로도 끊임없는 연구를 통해 반려동물과 함께 하는 행복한 세상 구현을 위해 최선을 다하겠습니다.</h4>
                <div class="img-left clear" data-aos="fade-right"  data-aos-duration="2000">
                    <img src="/img/kjg.jpg">
                </div>
                <div class="img-right clear" data-aos="fade-left"  data-aos-duration="2000">
                    <img src="/img/khw.png">
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>