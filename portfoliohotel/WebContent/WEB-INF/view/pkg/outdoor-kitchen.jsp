<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/slick.css">
        <link rel="stylesheet" href="../css/slick-theme.css">
        <link rel="stylesheet" href="../css/aos.css">
        <link rel="stylesheet" href="../css/default.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/outdoor-kitchen.css">
        <link rel="stylesheet" href="../css/footer.css">
        <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="../js/gnb.js"></script>
        <script type="text/javascript" src="../js/slick.js"></script>
        <script type="text/javascript" src="../js/slick-slide.js"></script>
        <script type="text/javascript" src="../js/aos.js"></script>
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
    <title>The Oasis Outdoor Kitchen</title>
</head>
<body>
    <%@ include file="../header_menu.jsp" %>
    
    <div id="container">
        <div class="banner outdoor-kitchen">
            <div class="banner-center">
                <div class="banner-text">
                    <h2>오아시스 아웃도어 키친
                        <span>The Oasis Outdoor Kitchen</span>
                    </h2>
                    <h3>오아시스 아웃도어 키친은 석양이 물드는 아름다운 모습을 바라보며 즐기는 풀사이드 바비큐 뷔페를 제공합니다.
                    </h3>
                    <p>
                        여름에는 상쾌한 에메랄드 톤의 야외 수영장에서 완벽한 도심 속 휴식을 경험할 수 있으며, 겨울에는 아이스링크와 눈썰매장을 배경으로 스낵 메뉴도 즐기고 따뜻한 추억을 만들어가실 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="contents-center">
            <div class="logo-post"><img src="../img/promotion/promotion-logo.jpg"></div>
            <div class="contents-info clear">
                <div class="contents-left">
                    <table>
                        <tr>
                            <td class="table-list">위치</td>
                            <td>오아시스</td>
                        </tr>
                        <tr>
                            <td class="table-list time">좌석수</td>
                            <td>100 ~ 120석</td>
                        </tr>
                        <tr>
                            <td class="table-list info">운영기간</td>
                            <td class="td-lh">하절기 5월 ~ 9월 / 동절기 12월 ~ 2월
                            </td>
                        </tr>
                        <tr>
                            <td class="table-list place">운영시간</td>
                            <td>점심 11:00 ~ 17:00</br>
                                저녁 18:00 ~ 21:00</br>
                            </br>
                                *기간별 상이</td>
                        </tr>
                    </table>
                </div>
                <div class="contents-right">
                    <h3>예약 및 이용문의</h3>
                    <h4>전화</h4>
                    <h4>02 2250 8000</h4>
                    <a href="#">온라인 예약</a>
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
                    <li><a href="#"><img src="../img/sns1.png"></a></li>
                    <li><a href="#"><img src="../img/sns2.png"></a></li>
                    <li><a href="#"><img src="../img/sns3.png"></a></li>
                    <li><a href="#"><img src="../img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="../img/footericon1.png"></li>
                    <li><img src="../img/footericon2.png"></li>
                    <li><img src="../img/footericon3.png"></li>
                    <li><img src="../img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>