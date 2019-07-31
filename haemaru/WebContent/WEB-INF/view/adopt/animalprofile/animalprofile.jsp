<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="manage.adopt.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
AdoptVO param = (AdoptVO)request.getAttribute("vo");
ArrayList<AdoptVO> list = (ArrayList)request.getAttribute("list");
ArrayList<AdoptVO> list2 = (ArrayList)request.getAttribute("list2");
ArrayList<AdoptVO> list3 = (ArrayList)request.getAttribute("list3");
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
                        <img src="/icon/top-arrow.png">
                        <p>위로가기</p>
                    </a>
                </div>
                <h3>프로필</h3>
                <p>Profile</p>
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
                        <div class="box<%=i%2!=0 ? "2":"1"%> clear" data-aos="fade-up" data-aos-duration="1500">
                            <!-- 프로필 동물 이미지부분 -->
                            <% if (i%2 == 0) { %>
                            <div class="box-img5"><img src="/upload/adopt/<%=list.get(i).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                            <!-- 프로필 동물 정보 부분 -->                       
                            <div class="box">
                                <p><span class="info-text">이름</span><%=list.get(i).getName()%></p>
                                <p><span class="info-text">품종</span><%=list.get(i).getBreed()%></p>
                                <p><span class="info-text">성별</span><%=list.get(i).getGender() !=1 ? "남아" : "여아"%></p>
                                <p><span class="info-text">나이</span><%=list.get(i).getAge()%></p>
                                <p><span class="info-text">접종</span><%=list.get(i).getVac()%></p>
                                <p><span class="info-text">성격</span><%=list.get(i).getCharr()%></p>
                                <!-- 상담신청 버튼 부분 -->
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <!-- 아이콘 부분 -->
                                <img src="/icon/sub_dog.png">
                            </div>
                            <% if (i%2 != 0) { %>
                            <div class="box-img2"><img src="/upload/adopt/<%=list.get(i).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                        </div>
                        <%
                        }
                        %>
                   	</div>
                    <!-- 프로필 고양이 부분 -->
                    <div class="tab-box">
                    	<%for(int n=0; n<list2.size(); n++){ 
                    	%>
                        <div class="box<%=n%2!=0 ? "2":"1"%> clear"  data-aos="fade-up" data-aos-duration="1500">
                        	<% if (n%2 == 0) { %>
                            <div class="box-img5"><img src="/upload/adopt/<%=list2.get(n).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                            <div class="box">
                                <p><span class="info-text">이름</span><%=list2.get(n).getName() %></p>
                                <p><span class="info-text">품종</span><%=list2.get(n).getBreed() %></p>
                                <p><span class="info-text">성별</span><%=list2.get(n).getGender()  !=1 ? "남아" : "여아"%></p>
                                <p><span class="info-text">나이</span><%=list2.get(n).getAge() %></p>
                                <p><span class="info-text">접종</span><%=list2.get(n).getVac() %></p>
                                <p><span class="info-text">성격</span><%=list2.get(n).getCharr() %></p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_cat.jpg">
                            </div>
                             <% if (n%2 != 0) { %>
                            <div class="box-img6"><img src="/upload/adopt/<%=list2.get(n).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                        </div>
                        
                        <%
                    	}
                       	 %>
                        
                    </div>
                    <!-- 프로필 특수동물 부분 -->
                    <div class="tab-box">
	                    <%for(int a=0; a<list3.size(); a++){ 
	                    %>
                        <div class="box<%=a%2!=0 ? "2":"1"%> clear" data-aos="fade-up" data-aos-duration="1500">
                        	<% if (a%2 == 0) { %>
                            <div class="box-img9"><img src="/upload/adopt/<%=list3.get(a).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                            <div class="box">
                                <p><span class="info-text">이름</span><%=list3.get(a).getName() %></p>
                                <p><span class="info-text">품종</span><%=list3.get(a).getBreed() %></p>
                                <p><span class="info-text">성별</span><%=list3.get(a).getGender() !=1 ? "남아" : "여아"%></p>
                                <p><span class="info-text">나이</span><%=list3.get(a).getAge() %></p>
                                <p><span class="info-text">접종</span><%=list3.get(a).getVac() %></p>
                                <p><span class="info-text">성격</span><%=list3.get(a).getCharr() %></p>
                                <div class="sub4-1-more"><a href="sub5-4.html">상담신청</a></div>
                                <img src="/icon/sub_bird.jpg">
                            </div>
                            <% if (a%2 != 0) { %>
                            <div class="box-img10"><img src="/upload/adopt/<%=list3.get(a).getAnimal_image()%>" width="320px" height="320px"/></div>
                            <% } %>
                        </div>
                        <%
	                    }
	                    %>                           
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