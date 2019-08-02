<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="pkg.*"%>
<%@ page import="pkg.res.*"%>
<%@ page import="java.util.*"%>
<%
PkgVO pkg_param = (PkgVO) request.getAttribute("pkg_param");
PkgVO prdata = (PkgVO) request.getAttribute("prdata");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/header-fixed.css">
    <link rel="stylesheet" href="/css/dining_book_channel.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript" src="/js/datepicker.js"></script>
    <title>정보입력</title>
</head>
<script>
function goSave() {
	if ($("#guest_kname").val() == "") {
		alert('한글명을 입력하세요.')
		$("#guest_kname").focus();
		return false;
	} 
	}
	$("#frm").submit();

</script>
<body>
    <jsp:include page="/header_menu" flush="true"/>

    <div id="container">
        <!-- 베너 영역 -->
        <div class="banner">
                <h1 class="head-title">패키지 예약 신청<br/>
                    <p>RESERVATION FOR PACKAGE</p></h1>
        </div>

        <!-- 내용입력 구역 -->
        <div class="option_channel clear">
            
            <!-- 폼태그 / summit 입력버튼 311번 -->
            <form name="frm" id="frm" action="/book/confirm_pkg/process" method="POST" onsubmit="goSave()">
                <div class="section-wrap clear">

                    <!-- 왼쪽 정보 입력 박스 구역 -->
                    <div class="left-section">
                        
                        <div class="add01">
                            <div class="sec01-title">
                                <p>예약고객 정보 입력</p>
                            </div>

                            <div class="name_ko">
                                    <label for="name_ko">성명 (한글)＊</label>
                                    <input type="text" id="guest_kname" placeholder="성">
                                    <input type="text" id="guest_kname" placeholder="이름">
                            </div>

                            <!-- <div class="name_en clear">
                                    <div class="name_en_title">
                                        <label for="name_en">성명 (영문)＊</label>
                                    </div>
                                    <div class="name_en_area">
                                        <select>
                                            <option>선택안함</option>
                                            <option>Ms.</option>
                                            <option>Mr.</option>
                                        </select>
                                        <input type="text" id="guest_ename" placeholder="Family Name">
                                        <input type="text" id="guest_ename" placeholder="First Name">
                                        <p>* 여권에 기재된 영문 성명과 동일하게 기입해 주십시오.</p>
                                    </div>
                            </div> -->

                            <div class="phoneNumber">
                                    <label for="phoneNumber">연락처＊</label>
                                    <select>
                                        <option>선택</option>
                                        <option>010</option>
                                        <option>011</option>
                                        <option>017</option>
                                    </select>
                                    <input type="text" id="guest_tel" placeholder="숫자만 입력가능">
                            </div>

                            <div class="email">
                                    <ul class="email_adress clear">    
                                        <li class="email-title">
                                            <label for="email">이메일＊</label>
                                        </li>
                                    
                                        <li>
                                            <input type="text" id=guest_email value title="이메일 아이디 입력" maxlength="40">
                                        </li>

                                        <li class="at">@</li>

                                        <li>
                                            <input type="text" id="emailAdress" value title="이메일 주소 입력" maxlength="40">
                                        </li>
                                        <li class="adress">
                                                <select>
                                                        <option>직접입력</option>
                                                        <option>naver.com</option>
                                                        <option>hanmail.net</option>
                                                        <option>google.com</option>
                                                </select>
                                        </li>
                                    </ul>
                            </div>
                        </div>

                        <div class="add01 card">
                            <div class="sec01-title">
                                    <p>예약 날짜 및 시간</p>
                            </div>

                            <div class="cardType">
                                    <label for="name_ko">예약 상품<span>＊</span></label>
                                    <input type="text" value="<%=prdata.getKname() %>" readonly>
                            </div>
                            
                            <div class="cardType">
                                    <label for="name_ko">예약 날짜<span>＊</span></label>
                                    <input type="text" id="start-date" placeholder="클릭하시면 날짜를 선택할 수 있습니다.">
                                   
                            </div>

                            <div class="cardType">
                                <label for="name_ko">예약 시간<span>＊</span></label>
                                <select>
                                    <option>시간대를 선택해 주세요.</option>
                                    <option>12:00</option>
                                    <option>12:30</option>
                                    <option>13:00</option>
                                    <option>13:30</option>
                                    <option>14:00</option>
                                    <option>17:00</option>
                                    <option>17:30</option>
                                    <option>18:00</option>
                                    <option>18:30</option>
                                    <option>19:00</option>
                                    <option>19:30</option>
                                    <option>20:00</option>
                                </select>
                            </div>

                            <div class="person clear">
                                    <label for="name_ko">인원<span>＊</span></label>
                                    <ul class="adult clear">
                                       <li class="per">어른</li>
                                       <li>
                                           <select>
                                                <option>1명</option>
                                                <option>2명</option>
                                                <option>3명</option>
                                                <option>4명</option>
                                                <option>5명</option>
                                                <option>6명</option>
                                                <option>7명</option>
                                                <option>8명</option>
                                                <option>9명</option>
                                                <option>10명</option>
                                            </select>
                                        </li>
                                    </ul>
                                    <ul class="child clear">
                                            <li class="per">어린이</li>
                                            <li>
                                                <select>
                                                     <option>1명</option>
                                                     <option>2명</option>
                                                     <option>3명</option>
                                                     <option>4명</option>
                                                     <option>5명</option>
                                                     <option>6명</option>
                                                     <option>7명</option>
                                                     <option>8명</option>
                                                     <option>9명</option>
                                                     <option>10명</option>
                                                 </select>
                                             </li>
                                             <p>(36개월 ~ 12세 미만)</p>        
                                    </ul>
                                    
                            </div>

                            
                        </div>
                                                     
                    </div>

                    <!-- 오른쪽 구역 예약신청 버튼 -->
                    <div class="right-section">
                        <div class="confirmation-box">
                                
                                <div class="content-area03 area clear">
                                    
                                    <div class="next-but">
                                        <input id="countsubmit" type="submit" value="예약 신청">
                                    </div>

                                    <h4><span></span>예약 안내</h4>
                                    <p>· 10인 이상 예약을 원하시는 경우 전화로<br/>
                                        문의 부탁 드립니다.</p>
                                </div>

                                <div class="content-area04 area">
                                    <h4><span></span>예약문의 00-0000-0000</h4>
                                </div>
                                
                        </div>
                    </div>
                </div>
                <input type="hidden" name="cmd" value="write" />   
            </form> 
        </div>
    </div>

    <!-- 푸터영역시작 -->
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
                        <li><a href="#"><img src="img/sns1.png"></a></li>
                        <li><a href="#"><img src="img/sns2.png"></a></li>
                        <li><a href="#"><img src="img/sns3.png"></a></li>
                        <li><a href="#"><img src="img/sns4.png"></a></li>
                    </ul>
                </div>
                <div class="footer-bottom">
                    <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                        서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                    </h5>
                    <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                    <ul class="support-logo clear">
                        <li><img src="img/footericon1.png"></li>
                        <li><img src="img/footericon2.png"></li>
                        <li><img src="img/footericon3.png"></li>
                        <li><img src="img/footericon4.png"></li>
                    </ul>
                </div>
            </div>
    </div>