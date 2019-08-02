  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ page import="member.*" %>
  <%@ page import="main.*" %>
  <%
  MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo"); 
  %>
  <script>
  function goJoin() {
	  
	  
	  
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		$("#email").val(email1+email2);
		$("#tel").val(tel1+ tel2 +tel3);
		return true;
	}
  <!--
  $("#email").keyup(function(){
		$.ajax({
			type:'POST',
			url:"/manage/member/idcheck",
			data:$("#frm").serialize(),
			async:false,
			success:function(data) {
				var val = data.trim();
				if (val == "0") {
					$("#idText").text("사용가능");
					$("#idText").css("color","#68A7C7");
				} else {
					$("#idText").text("사용불가");
					$("#idText").css("color","#E89393");
				}
			}
		});
	});
  -->
  </script>
    <div id="header">
        <%@ include file="/WEB-INF/view/include/login.jsp" %>
        <%@ include file="/WEB-INF/view/include/join.jsp" %>
        
        <!-- Right Fix -->
        <div class="fix-menu-box">
            <ul class="fix-menu">
                <li class="os"><a href="#"></a></li>
                <li><a href="#">병원소개</a></li>
                <li><a href="#">진료과목</a></li>
                <li><a href="#">입양후기</a></li>
                <li><a href="#">입양프로필</a></li>
                <!-- <li class="oq"><a href="#">오시는길</a></li> -->
            </ul>
            <!-- <div class="fix-menu-text">오시는 길</div> -->
        </div>
        <h1 class="header-logo"><a href="/index.do"><img src="/icon/logo_lightgreen.png"></a></h1>
        <!-- GNB MENU -->
        <div class="header-center clear">
            <!-- gnb & sub menu -->
            <ul class="gnb clear">
                <li>
                    <a href="/intro/intro-hi.do">병원소개</a>
                    <ul class="header-sub">
                        <li><a href="/intro/intro-hi.do">인사말</a></li>
                        <li><a href="/intro/intro-staff.do">의료진소개</a></li>
                        <li><a href="/intro/intro-map.do">오시는길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/department/surgery.do">진료과목</a>
                    <ul class="header-sub">
                        <li><a href="/department/surgery.do">외과</a></li>
                        <li><a href="/department/internal.do">내과</a></li>
                        <li><a href="/department/radiology.do">영상의학과</a></li>
                        <li><a href="/department/emergency.do">응급의료센터</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/reservation/index.do">예약</a>
                    <ul class="header-sub">
                        <li><a href="/reservation/index.do">진료예약</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/adopt/animalprofile">입양</a>
                    <ul class="header-sub">
                        <li><a href="/adopt/animalprofile/animalprofile.do">프로필</a></li>
                        <li><a href="/adopt/review/review.do">입양후기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/cscenter/notice/notice.do">고객센터</a>
                    <ul class="header-sub">
                        <li><a href="/cscenter/notice/notice.do">공지사항</a></li>
                        <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                        <li><a href="/cscenter/qna/qna.do">문의하기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/my/my-infor.do">마이페이지</a>
                    <ul class="header-sub">
                        <li><a href="/my/my-infor.do">나의정보</a></li>
                        <li><a href="/my/my-pet.do">나의반려동물</a></li>
                        <li><a href="/my/my-res.do">예약확인</a></li>
                        <li><a href="/my/my-ask.do">문의내역</a></li>
                    </ul>
                </li>
            </ul>
            <!-- 끝 -->
        </div>
        <!-- 로그인 메뉴들-->
        <ul class="login-box clear">
            <li><a href="https://www.facebook.com/haemaruah/"></a></li>
            <li><a href="https://www.youtube.com/results?search_query=%ED%95%B4%EB%A7%88%EB%A3%A8%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90"></a></li>
            <li><a href="https://instagram.com/haemaru_ah?igshid=zw6yyof9s7ka"></a></li>
			<%
				if(memberInfo == null) {
			%>           
            <li class="loginBtn"><a href="#">로그인</a></li>
            <li class="joinBtn"><a href="#">회원가입</a></li>
        	<%
				}else{
        	%>
            <li><a href="/my/my-infor.do"><%=memberInfo.getName()%>님</a></li>
            <li><a href="/member/logout.do">로그아웃</a></li>
            <%
				}
        	%>
        </ul>  
        	
        <!-- 끝 -->
        <!-- 비밀번호 찿기 -->
        <div id="pass-lost">
            <div class="pass-head">
                <p>Find</p>
                <img src="/icon/footer-icon.png">
            </div>
            <div class="pass-page">
                <div class="pass-back-arrow">
                    <a href="#"><img src="/icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-logo">
                    <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                </h1>
                <form class="pass-form" method="GET" action="text.php">
                    <div class="email-pass-box">
                        <span><label for="email_pass_input" class="label">어려움을 겪고 있는 해마루 계정</label></span>
                    </div>
                    <div>
                        <input type="text" maxlength="5" id="name_pass_input" name="name_pass_input" class="pass-size" placeholder="이름을 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="8" id="birth_pass_input" name="birth_pass_input" class="pass-size" placeholder="생년월일을 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="11" id="number_pass_input" name="number_pass_input" class="pass-size" placeholder="전화번호를 입력하세요.">
                    </div>
                    <div>
                        <input type="text" maxlength="20" id="email_pass_input" name="email_pass_input" class="pass-size" placeholder="이메일을 입력하세요.">
                    </div>
                    <div>
                        <input type="submit" value="인증번호 보내기" id="pass-lost-submit">
                    </div>
                </form>
                <ul class="pass-bot clear">
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이메일무단수집거부</a></li>
                </ul>
            </div>
        </div>
        <!-- 끝 -->
        <!-- 비밀번호 찾기 인증확인창 -->
        <div id="pass-chk">
            <div class="pass-chk-head">
                <p>Find</p>
                <img src="/icon/footer-icon.png">
            </div>
            <div class="pass-chk-page">
                <div class="pass-chk-back-arrow">
                    <a href="#"><img src="/icon/backarrow.png">
                    <P>뒤로가기</P></a>
                </div>
                <h1 class="pass-chk-logo">
                    <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                </h1>
                <form class="pass-chk-form" method="GET" action="text.php">
                    <div class="email-pass-chk-box">
                        <span><label for="email_pass_chk_input" class="label">어려움을 겪고 있는 해마루 계정</label></span>
                    </div>
                    <div>
                        <input type="text" maxlength="20" id="email_pass_chk_input" name="email_pass_input" class="pass-size" placeholder="인증번호를 입력하세요.">
                    </div>
                    <div>
                        <input type="submit" value="확인" id="pass_chk-submit">
                    </div>
                </form>
                <ul class="pass-chk-bot clear">
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이메일무단수집거부</a></li>
                </ul>
            </div>
        </div>
    </div> 