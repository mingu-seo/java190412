<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="pkg.*" %>
<%@ page import="java.util.*" %>
<%
PkgVO pkg_param = (PkgVO) request.getAttribute("pkg_param");
PkgVO pkg_data = (PkgVO) request.getAttribute("pkg_data");
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
    <title>테스트</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        <div class="banner senseof">
            <div class="banner-center">
                <div class="banner-text">
                    <h2>생일 패키지
                        <span>Birthday Package</span>
                    </h2>
                    <h3>portfollio 호텔의 생일 패키지를 소개합니다.
                    </h3>
                    <p>
반얀트리 스파의 섬세한 테라피와 서울의 야경이 펼쳐진<br/> 문 바에서 ‘THE 달달한 밤'을 즐기며 로맨틱한 하루를 보내세요.
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
                            <td class="table-list">기간</td>
                            <td>2019. 1. 2 (수) ~ 2019. 7. 19 (금)</td>
                        </tr>
                        <tr>
                            <td class="table-list">시간</td>
                            <td>오후7시~오후9시</td>
                        </tr>
                        
                        <tr>
                            <td class="table-list price">가격</td>
                            <td><%=pkg_data.getPrice() %>원</td>
                        </tr>
                        <tr>
                            <td class="table-list">포함내역</td>
                            <td class="td-lh"><%=pkg_data.getPkg() %> <br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list event">이벤트</td>
                            <td class="td-lh">객실 예약과를 통해 예약하시는 분들께 선착순으로<br/> 설화수의 오색향연 여온 오일 세트 (7ml x 5종)를 증정합니다.<br/>
                                <br/> 
                                (투숙 당 1회 증정 / 예약 상황에 따라 조기 마감될 수 있음)
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list info">안내</td>
                            <td class="td-lh">· 가격은 2인 1실 1박을 기준이며, 세금 별도입니다. <br/>
                                · 객실 상황에 따라 가격이 변동됩니다.  <br/>
                                · 투숙 인원 추가 시 별도의 요금이 부과 됩니다.  <br/>
                                · 패키지에 포함된 혜택은 투숙 기간 중에 한해 1회 제공됩니다.  <br/>
                                · 피트니스, 사우나, 반얀트리 스파의 정기 휴관일은 매월 첫째 주 화요일 입니다.
                            </td>
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