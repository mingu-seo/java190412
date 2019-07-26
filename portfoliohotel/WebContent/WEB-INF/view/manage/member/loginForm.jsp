<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.member.*"%>
<%@ page import="util.*"%>

<%
	MemberVO param = (MemberVO) request.getAttribute("vo");
	ArrayList<MemberVO> list = (ArrayList) request.getAttribute("list");
%>
<script>
function loginCheck(){
	if ( getObject("email").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("email").focus();
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
	var f=document.member;
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>로그인</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="blist">
								<div id="container">
									<div class="login-section">

										<div class="login-box clear">
										
											<!-- <form action="#" method="post"> -->
											<form name="mamber" id="member" method="post" action="<%=request.getContextPath()%>/manage/member/login" onsubmit="return loginCheck();">
												<div class="login-box-logo"></div>
												<div class="login-board clear">
													<div class="login-box-left">
														<!-- ID 구역 -->
														<input type="text" id="email" name="email" placeholder="이메일">
														</input>
														</div>
														<div>
															<!-- 비밀번호 구역 --><input type="password" id="password"
															name="password" placeholder="비밀번호">
															</input>
													</div>
													
													<div class="login-board-right">
														<!-- <input type="submit"  href="#" onclick="loginCheck();"value="LOGIN"> --> 
														<input type="submit" src="<%=request.getContextPath()%>" value ="로그인" class="loginBtn" title="" />
														
													</div>
													<div class="id-remember">
														<input type="checkbox" id="login-chk" name="login-chk">
															<label for="login-chk">아이디 기억하기</label>
													</div>
													<h4 class="find_id">
														<a href="<%=param.getTargetURLParam("idSrc", param, 0)%>">이메일찾기 </a>/
														<a href="<%=param.getTargetURLParam("pwdSrc", param, 0)%>"> 비밀번호 찾기</a>
													</h4>
													<div class="btnLeft">
														<a class="btns"
															href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
													</div>
												</div>
											</form>
										</div>
										<!-- //blist -->
									</div>
									<!-- //bbs -->
									<!-- 내용 : e -->
								</div>
								<!--//con -->
							</div>
							<!--//content -->
						</div>
						<!--//container -->
						<!-- E N D :: containerArea-->
					</div>
					<!--//canvas -->
				</div>
				<!--//wrap -->
</body>
</html>