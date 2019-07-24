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
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-4.css">
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
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="cscenter/notice/notice.do">공지사항</a></li>
                    <li><a href="cscenter/faq/faq.do">FAQ</a></li>
                    <li class="on"><a href="cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의하기</h3>
                <p>Ask for infomation</p>
                <div class="sub5-4-area">
                    <div class="sub5-4-title clear">
                        <img src="/icon/sub_dog.png">
                        <h2>해마루 이차진료 동물병원에서 여러분이 자주 궁금해 하시는 사항들을 문의해주세요.</h2>
                    </div>
                    <div class="sub5-4-box">
                        <form method="GET" action="text.php">
                            <div class="sub5-4-email">
                                <label for="sub_email">e-mail</label>
                                <input type="text" maxlength="20" id="sub_email">
                            </div>
                            <div class="sub5-4-write">
                                <label for="sub_select">카테고리</label>
                                <select class="sub_select">
                                    <option>외과</option>
                                    <option>내과</option>
                                    <option>영상의학과</option>
                                    <option>응급의료센터</option>
                                    <option>예약</option>
                                    <option>입양</option>
                                </select>
                                <label for="sub_title">제목</label>
                                <input type="text" id="sub_title">
                            </div>
                            <div class="sub5-4-text">
                                <textarea id="sub5-4-textarea" placeholder="문의하실 내용을 적어주세요."></textarea>
                            </div>
                            <div class="sub5-4-btn">
                            <input type="submit" value="등록하기" id="sub5_btn_submit">
                            <input type="reset" value="취소하기" id="sub5_btn_reset">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>