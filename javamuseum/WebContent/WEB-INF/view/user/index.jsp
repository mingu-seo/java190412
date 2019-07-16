<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/slick.css">
    <link rel="stylesheet" href="/css/slick-theme.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/footer.css">
    <style>
        /*메인페이지 상단 비디오 배경 구역*/
        #con1 {padding-bottom: 56.25%; position: relative;}
        #con1-video { width:100%; height:100%; position:absolute; bottom:100px;}
        #con1-box{width: 100%; height: 970px; background-color:rgba(0, 0, 0, 0.3); position: absolute; top: 0; left: 0;}
    </style>
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
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
                <div class="logo"><a href="/user/index.jsp">자바미술관</a></div>
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
    <div id="container">
        <!-- 상단 배너 구역 -->
        <div id="con1">
            <iframe id="con1-video" width="100%" height="980" src="https://www.youtube.com/embed/v89BBIXk2XU?controls=0&autoplay=1&loop=1&playlist=MqIJzyCMK0Y&mute=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <div id="con1-box"></div>
        </div>
        <!-- 상단 배너 구역 -->
        <!-- exhibition 구역 -->
        <div class="con2">
            <div class="con2-bg">
                <h2>Exhibitions</h2>
                <div class="con2-box">
                    <div class="slider">
                        <div class="slider-thum">
                            <a href="#">
                                <img src="/img/con2-1.jpg">
                                <div class="slider-list-text">
                                        <h2>피에르 르탕</h2>
                                        <p>[pierre Le-Tan]</p>
                                        <p>2019.04.20 - 2019.08.10</p>
                                </div>
                            </a>
                        </div>
                        <div class="slider-thum">
                            <a href="#">
                                <img src="/img/con2-2.jpg">
                                <div class="slider-list-text">
                                        <h2>언스킬드 워커</h2>
                                        <p>[Unskiled Worker]</p>
                                        <p>2019.03.11 - 2019.07.10</p>
                                </div>
                            </a>
                        </div>
                        <div class="slider-thum">
                            <a href="#">
                                <img src="/img/con2-3.jpg">
                                <div class="slider-list-text">
                                        <h2>케이티 스콧</h2>
                                        <p>[Katie Scott]</p>
                                        <p>2019.05.21 - 2019.08.20</p>
                                </div>
                            </a>
                        </div>
                        <div class="slider-thum">
                            <a href="#">
                                <img src="/img/con2-4.jpg">
                                <div class="slider-list-text">
                                        <h2>오아물 루</h2>
                                        <p>[Oamul Lu]</p>
                                        <p>2019.06.13 - 2019.09.17</p>
                                </div>
                            </a>
                        </div>
                        <div class="slider-thum">
                            <a href="#">
                                <img src="/img/con2-5.jpg">
                                <div class="slider-list-text">
                                        <h2>페이 투굿</h2>
                                        <p>[Faye Toogood]</p>
                                        <p>2019.07.13 - 2019.08.19</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- exhibition 구역 -->
        <!-- event & progarams 구역 -->
        <div class="con3">
            <div class="event" data-aos="fade-up" data-aos-duration="1000"><h2>Events & Programs</h2></div>
            <div class="con3-box">
                <div class="con3-box1 clear" data-aos="fade-right" data-aos-duration="1500">
                    <div class="con3-img">
                        <img src="/img/con3-1.jpg">
                    </div>
                    <div class="con3-text">
                        <h3>AUGUST 18</h3>
                        <h4>20 Blank Canvases.<br/> 
                            Melinda Rhodes</h4>
                        <p>-Kim Youngjun-</p>
                    </div>
                </div>
                <div class="con3-box2 clear" data-aos="fade-left" data-aos-duration="2000">
                    <div class="con3-img2">
                        <img src="/img/con3-2.jpg">
                    </div>
                    <div class="con3-text2">
                        <h3>AUGUST 24</h3>
                        <h4>Peasant Scenes And<br/>
                            Landscapes</h4>
                        <p>-Kristelle Rodeia-</p>
                    </div>
                </div>
                <div class="con3-box3 clear" data-aos="fade-right" data-aos-duration="2500">
                    <div class="con3-img3">
                        <img src="/img/con3-3.jpg">
                    </div>
                    <div class="con3-text3">
                        <h3>AUGUST 30</h3>
                        <h4>Portrait of Before -<br/>
                            Max Andrews</h4>
                        <p>-Kristelle Rodeia-</p>
                    </div>
                </div>
                <div class="con3-more" data-aos="fade-up" data-aos-duration="1000"><a href="sub-exhibition1.html">More Exhibition</a></div>
            </div>
        </div>
        <!-- event & progarams 구역 -->
        <!-- collection 구역 -->
        <div class="con4">
            <div class="con4-bg">
                <div class="collection" data-aos="zoom-in" data-aos-duration="2000"><h2>Collection</h2></div>
                <div class="con4-box clear">
                    <div class="con4-box-left" data-aos="zoom-in" data-aos-duration="1000">
                        <div class="con4-box-left1 clear con4-box-all">
                            <a href="#">
                            <div class="con4-box-left1-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">슈테판 마르크스<br/>[Stefan Marx]</h4>
                                    <p class="con4-box-text-sub-title">정형화 된 문자를 그림의 형태로<br/>
                                            재창조해 새로운 서사를 전달하는..</p>
                                    <p class="con4-box-text-cont">슈테판 마르크스의 대표작 픽토그라프 폰트(Pictograph Font) 는 
                                        사용자가 컴퓨터에글을 입력하면 입력된 문자가 그림으로 출력되어 
                                        화면에 나타나는 시스템을 기반으로 한다.
                                        매번 새로운 구성으로 나타나는 작가의 작품은 사용자에게 새로운
                                        이야기를 제공하는 것은 물론 이미지들 간의 관계와 서사를 유추하게 한다.1</p>        
                                </div>  
                            </div>
                            <div class="con4-box-left1-img con4-box-img"><img src="/img/con4-1.jpg"></div>
                            </a>    
                        </div>
                        <div class="con4-box-left2 con4-box-all">
                            <a href="#">
                            <div class="con4-box-left2-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">쥘리에트 비네<br/>[Juliette Binet]</h4>
                                    <p class="con4-box-text-sub-title">서정적이고 환상적인 이야기를<br/>
                                        정제된 텍스처로 풀어내는..</p>
                                    <p class="con4-box-text-cont">쥘리에트 비네는 주로 어린이와 성인 모두가 즐길 수 있는 짧은 이야기를 담은 그림책을 선보여왔다. 작가는 형태를 세밀한 결로 나눠 길고 짧은 선으로 채워나가거나 점묘, 그라데이션 기법을 사용해 표면의 텍스처를 정제해 보여주는 작품을 통해 서정적이고 환상적인 분위기가 특징인 작업을 선보인다.</p>         
                                </div>
                            </div>
                            <div class="con4-box-left2-img con4-box-img"><img src="/img/con4-2.jpg"></div>
                            </a>
                        </div>
                    </div>
                    <div class="con4-box-center " data-aos="zoom-in" data-aos-duration="2000">
                        <div class="con4-box-center1 con4-box-all">
                            <a href="#">
                            <div class="con4-box-center1-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">신모래<br/>[Shin Morae]</h4>
                                    <p class="con4-box-text-sub-title">매일의 기억 속 소소한 이야기를<br/>
                                        몽환적인 색채로 들려주는..</p>
                                    <p class="con4-box-text-cont">신모래는 분홍, 파랑, 보라와 같은 몽환적인 색채를 사용해 자신의 일상과 기억에 대한 소소한 이야기를 독특한 감성으로 표현한다. 화면 속에 담긴 창 밖을 통해 스며드는 햇빛이나 바다를 비추는 달빛, 네온 조명과 같은 여러 빛의 산란 효과는 그림에서 느껴지는 고독함과 공허함을 한층 더해 보는 사람의 공감을 자아낸다.</p>   
                                </div>
                            </div>
                            <div class="con4-box-center1-img con4-box-img"><img src="/img/con4-3.jpg"></div>
                            </a>
                        </div>
                        <div class="con4-box-center2 con4-box-all">
                            <a href="#">
                            <div class="con4-box-center2-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">오아물 루<br/>[Oamul Lu]</h4>
                                    <p class="con4-box-text-sub-title">자연과 인물에 대한 따뜻한 시선을<br/>
                                        다채로운 색으로 전달하는..</p>
                                    <p class="con4-box-text-cont">오아물 루는 자연적인 요소와 인물이 한 화면에 조화롭게 어우러진 따뜻한 그림을 그린다. 자연의 미묘하고 다양한 색과 형상, 시시각각 변하는 계절을 디지털과 아날로그 페인팅을 혼합해 선보이는 그의 작품은 관람자들에게 휴식과 같은 기분을 전하며 큰 호응을 얻고 있다.</p>     
                                </div>
                            </div>
                            <div class="con4-box-center2-img con4-box-img"><img src="/img/con4-4.jpg"></div>
                            </a>
                        </div>
                    </div>
                    <div class="con4-box-right" data-aos="zoom-in" data-aos-duration="3000">
                        <div class="con4-box-right1 con4-box-all">
                            <a href="#">
                            <div class="con4-box-right1-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">무나씨<br/>[Moonassi]</h4>
                                    <p class="con4-box-text-sub-title">순간의 영감을 다채로운 방식의<br/>
                                        흑백 그림으로 표현하는..</p>
                                    <p class="con4-box-text-cont">청소년기에 스케이트보드 문화에 강한 영향을 받은 무나씨는 개성을 드러내는 방식으로서의 패션에 관심을 두고, 감정을 말보다 이미지로 표현하기 위해 티셔츠에 즉흥적으로 흑백 그림을 그리기 시작했다. 이를 시작으로 작가는 사람과 동물, 풍경에 대한 유머러스한 드로잉, 캔버스 회화, 조각, 세라믹, 음반 커버 작업등의 다양한 예술 활동을 이어오고 있다.</p>
                                </div>
                            </div>
                            <div class="con4-box-right1-img con4-box-img"><img src="/img/con4-5.jpg"></div>
                            </a>
                        </div>
                        <div class="con4-box-right2 con4-box-all">
                            <a href="#">
                            <div class="con4-box-right2-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">피에르 르탕<br/>[Pierre Le-Tan]</h4>
                                    <p class="con4-box-text-sub-title">독특한 화법으로 사물과 공간을<br/>
                                        섬세하게 표현하는..</p>
                                    <p class="con4-box-text-cont">파리에서 활동하는 피에르 르탕은 사물과 공간에 대한 각별한 애정을 두고 자신 앞에 있는 오브제나 사진을 관찰하며 연필과 인디언 잉크, 오래된 과슈(gouache)를 이용한 십자 긋기(cross-stitch) 화법으로 대상의 형태와 음영을 섬세하게 표현한다.</p>  
                                </div>
                            </div>
                            <div class="con4-box-right2-img con4-box-img"><img src="/img/con4-6.jpg"></div>
                            </a>
                        </div>
                        <div class="con4-box-right3 con4-box-all">
                            <a href="#">
                            <div class="con4-box-right3-bg con4-box-bg">
                                <div class="con4-box-text">
                                    <h4 class="con4-box-text-title">페이 투굿<br/>[Faye Toogood]</h4>
                                    <p class="con4-box-text-sub-title">물질성에 대한 관심을 바탕으로 한<br/>
                                        본질적인 아름다움을 그려내는..</p>
                                    <p class="con4-box-text-cont">페이 투굿은 물질성에 대한 관심을 바탕으로 매체에 대한 실험을 통해 가구, 오브제, 패션, 벽지, 드로잉과 같은 다양한 분야에서 활동한다. 어린 시절 영국 러틀랜드(Rutland)에 위치한 작은 마을에서 자연과 가까이 자란 그는 천연 소재에서 영감을 찾고 재료의 본질적인 아름다움에 관심을 가지며 작품을 제작해왔으며, 2013년 유니섹스 의류 브랜드 투굿(Toogood)을 런칭해 패션 디자이너로서도 활동하고 있다.</p>
                                </div>
                            </div>
                            <div class="con4-box-right3-img con4-box-img"><img src="/img/con4-7.jpg"></div>
                            </a>
                        </div>
                    </div>
                    <div class="collection-popup">
                        <div class="coll-pop-cont">
                            <div class="coll-left">
                                <img src="/img/con4-1.jpg">
                            </div>
                            <div class="coll-right">
                                <h5>정형화 된 문자를 그림의 형태로 재창조해
                                    새로운 서사를 전달하는</h5>
                                <h6>슈테판 마르크스 / Stefan Marx</h6>
                                <p>조규형의 대표작 픽토그라프 폰트(Pictograph Font) 는 
                                    사용자가 컴퓨터에글을 입력하면 입력된 문자가 그림으로 출력되어 
                                    화면에 나타나는 시스템을 기반으로 한다.
                                    매번 새로운 구성으로 나타나는 작가의 작품은 사용자에게 새로운
                                    이야기를 제공하는 것은 물론 이미지들 간의 관계와 서사를 유추하게 한다.</p>
                            </div>
                            <p class="coll-close"><a href="#"><img src="/img/sub-exhibition-close.png"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- collection 구역 -->
    </div>
    <!-- top 클릭 아이콘 -->
    <div class="fixed-top"><a href="#">TOP</a></div>
    <!-- top 클릭 아이콘 -->
    <!-- 풋터 구역 -->
    <div id="footer">
        <div class="foot-in">
            <div class="foot-top clear">
                <div class="foot-logo"><img src="/img/logo.png"></div>
                <ul class="foot-menu">
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">영상정보처리기기 운영 관리방침</a></li>
                    <li><a href="#">SITE MAP</a></li>
                    <li><a href="#">CONTACT US</a></li>
                </ul>
            </div>
            <div class="foot-bot clear">
                <ul class="foot-bot-left">
                    <li><h5>자바미술관</h5></li>
                    <li>서울특별시 종로구 지하문로4길 21(통의동 35-1)</li>
                    <li>(재)대림문화재단    서업자등록번호 : 305-82-09028    COPYRIGHT 2015 BY JAVA MUSEUM ALL RIGHT RESERVED.</li>
                </ul>
                <ul class="foot-bot-right">
                    <li>전화예매 및 문의(무료전화)</li>
                    <li><h6>02-720-0665</h6></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 풋터 구역 -->
</body>
</html>
