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
    <link rel="stylesheet" href="/css/sub5-3.css">
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
                    <li ><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li class="on"><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의하기</h3>
                <p>Ask for infomation</p>
                <div class="reply-area">
                    <form class="search-btn" method="GET" action="text.php">
                        <select>
                            <option>전체</option>
                            <option>외과</option>
                            <option>내과</option>
                            <option>영상의학과</option>
                            <option>응급의료센터</option>
                            <option>예약</option>
                        </select>
                        <input type="text" id="search_input" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_search">
                    </form>
                    <div class="reply-table">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Data</th>
                                <th>Writer</th>
                            </tr>
                            <tr>
                                <td>102</td>
                                <td>외과</td>
                                <td><a href="viewqna.do">재활치료 문의 드립니다.</a></td>
                                <td>2019-06-04</td>
                                <td>한서하</td>
                            </tr>
                            <tr>
                                <td>101</td>
                                <td></td>
                                <td><a href="viewqna.do"><span><img src="/icon/icon-reply.png"></span>[re] 한서하 님의 질문 답변입니다.</a></td>
                                <td>2019-06-01</td>
                                <td>해마루동물병원</td>
                            </tr>
                            <tr>
                                <td>100</td>
                                <td>내과</td>
                                <td><a href="viewqna.do">고양이 중성화수술 문의 드립니다.</a></td>
                                <td>2019-05-28</td>
                                <td>이윤</td>
                            </tr>
                            <tr>
                                <td>99</td>
                                <td></td>
                                <td><a href="viewqna.do"><span><img src="/icon/icon-reply.png"></span>[re] 이윤 님의 질문 답변입니다.</a></td>
                                <td>2019-05-13</td>
                                <td>해마루동물병원</td>
                            </tr>
                            <tr>
                                <td>98</td>
                                <td>예약</td>
                                <td><a href="viewqna.do">진료 예약 문의 드립니다.</a></td>
                                <td>2019-05-04</td>
                                <td>윤미연</td>
                            </tr>
                            <tr>
                                <td>97</td>
                                <td></td>
                                <td><a href="viewqna.do"><span><img src="/icon/icon-reply.png"></span>[re] 윤미연 님의 질문 답변입니다.</a></td>
                                <td>2019-04-22</td>
                                <td>해마루동물병원</td>
                            </tr>
                            <tr>
                                <td>96</td>
                                <td>외과</td>
                                <td><a href="viewqna.do">강아지 디스크 문의 드립니다.</a></td>
                                <td>2019-03-02</td>
                                <td>맹다영</td>
                            </tr>
                            <tr>
                                <td>95</td>
                                <td></td>
                                <td><a href="viewqna.do"><span><img src="/icon/icon-reply.png"></span>[re] 맹다영 님의 질문 답변입니다.</a></td>
                                <td>2019-02-25</td>
                                <td>해마루동물병원</td>
                            </tr>
                        </table>
                        <ul class="reply-btn clear">
                            <li><a href="/qna/qna.do">문의하기</a></li>
                            <li><a href="sub5-5.html">내 질문 보기</a></li>
                        </ul>
                        <div class="reply-number-all clear">
                            <p class="reply-number-arrow"><a href="#"></a></p>
                            <ul class="reply-number clear">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                            </ul>
                            <p class="reply-number-arrow2"><a href="#"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>