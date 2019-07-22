<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="manage.adopt.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
AdoptVO param = (AdoptVO)request.getAttribute("vo");
ArrayList<AdoptVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>프로필</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub4-1.css">
    <link rel="stylesheet" href="/css/footer.css">
    <!-- 스크롤을 내릴 시 프로필 나타내는 효과 플러그인 CSS  -->
    <link rel="stylesheet" href="/css/aos.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <!-- 스크롤을 내릴 시 프로필 나타내는 효과 플러그인  -->
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <script type="text/javascript" src="/js/sub4-1.js"></script>
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
                    <h2>입양</h2>
                    <p>adopt an animal</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="/adopt/animalprofile/animalprofile.do">프로필</a></li>
                    <li><a href="/adopt/review/review.do">입양후기</a></li>
                    <!-- <li><a href="#">오시는길</a></li> -->
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                
                <div class="top-arrow">
                    <a href="#">
                        <img src="icon/top-arrow.png">
                        <p>위로가기</p>
                    </a>
                </div>
                <h3>프로필</h3>
                <p>Propile</p>
                <!-- 강아지 고양이 특수동믈 버튼 리스트 -->
                <ul class="tab-list clear">
                    <li class="on"><a href="#">강아지</a></li>
                    <li><a href="#">고양이</a></li>
                    <li><a href="#">특수동물</a></li>
                </ul>
                <!-- 프로필 부분 -->
                <div class="tab-group">
                    <!-- 프로필 강아지 부분 -->
                    <div class="tab-box">
                        <!-- 프로필 한 부분 -->
                        <%
                        for(int i=0; i<list.size(); i++){
                        %>
                        <div class="box1 clear" data-aos="fade-up" data-aos-duration="1500">
                            <!-- 프로필 동물 이미지부분 -->
                            <div class="<%=list.get(i).getAnimal_image() %>"></div>
                            <!-- 프로필 동물 정보 부분 -->                       
                            <div class="box">
                                <p><span class="info-text">이름</span><%=list.get(i).getName() %></p>
                                <p><span class="info-text">품종</span><%=list.get(i).getBreed() %></p>
                                <p><span class="info-text">성별</span><%=list.get(i).getGender() %></p>
                                <p><span class="info-text">나이</span><%=list.get(i).getAge() %></p>
                                <p><span class="info-text">접종</span><%=list.get(i).getVac() %></p>
                                <p><span class="info-text">성격</span><%=list.get(i).getAnimal_image() %></p>
                                <!-- 상담신청 버튼 부분 -->
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <!-- 아이콘 부분 -->
                                <img src="/icon/sub_dog.png">
                            </div>
                        </div>
                        <%
                        }
                        %>
                        <div class="box1 clear" data-aos="fade-up" data-aos-duration="1500">
                            <!-- 프로필 동물 이미지부분 -->
                            <div class="box-img1"></div>
                            <!-- 프로필 동물 정보 부분 -->
                          
                            
                            <div class="box">
                                <p><span class="info-text">이름</span>크림이</p>
                                <p><span class="info-text">품종</span>웰시코기</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>2살</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>밝고 활발하며 사람을 좋아해요</p>
                                <!-- 상담신청 버튼 부분 -->
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <!-- 아이콘 부분 -->
                                <img src="/icon/sub_dog.png">
                            </div>
                        </div>
                        <div class="box2 clear" data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>달이</p>
                                <p><span class="info-text">품종</span>웰시코기</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>3개월</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>호기심이 많아요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_dog.png">
                            </div>
                            <div class="box-img2"></div>
                        </div>
                        <div class="box3 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box-img3"></div>
                            <div class="box">
                                <p><span class="info-text">이름</span>고스트</p>
                                <p><span class="info-text">품종</span>스타크 가문 수호 늑대</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>2년</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>변종 사냥꾼. 혼자 돌아다니며, 눈을 좋아함</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_dog.png">
                            </div>
                        </div>
                        <div class="box4 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>코코</p>
                                <p><span class="info-text">품종</span>진돗개</p>
                                <p><span class="info-text">성별</span>여</p>
                                <p><span class="info-text">나이</span>2개월</p>
                                <p><span class="info-text">접종</span>1차접종</p>
                                <p><span class="info-text">성격</span>잠이 많아요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_dog.png">
                            </div>
                            <div class="box-img4"></div>
                        </div>
                    </div>
                    <!-- 프로필 고양이 부분 -->
                    <div class="tab-box">
                        <div class="box5 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box-img5"></div>
                            <div class="box">
                                <p><span class="info-text">이름</span>냥냥이</p>
                                <p><span class="info-text">품종</span>웰시코기</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>2살</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>밝고 활발하며 사람을 좋아해요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_cat.jpg">
                            </div>
                        </div>
                        <div class="box6 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>가르송</p>
                                <p><span class="info-text">품종</span>러시안블루</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>3개월</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>호기심이 많아요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_cat.jpg">
                            </div>
                            <div class="box-img6"></div>
                        </div>
                        <div class="box7 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box-img7"></div>
                            <div class="box">
                                <p><span class="info-text">이름</span>쉐도우블랙</p>
                                <p><span class="info-text">품종</span>다크 캣</p>
                                <p><span class="info-text">성별</span>여</p>
                                <p><span class="info-text">나이</span>4개월</p>
                                <p><span class="info-text">접종</span>2차접종 실패</p>
                                <p><span class="info-text">성격</span>있는 듯 없는 듯 지내요, 어떨때는 안보여요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_cat.jpg">
                            </div>
                        </div>
                        <div class="box8 clear" data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>점박이</p>
                                <p><span class="info-text">품종</span>시베리아 레오파드</p>
                                <p><span class="info-text">성별</span>여</p>
                                <p><span class="info-text">나이</span>2년</p>
                                <p><span class="info-text">접종</span>종합건강검진 실패</p>
                                <p><span class="info-text">성격</span>밥을 안주면 물어요 조심해요^^  특기: 사지절단</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_cat.jpg">
                            </div>
                            <div class="box-img8"></div>    
                        </div>
                    </div>
                    <!-- 프로필 특수동물 부분 -->
                    <div class="tab-box">
                        <div class="box9 clear" data-aos="fade-up" data-aos-duration="1500">
                            <div class="box-img9"></div>
                            <div class="box">
                                <p><span class="info-text">이름</span>몰랑이</p>
                                <p><span class="info-text">품종</span>토끼</p>
                                <p><span class="info-text">성별</span>여</p>
                                <p><span class="info-text">나이</span>5개월</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>사람을 좋아하며 아주 활발해요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_bird.jpg">
                            </div>
                        </div>
                        <div class="box10 clear" data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>이아고</p>
                                <p><span class="info-text">품종</span>앵무새</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>2년</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>인사를 잘해요 *욕도 배움</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_bird.jpg">
                            </div>
                            <div class="box-img10"></div>
                        </div>
                        <div class="box11 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box-img11"></div>
                            <div class="box">
                                <p><span class="info-text">이름</span>마징가S</p>
                                <p><span class="info-text">품종</span>고슴도치</p>
                                <p><span class="info-text">성별</span>남</p>
                                <p><span class="info-text">나이</span>2개월</p>
                                <p><span class="info-text">접종</span>2차접종</p>
                                <p><span class="info-text">성격</span>가시 발사 가능, 항상 조심 할 것</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_bird.jpg">
                            </div>
                        </div>
                        <div class="box12 clear"  data-aos="fade-up" data-aos-duration="1500">
                            <div class="box">
                                <p><span class="info-text">이름</span>아부</p>
                                <p><span class="info-text">품종</span>토끼</p>
                                <p><span class="info-text">성별</span>여</p>
                                <p><span class="info-text">나이</span>2개월</p>
                                <p><span class="info-text">접종</span>1차접종</p>
                                <p><span class="info-text">성격</span>잠이 많아요</p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_bird.jpg">
                            </div>
                            <div class="box-img12"></div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- 더보기 버튼 -->
            <div class="tab-more"><a href="#">more</a></div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>