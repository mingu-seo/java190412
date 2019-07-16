<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=utf-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slick-theme.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
        /*메인페이지 상단 비디오 배경 구역*/
        #con1 {padding-bottom: 56.25%; position: relative;}
        #con1-video { width:100%; height:100%; position:absolute; bottom:100px;}
        #con1-box{width: 100%; height: 970px; background-color:rgba(0, 0, 0, 0.3); position: absolute; top: 0; left: 0;}
    </style>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/slick.js"></script>
    <script type="text/javascript" src="js/aos.js"></script>
    <script type="text/javascript" src="js/gnb.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".con4-box").click(function(event){
                event.preventDefault();
            });
            
            AOS.init();

            $('.slider').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
            });


            $(".con4-box-all").click(function(){
                // 콜렉션 목록클릭 시 레이어 팝업 등장
                $(".collection-popup").fadeIn();

                //콜렉션 목록클릭 시 목록 이미지 경로 받아오기
                var collImg = $(this).find(".con4-box-img").children("img").attr("src");

                //콜렉션 레이어 팝업창 이미지 변경
               $(".coll-left").children("img").attr("src",collImg);

               var collTitle = $(this).find(".con4-box-text-title").text();
               var collSubtitle = $(this).find(".con4-box-text-sub-title").text();
               var collCont = $(this).find(".con4-box-text-cont").text();

                $(".coll-right").children("h6").text(collTitle);
                $(".coll-right").children("h5").text(collSubtitle);
                $(".coll-right").children("p").text(collCont);
            });

            $(".coll-close").click(function(){
                //닫기 버튼 클릭시 레이어 팝업 사라짐
                $(".collection-popup").fadeOut();
            });
        });
    </script>
</head>
<body>
    <!-- 헤더 구역 -->
    <div id="header">
        <div class="h-top clear">
            <ul class="login">
                <li><a href="login.html">LOGIN</a></li>
                <li><a href="membership.html">JOIN</a></li>
                <li><a href="mypage.html">MY PAGE</a></li>
            </ul>
        </div>
        <div class="h-bot">
            <div class="h-bot-line"></div>
            <div class="h-bot-in clear">
                <div class="logo"><a href="main.html">자바미술관</a></div>
                <ul class="h-menu">
                    <li>
                        <a href="#">VISIT</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="sub-visit1.html">관람안내</a></li>
                                <li><a href="sub-visit2.html">미술관 소개</a></li>
                                <li><a href="sub-visit3.html">오시는길</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">EXHIBITION</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="sub-exhibition1.html">현재 전시</a></li>
                                <li><a href="sub-exhibition2.html">지난 전시</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">RENTAL</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="hall.html">대관안내</a></li>
                                <li><a href="hall.html2">대관신청</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">NEWS</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="news1.html">공지사항</a></li>
                                <li><a href="news2.html">이벤트</a></li>
                                <li><a href="news3.html">FAQ</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 헤더 구역 -->