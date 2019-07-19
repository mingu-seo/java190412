<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>입양후기등록</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub4-3.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>

</head>
<body>
  <%@ include file="/WEB-INF/view/include/headHtmlMain.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- 입양후기확인창 부분 -->
            <div class="abopt-page">
                <div class="headline">
                    <p>입양후기등록</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="abopt-page-text">
                    <img src="img/con2-4.png">
                    <h2><a href="/index.do"><img src="/icon/logo_lightgreen.png"></a></h2>
                    <p>남정우 님의 후기가 등록되었습니다.</p>
                </div>
                <div class="abopt-checkbox-page">
                    <a class="abopt-check-in" href="#">확인</a>
                </div>
            </div>
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>입양</h2>
                    <p>adopt an animal</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="/adopt/animalprofile">프로필</a></li>
                    <li><a href="/adopt/review/review.do">입양후기</a></li>
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
                <h3>입양후기 등록</h3>
                <p>내 반려동물의 입양 후기를 등록해주세요.</p>
                <div class="sub4-3-box-group">
                    <!-- 이메일 부분 -->
                    <div class="sub4-3-email clear">
                        <p>e-mail</p>
                        <div class="sub4-3-emailbox">
                            <form method="GET" action="text.php">
                                <input type="text" id="email_text_input" placeholder="후기를 등록해주세요.">
                            </form>
                        </div>
                    </div>
                    <div class="sub4-3-box clear">
                        <!-- 반려동물 사진 추가 부분 -->
                        <div class="sub4-3-list">
                            <div class="sub4-petplus-img">
                                <img src="/icon/icon_plus.png">
                                <img src="/icon/sub_dog.png">
                                <h4>반려동물 사진 추가</h4>
                                <p>사진을 추가해주세요.</p>
                            </div>
                            <div class="sub4-file"><a href="#">파일찾기</a></div>
                        </div>
                        <!-- 후기 적는 텍스트 박스 부분 -->
                        <div class="sub4-3-list">
                            <form method="GET" action="text.php">
                                <input type="text" id="text_input" placeholder="후기를 등록해주세요.">
                            </form>
                        </div>
                    </div>
                    <!-- 등록하기 버튼 부분 -->
                    <div class="review-last-box">
                        <a href="#">등록하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>