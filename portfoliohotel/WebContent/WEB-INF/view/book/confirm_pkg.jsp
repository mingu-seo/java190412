<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="pkg.*" %>
<%@ page import="pkg.res.*" %>
<%@ page import="util.*" %>
<%
PkgVO pkg_data = (PkgVO) request.getAttribute("pkg_data");
%>
<%
Pkg_resVO res_param = (Pkg_resVO) request.getAttribute("res_param");
Pkg_resVO res_data = (Pkg_resVO) request.getAttribute("res_data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/confirm.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>객실 예약 완료</title>
</head>
<script>
<% res_data.setTotal_price(res_data.getPkg_count() *res_data.getPkg_price()); %>
</script>

<body>
  	
   <jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>예약 완료</h2>
                    <h3>Completion the Reservation</h3>
                </div>
        </div>

            <div class="section-edit">
                <h1>* 패키지 예약 확정 *</h1>
                <div class="completion-form">
                    <!-- 이름 - p span 태그 이용 -->
                    <h3><span>백앤드</span>님의 예약이 확정되었습니다.</h3>

                    <ul class="guest clear">
                            <li>투숙객 이름</li>
                            <li class="second"><%=res_data.getGuest_kname() %></li>
                    </ul>
                    <ul class="reservation_number clear">
                            <li>예약변호</li>
                            <li class="second">000000000000</li>
                    </ul>
                    <!-- <ul class="room_number clear">
                        <li>객실수 및 숙박일수</li>
                        <li class="second">객실 0개 0박</li>
                    </ul> -->
                    <ul class="room_name clear">
                            <li>패키지 이름</li>
                            <li class="second"><%=res_data.getPkg_name() %></li>
                    </ul>
                    <ul class="check_in clear">
                            <li>패키지 수령 날짜</li>
                            <li class="second"><%=res_data.getUse_date() %></li>
                    </ul>
                    <!-- <ul class="check_out clear">
                            <li>체크아웃 날짜</li>
                            <li class="second">0000년 0월 0일 요일</li>
                    </ul> -->
                    <ul class="check_out clear">
                            <li>패키지 수량</li>
                            <li class="second"><%=res_data.getPkg_count() %></li>
                    </ul>

                    <div class="option">
                        <h3>* 추가옵션</h3>
                        <ul class="option-form clear">
                                <li>패키지 수량</li>
                                <li class="second">[0]</li>
                        </ul>
                        <ul class="option-form clear">
                            <li>침대추가</li>
                            <li class="second">[0]</li>
                        </ul>
                        <ul class="option-form clear">
                                <li>Welcome Wine & Chocolate</li>
                                <li  class="second">[0]</li>
                        </ul>
                    </div>

                    <ul class="payment clear">
                        <h3>* 총 결재금액</h3>
                        <li>KRW <%=res_data.getTotal_price() %>원</li>
                        <li class="second">세금 및 봉사료 KRW 000,000원 포함</li>
                    </ul>
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