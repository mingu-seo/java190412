<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
   MemberVO mdata = (MemberVO)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>나의 정보</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub6-1.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
    <script type="text/javascript" src='/js/sub6-1.js'></script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- 정보수정 (사람) 부분 -->
            <!-- <div id="myinfo-area">
                <div class="myinfo-box">
                    <div class="myinfo-head">
                        <p>나의 정보 수정</p>
                        <img src="/icon/footer-icon.png">
                    </div>
                    <div class="myinfo-page">
                        <div class="myinfo-back-arrow">
                            <a href="#"><img src="/icon/backarrow.png">
                            <P>뒤로가기</P></a>
                        </div>
                        <h1 class="myinfo-logo">
                            <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                        </h1>
                        <form class="myinfo-form" method="GET" name="user" action="text.php">
                            <div class="email_box">
                                <span><label for="user_id" class="label">이메일</label></span>
                                <input type="text" maxlength="20" id="user_id" name="user_id" class="half-size">
                                <select class="emial-select">
                                    <option>@ naver.com</option>
                                    <option>@ daum.net</option>
                                    <option>@ gmail.com</option>
                                </select>
                            </div>
                            <div class="pass_box">
                                <span><label for="user_password"  class="label">비밀번호</label></span>
                                <input type="password" maxlength="12" id="user_password" name="user_password" placeholder="비밀번호를 입력하세요." class="cover-size">
                            </div>
                            <div class="pass_box_check">
                                <span><label for="user_password_chk"  class="label">비밀번호확인</label></span>
                                <input type="password" maxlength="12" id="user_password_chk" name="user_password_chk" placeholder="비밀번호를 다시 입력하세요." class="cover-size">
                            </div>
                            <div class="name_box">
                                <span><label for="user_name"  class="label">이름</label></span>
                                <input type="text" maxlength="5" id="user_name" name="user_name" placeholder="이름을 입력하세요." class="cover-size">
                            </div>
                            <div class="birth_box">
                                <span><label for="user_birth"  class="label">생년월일</label></span>
                                <input type="text" maxlength="8" id="user_birth" name="user_birth" placeholder="ex ) 19890107" class="cover-size">
                            </div>
                            <div class="phone_box">
                                <span><label for="user_phone"  class="label">전화번호</label></span>
                                <select class="phone-select"  name="user_phone">
                                    <option>010</option>
                                    <option>011</option>
                                    <option>018</option>
                                </select>
                                <input type="text" maxlength="4" id="user_phone" name="user_phone"  class="half-size">
                                <input type="text" maxlength="4"  name="user_phone"  class="half-size half">
                            </div>
                            <div class="myinfo-btn clear">
                                <input type="reset" value="취소" id="btn_reset1" name="user_reset">
                                <input type="submit" value="수정" id="btn_submit" name="user_submit">
                            </div>
                        </form>
                        <ul class="myinfo-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div> -->
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>마이페이지</h2>
                    <p>my page</p>
                </div>
                <ul class="sub-bar">
                    <li class="on"><a href="/my/my-infor.do">나의 정보</a></li>
                    <li><a href="/my/my-pet.do">나의반려동물</a></li>
                        <li><a href="/my/my-res.do">예약확인</a></li>
                        <li><a href="/my/my-ask.do">문의내역</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>나의 정보</h3>
                <p>My information</p>
                <div class="sub6-my clear">
                    <div class="my-img">
                    </div>
                    <div>
                        <h5><%=mdata.getName()%></h5>
                    </div>
                   <a class="myinfo-btn" href="#">EDIT</a>
                </div>
                <div class="sub6-contact clear">
                    <h3>Contact info</h3>
                    <div>
                        <h5>Email</h5>
                        <p><%=mdata.getEmail()%></p>
                    </div>
                    <div>
                        <h5>Phone</h5>
                        <p><%=mdata.getTel()%></p>
                    </div>
                    <div>
                        <h5>Birth</h5>
                        <p><%=mdata.getBirth()%></p>
                    </div>
                    <div>
                        <h5>RegistDate</h5>
                        <p><%=mdata.getRegistdate()%></p>
                    </div>
                </div>
                <div class="sub6-botbox">
                    <p><span><%=mdata.getName()%></span> 님의 다음 진료 / 접종 예정일은 2019 년 06 월 20 일 입니다.</p>
                </div>
            </div>
        </div>
    </div>
       <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>