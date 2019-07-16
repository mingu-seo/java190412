<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub6-4.css">
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
                    <h2>마이페이지</h2>
                    <p>My page</p>
                </div>
                <ul class="sub-bar">
                    <li><a href="my-infor.jsp">나의정보</a></li>
                    <li><a href="my-pet.jsp">나의반려동물</a></li>
                    <li><a href="my-res.jsp">예약확인</a></li>
                    <li class="on"><a href="my-ask.jsp">문의내역</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의내역</h3>
                <p>Statement of inquiry</p>
                <div class="notice-area">
                    
                    </form>
                    <div class="notice-table">
                        <table>
                            <tr>
                                <th>No.</th>
                               
                                <th>Title</th>
                                <th>Data</th>
                                <th>Writer</th>
                            </tr>
                            <tr>
                                <td>5</td>
                              
                                <td><a href="sub5-5.html">고양이 중성화수술 문의 드립니다.</a></td>
                                <td>2019-06-04</td>
                                <td>이윤</td>
                            </tr>
                            <tr>
                                <td>4</td>
                               
                                <td><a href="sub5-5.html"><span><img src="/icon/icon-reply.png"></span>[re] 고양이 중성화수술 문의 드립니다.</a></td>
                                <td>2019-06-01</td>
                                <td>해마루동물병원</td>
                            </tr>
                            <tr>
                                <td>3</td>
                              
                                <td><a href="sub5-5.html">예방접종</a></td>
                                <td>2019-05-28</td>
                                <td>이윤</td>
                            </tr>
                            <tr>
                                <td>2</td>
                               
                                <td><a href="sub5-5.html"><span><img src="/icon/icon-reply.png"></span>[re] 예방접종 </a></td>
                                <td>2019-05-13</td>
                                <td>해마루동물병원</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                
                                <td><a href="sub5-5.html">이 사료 먹여도 좋은건가요?</a></td>
                                <td>2019-05-04</td>
                                <td>이윤</td>
                            </tr>
                        
                        </table>
                        <div class="notice-number-all clear">
                            <p class="notice-number-arrow"><a href="#"></a></p>
                            <ul class="notice-number clear">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                            </ul>
                            <p class="notice-number-arrow2"><a href="#"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>