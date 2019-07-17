<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문의하기</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/sub5-5.css">
    <link rel="stylesheet" href="css/footer.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
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
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="sub5-1.html">공지사항</a></li>
                    <li><a href="sub5-2.html">FAQ</a></li>
                    <li class="on"><a href="sub5-3.html">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의하기</h3>
                <p>Ask for infomation</p>
                <!-- 문의글 내용 부분 -->
                <div class="sub5-5-area">
                    <div class="sub5-5-info clear">
                        <h5><span>제목</span>재활치료 문의 드립니다.</h5>
                        <div class="sub5-5-writer clear">
                            <div class="sub5-5-img"></div>
                            <div class="sub5-5-day">
                                <p>한서하(mail***)</p>
                                <p>2019-07-05</p>
                            </div>
                        </div>
                    </div>
                    <div class="sub5-5-box">
                        <p>선생님!</p>
                        <p>재활치료 문의 드려요!</p>
                        <p>다음 예방 접종하러 언제 가면 좋을까요??</p>
                    </div>
                    <ul class="sub5-5-btn clear">
                        <li><a href="sub5-3.html">목록으로</a></li>
                        <li><a href="sub5-3.html">수정하기</a></li>
                    </ul>
                    <ul class="sub5-5-page">
                        <li><a href="sub5-3.html"><span>이전글</span><span>진료예약 문의 드립니다.</span><span>윤미연(mail***)</span><span>2019-05-04</span></a></li>
                        <li><a href="sub5-3.html"><span>다음글</span><span>고양이 중성화수술 문의드립니다.</span><span>이윤(mail***)</span><span>2019-05-01</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>