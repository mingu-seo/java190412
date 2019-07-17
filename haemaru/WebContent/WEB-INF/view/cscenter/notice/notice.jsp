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
    <link rel="stylesheet" href="/css/sub5-1.css">
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
                    <li class="on"><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>공지사항</h3>
                <p>Notice</p>
                <div class="notice-area">
                    <form class="search-btn" method="GET" action="text.php">
                        <select>
                            <option>전체</option>
                            <option>소식</option>
                            <option>칼럼</option>
                            <option>보도자료</option>
                            <option>카드뉴스</option>
                            <option>증례소개</option>
                        </select>
                        <input type="text" id="search_input" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_search">
                    </form>
                    <div class="notice-table">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Data</th>
                                <th>View</th>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>소식</td>
                                <td><a href="viewnotice.do">[소식] 해마루이차진료동물병원 김진경 원장 취임 인터뷰</a></td>
                                <td>2019-06-04</td>
                                <td>246</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>칼럼</td>
                                <td><a href="viewnotice.do">[칼럼] 반려동물 건강이야기 - 오줌을 못 눠 안절부절못하는 강아지, 원인은 이것!</a></td>
                                <td>2019-06-01</td>
                                <td>215</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>칼럼</td>
                                <td><a href="viewnotice.do">[칼럼] 반려동물 건강이야기 - 심장사상충이 강아지의 경계 대상 0순위인 이유</a></td>
                                <td>2019-05-28</td>
                                <td>156</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>소식</td>
                                <td><a href="viewnotice.do">[소식] 해마루동물병원 전문 영상의학팀 방사선 촬영</a></td>
                                <td>2019-05-13</td>
                                <td>103</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>보도자료</td>
                                <td><a href="viewnotice.do">[보도자료] 네이버 동그람이 - 가습기 살균제 참사 관련 김현욱원장님 인터뷰</a></td>
                                <td>2019-05-04</td>
                                <td>145</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>카드뉴스</td>
                                <td><a href="viewnotice.do">[카드뉴스] 마이크로바이옴이란?</a></td>
                                <td>2019-04-22</td>
                                <td>123</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>칼럼</td>
                                <td><a href="viewnotice.do">[칼럼] 반려동물 건강이야기 - 전염성 강한 ‘강아지 인플루엔자’ 주의보</a></td>
                                <td>2019-03-02</td>
                                <td>105</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>증례소개</td>
                                <td><a href="viewnotice.do">[증례소개] 고양이에서의 간 외성 동정맥 기형 발병 증례</a></td>
                                <td>2019-02-25</td>
                                <td>210</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>소식</td>
                                <td><a href="viewnotice.do">[소식] 해마루소동물임상의학 연구소 황선영 소장, 2018 아시아생물공학연합체 포럼 참여</a></td>
                                <td>2019-01-07</td>
                                <td>156</td>
                            </tr>
                        </table>
                        <div class="notice-number-all clear">
                            <p class="notice-number-arrow"><a href="#"></a></p>
                            <ul class="notice-number clear">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                            </ul>
                            <p class="notice-number-arrow2"><a href="#"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div id="footer">
        <div class="footer-direction-area">
        <div class="footer-direction-center clear">
            <div  style="float:left;">
                <h3>Direction</h3>
                <p>오시는 길</p>
            </div>
            <!-- 맵 연동은 맨 마지막 -->
            <!-- <div id="map" style="width:837px;height:428px; float:left; margin-left:50px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b39455382198dd3c3860a5e9a81fdcc3"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(37.38563310000001,127.12113090000003),
                    level: 3
                };
        
                var map = new kakao.maps.Map(container, options);
            </script> -->
        </div>
    </div>
    <div class="footer-basic">
        <div class="footer-center clear">
            <div class="fot-left">
                <h1 class="fot-logo"><a href="#"><img src="/icon/logo_lightgreen.png"></a></h1>
                <p>© 2016 HAEMARU Referral Animal Hospital All rights Reserved.</p>
            </div>
            <div class="fot-right clear">
                <div class="right-1">
                    <p>Address</p>
                    <p>경기도 성남시 분당구 황새울로 319번길 수의과학회관 1~4층</p>
                    <div class="fot-phone">
                        <p>Tel.</p>
                        <p> 031 ) 781 - 2992</p>
                    </div>
                    <div class="fot-fax">
                        <p>Fax.</p>
                        <p>031 ) 781 - 2993</p>
                    </div>
                </div>
                <div class="right-2">
                    <p>E-mail</p>
                    <p>help@haemaru.co.kr</p>
                    <ul class="fot-info clear">
                        <li><a href="#">개인정보취급방침</a></li>
                        <li><a href="#">이메일무단수집거부</a></li>
                    </ul>
                </div>
            </div>
            <img class="fot-icon" src="/icon/footer-icon.png">
        </div>
    </div>
    </div>
</body>
</html>