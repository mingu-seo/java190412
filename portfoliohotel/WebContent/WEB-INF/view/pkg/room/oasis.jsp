<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <title>>The Oasis Summer Package</title>
</head>
<body>
    <%@ include file="../../header_menu.jsp" %>
    
    <div id="container">
        <div class="banner oasis">
            <div class="banner-center">
                <div class="banner-text">
                    <h2>오아시스 서머 패키지
                        <span>The Oasis Summer Package</span>
                    </h2>
                    <h3>남산의 상쾌한 전경이 펼쳐진 이국적인 분위기의 오아시스 야외 수영장에서 도심 속 완벽한 휴식을 즐겨보세요.
                    </h3>
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
                            <td>2019. 5. 1 (수) ~ 2019. 9. 1 (일)</td>
                        </tr>
                        <tr>
                            <td class="table-list">포함내역</td>
                            <td class="td-lh">· 객실 투숙 1박 <br/>
                                · 오아시스 야외 수영장 이용 (2인) <br/>
                                · 그라넘 다이닝 라운지 조식 (2인) <br/>
                                · 실내 수영장, 피트니스 센터 이용 (2인)
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list price">가격</td>
                            <td>420,000원 부터 (VAT별도)</td>
                        </tr>
                        <tr>
                            <td class="table-list info">안내</td>
                            <td class="td-lh">· 가격은 2인 1실 1박을 기준이며, 세금 별도입니다. <br/>
                                · 객실 상황에 따라 가격이 변동됩니다.  <br/>
                                · 투숙 인원 추가 시 별도의 요금이 부과됩니다.  <br/>
                                · 패키지에 포함된 혜택은 투숙 기간 중에 한해 1회 제공되며,  <br/> 오아시스 야외 수영장은 투숙 기간 중에만 입장 가능합니다.  <br/>
                                <br/>
                                * 오아시스 대관 행사 또는 이벤트로 인해 야외 수영장 이용에   <br/>제한이 있을 수 있습니다.  <br/>
                                  <br/>
                                · 피트니스, 사우나, 반얀트리 스파의 정기 휴관일은  <br/> 매월 첫째 주 화요일입니다.
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