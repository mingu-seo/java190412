<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="pkg.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%
PkgVO pparam = (PkgVO) request.getAttribute("param");
PkgVO pdata = (PkgVO) request.getAttribute("data");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/slick.css">
        <link rel="stylesheet" href="/css/slick-theme.css">
        <link rel="stylesheet" href="/css/aos.css">
        <link rel="stylesheet" href="/css/default.css">
        <link rel="stylesheet" href="/css/header.css">
        <link rel="stylesheet" href="/css/promotion.css">
        <link rel="stylesheet" href="/css/footer.css">
        <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="/js/gnb.js"></script>
        <script type="text/javascript" src="/js/slick.js"></script>
        <script type="text/javascript" src="/js/slick-slide.js"></script>
        <script type="text/javascript" src="/js/aos.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            
                //AOS 플러그인 시작구문
                AOS.init();            
            
                 //마우스 휠 플러그인 사용구문
 
                //delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

                $("#container > div").mousewheel(function(event,delta){    
                        event.preventDefault();    

                        //마우스 휠을 올렸을때	
                        if (delta > 0) {  
                            var prev = $(this).prev().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":prev});
                        }
                    
                        //마우스 휠을 내렸을때	
                        else if (delta < 0) {  
                           var next = $(this).next().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
                           $("html,body").stop().animate({"scrollTop":next});
                        }
                });
            });
        </script>
    <title>Birthday Package</title>
</head>
<body>
    <%@ include file="../../header_menu.jsp" %>
    
    <div id="container">
        <div class="banner petit">
            <div class="banner-center">
                <div class="banner-text">
                    <h2>생일 패키지
                        <span>Birthday Package</span>
                    </h2>
                    <h3>야외 테라스에 마련된 자쿠지, 선베드, <br/>그리고 시원한 남산의 바람까지.
                    </h3>
                    <p>
                        문 바의 야외 테라스에서 스페인 이비자가 부럽지 않은 뜨거운 여름 밤의 프라이빗 파티를 계획해보세요.
                    </p>
                </div>
            </div>
        </div>
        <div class="contents-center">
            <div class="logo-post"><img src="/img/promotion/promotion-logo.jpg"></div>
            <div class="contents-info clear">
                <div class="contents-left">
                    <table>
                        <tr>
                            <td class="table-list td-lh">기간</td>
                            <td>  <br/>
                                <br/>
                                * 이벤트   <br/>
                                <br/>
                                위스키 세트 이용 고객 중 위스키 바틀 추가 구매 시  <br/> Sisley 'Eau Tropicale' 향수와 바디로션 세트 증정 (1팀 1세트 한정)   <br/>
                                기간: 7. 1 (월) ~ 8. 31 (토) * 재고 소진 시 이벤트는 조기 종료될 수 있습니다.</td>
                        </tr>
                        <tr>
                            <td class="table-list time">시간</td>
                            <td>18:00 ~ 02:00 (Last Oder 01:30)</td>
                        </tr>
                        <tr>
                            <td class="table-list info">메뉴</td>
                            <td class="td-lh">샴페인 세트 370,000원 <br/>
                                · 쉐어링 플래터 (쇠고기 채끝 등심과 대하 구이, 프로슈토와 가리비 브루스케타, 머시룸 벨루테, 마르게리타 피자 등) <br/>
                                · 파이퍼 하이직 뀌베 브뤼 1병, 보타니스트 진 토닉 4잔, 소프트드링크 4잔 <br/>
                                · 르 베네피크 허브티 1개 증정 (선착순 30팀) <br/>
                                <br/>
                                
                                위스키 세트 510,000원 <br/>
                                · 쉐어링 플래터 (쇠고기 채끝 등심과 대하 구이, 프로슈토와 가리비 브루스케타, 머시룸 벨루테, 마르게리타 피자 등) <br/>
                                · 글렌피딕 12년 1병, 글렌피딕 하이볼 4잔, 소프트드링크 4잔 <br/>
                                · 글렌피딕 우산 1개 증정 (선착순 30팀)
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list place">장소</td>
                            <td>문 바 20층 야외 테라스</td>
                        </tr>
                    </table>
                </div>
                <div class="contents-right">
                    <h3>예약 및 이용문의</h3>
                    <h4>전화</h4>
                    <h4>02 2250 8000</h4>
                    <a href="/book/pkg_book_channel">온라인 예약</a>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <!-- <div class="footer-logo"><img src="img/footer_logo.png"></div> -->
        
        <div class="footer-center">
            <div class="footer-top">
                <ul class="company-info clear">
                    <li><a href="#">호텔소개</a></li>
                    <li><a href="#">오시는 길</a></li>
                    <li><a href="#">문의</a></li>
                    <li><a href="#">인재채용</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                </ul>
                <ul class="sns clear">
                    <li><a href="#"><img src="/img/sns1.png"></a></li>
                    <li><a href="#"><img src="/img/sns2.png"></a></li>
                    <li><a href="#"><img src="/img/sns3.png"></a></li>
                    <li><a href="#"><img src="/img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="/img/footericon1.png"></li>
                    <li><img src="/img/footericon2.png"></li>
                    <li><img src="/img/footericon3.png"></li>
                    <li><img src="/img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>