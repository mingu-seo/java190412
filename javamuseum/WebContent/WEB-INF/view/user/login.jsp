<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관 로그인</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/footer.css">
    <style>
    
    </style>
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript">
        $(function(){
            
        })
    </script>
    <script>
function loginCheck(){
	if ( getObject("id").value.length < 1 ) {
		alert("아이디를 입력해주세요.");
		getObject("id").focus();
		return false;
	}
	if ( getObject("password").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("password").focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked==true) {
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires="+now.getTime();
	}
	return true;
}

function userid_chk() {
	var f=document.board;
	var useridname = CookieVal("cookie_userid");
	
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}
</script>
</head>
<body>
    <div id="header">
        <!-- 마이페이지 시작 -->
        <div class="h-top clear">
            <ul class="login">
                <li><a href="login.html">LOGIN</a></li>
                <li><a href="membership.html">JOIN</a></li>
                <li><a href="mypage.html">MY PAGE</a></li>
            </ul>
        </div>
        <!-- 마이페이지 끝 -->
        <!-- 서브페이지 시작 -->
        <div class="h-bot">
            <div class="h-bot-line"></div>
            <div class="h-bot-in clear">
                <div class="logo"><a href="index.html">자바미술관</a></div>
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
                                <li><a href="hall2.html">대관신청</a></li>
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
        <!-- 서브페이지 끝 -->
    </div>
    <div id="container">
        <!-- 메인배너 시작 -->
        <div class="con1">
        </div>
        <!-- 메인배너 끝 -->
        <!-- 로그인 창 시작 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-loginbox">
                    <h2>로그인</h2>
                    <p>대림미술관 홈페이지를 방문해주셔서 감사합니다.<br>로그인하시면 홈페이지를 보다 편리하게 사용하실 수 있습니다.</p>
                    <!-- 로그인 데이터 전송 방식 -->
                   <form name="board" id="board" method="post" action="<%=request.getContextPath()%>/user/login.do" onsubmit="return loginCheck();">
                        <input type="text" id="id" name="id" maxlength="20" placeholder="아이디를 입력하세요.">
                        <input type="password" id="password" name="password" maxlength="20" placeholder="비밀번호를 입력하세요.">
                        <div class="chk-box"> 
                            <input type="checkbox" id="chk01" name="chk01">
                            <label for="chk01">아이디(이메일) 저장</label>
                        </div>
                        <input type="submit" value="로그인" id="submit01">
                        <ul class="login-sc">
                            <li><a href="#">회원가입</a></li>
                            <li><a href="idfind.html">아이디 찾기</a></li>
                            <li><a href="pwfind.html">비밀번호 찾기</a></li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <!-- 로그인 창 끝 -->
    </div>
    <div id="footer">
        <div class="foot-in">
            <div class="foot-top clear">
                <div class="foot-logo"><img src="img/logo.png"></div>
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
</body>
</html>