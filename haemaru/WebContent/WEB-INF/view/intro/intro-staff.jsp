<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>의료진소개</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub1-2.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <!-- 정렬 플러그 인 -->
    <script type="text/javascript" src="/js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="/js/sub1-2.js"></script>
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
                    <li class="on"><a href="/intro/intro-staff.do">의료진소개</a></li>
                    <li><a href="/intro/intro-map.do">오시는길</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <div class="top-arrow">
                    <a href="#">
                        <img src="/icon/top-arrow.png">
                        <p>위로가기</p>
                    </a>
                </div>
                <h3>의료진소개</h3>
                <p>Staff</p>
                <!-- 탭 메뉴 리스트 부분 -->
                <ul class="tab-list clear">
                    <li data-staff='*' class="on"><a href="#">원장</a></li>
                    <li data-staff='.staff2'><a href="#">수의사</a></li>
                    <li data-staff='.staff3'><a href="#">테크니션</a></li>
                    <li data-staff='.staff4'><a href="#">리셉션리스트</a></li>
                </ul>
                <!-- 의사 부분 -->
                <div class="tab-info clear">
                    <div class="staff1">
                        <img src="/img/staff/sub1.png">
                        <h4>원장 / 대표이사</h4>
                        <h5>김 현 욱</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1">
                        <img src="/img/staff/sub2.png">
                        <h4>원장 / 대표이사</h4>
                        <h5>김 진 경</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub3.png">
                        <h4>내과 / 팀장</h4>
                        <h5>남 예 림</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub4.png">
                        <h4>내과 / 팀장</h4>
                        <h5>최 새 롬</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub5.png">
                        <h4>내과 / 진료수의사</h4>
                        <h5>이 승 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub6.png">
                        <h4>외과 / 부장</h4>
                        <h5>김 세 은</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub7.png">
                        <h4>외과 / 진료수의사</h4>
                        <h5>최 경 욱</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub8.png">
                        <h4>영상의학과 / 부장</h4>
                        <h5>이 가 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub9.png">
                        <h4>영상의학과 / 팀장</h4>
                        <h5>김 보 은</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub10.png">
                        <h4>응급중환자센터 / 부장</h4>
                        <h5>김 성 훈</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub11.png">
                        <h4>응급중환자센터 / 팀장</h4>
                        <h5>김 하 나</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub12.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>김 은 실</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub13.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>소 하 연</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub14.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>송 주 현</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub15.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>남 우 진</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub16.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>양 재 원</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub17.png">
                        <h4>응급중환자센터 / 진료수의사</h4>
                        <h5>조 유 재</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff2">
                        <img src="/img/staff/sub18.png">
                        <h4>응급중환자센터 / 부장</h4>
                        <h5>임 재 학</h5>
                        <a href="#">MORE</a>
                    </div>
                     <div class="staff1 staff3">
                        <img src="/img/staff/sub19.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>박 혜 린</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub20.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>정 유 진</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub21.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>안 미 희</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub22.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 은 박</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub23.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>정 소 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub24.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>백 현 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub25.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>박 다 정</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub26.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 민 지</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub27.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>손 세 미</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff3">
                        <img src="/img/staff/sub28.png">
                        <h4>내과 / 테크니션</h4>
                        <h5>김 슬 기</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub30.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 현 정</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub29.png">
                        <h4>원무과 / 과장</h4>
                        <h5>국 선 영</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub32.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 미 현</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub31.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>김 종 민</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub34.png">
                        <h4>원무과 / 매니저</h4>
                        <h5>최 양 윤</h5>
                        <a href="#">MORE</a>
                    </div>
                    <div class="staff1 staff4">
                        <img src="/img/staff/sub33.jpg">
                        <h4>원무과 / 매니저</h4>
                        <h5>오 혜 진</h5>
                        <a href="#">MORE</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>