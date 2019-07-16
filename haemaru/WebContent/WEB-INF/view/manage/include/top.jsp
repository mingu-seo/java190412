<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header-center clear">
            <!-- gnb & sub menu -->
            <ul class="gnb clear">
                <li>
                    <a href="intro/intro-hi.do">병원소개</a>
                    <ul class="header-sub">
                        <li><a href="intro/intro-hi.do">인사말</a></li>
                        <li><a href="intro/intro-staff.do">의료진소개</a></li>
                        <li><a href="intro/intro-map.do">오시는길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub2-1.html">진료과목</a>
                    <ul class="header-sub">
                        <li><a href="sub2-1.html">외과</a></li>
                        <li><a href="sub2-2.html">내과</a></li>
                        <li><a href="sub2-3.html">영상의학과</a></li>
                        <li><a href="sub2-4.html">응급의료센터</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub3-1.html">예약</a>
                    <ul class="header-sub">
                        <li><a href="sub3-1.html">진료예약</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub4-1.html">입양</a>
                    <ul class="header-sub">
                        <li><a href="sub4-1.html">프로필</a></li>
                        <li><a href="sub4-2.html">입양후기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="sub5-1.html">고객센터</a>
                    <ul class="header-sub">
                        <li><a href="/cscenter/notice/index.do">공지사항</a></li>
                        <li><a href="sub5-2.html">FAQ</a></li>
                        <li><a href="sub5-3.html">문의하기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="my/my-infor.do">마이페이지</a>
                    <ul class="header-sub">
                        <li><a href="my/my-infor.do">나의정보</a></li>
                        <li><a href="my/my-pet.do">나의반려동물</a></li>
                        <li><a href="my/my-res.do">예약확인</a></li>
                        <li><a href="my/my-ask.do">문의내역</a></li>
                    </ul>
                </li>
            </ul>
            <!-- 끝 -->
            		<ul class="login-box clear">
			<li><a href="https://www.facebook.com/haemaruah/"></a></li>
			<li><a
				href="https://www.youtube.com/results?search_query=%ED%95%B4%EB%A7%88%EB%A3%A8%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90"></a></li>
			<li><a
				href="https://instagram.com/haemaru_ah?igshid=zw6yyof9s7ka"></a></li>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
        </div>
=======
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>
<script>

function OpenWinCount(URL,width,height) {

	var str,width,height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,";
	str=str+"width="+width;
	str=str+",height="+height+"',top=100,left=100";

	window.open(URL,'remote',str);
}

$(window).load(function(){
	// 1depth 메뉴들
	var parent = $(".parent");
	
	//현재 주소
	// 주소중 manage이후 폴더 경로 자르기 ex) /manage/board/index.jsp -> board
	var curUrl = document.location.pathname;
	curUrl = curUrl.substring(curUrl.indexOf("manage")+12,curUrl.length);
	if (curUrl.indexOf("/") > 0) {
		curUrl = curUrl.substring(curUrl,curUrl.indexOf("/"));
	}
	parent.each(function(){
		$(this).find("span").removeClass("bg");

		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		// 주소중 manage이후 폴더 경로 자르기 ex) /manage/board/index.jsp -> board
		href = href.substring(href.indexOf("manage")+7,href.length);
		href = href.substring(href,href.indexOf("/"));
		
		// 현재 주소에서 href가 포함 되어 있으면 그 메뉴에 배경색 지정
		if(curUrl == href){
			$(this).find("span").addClass("bg");
		}
	});
	
	// 방문자 통계 클릭시 메뉴 유지
	parent.click(function(){
		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		if(href.indexOf("OpenWinCount") >= 0){
			parent.find("span").removeClass("bg");
			$(this).find("span").addClass("bg");
		}
	});
	
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1><%=property.SiteProperty.COMPANY_NAME%><span><a href="#" onclick="window.open('<%=property.SiteProperty.COMPANY_URL%>');"> <%=property.SiteProperty.COMPANY_URL%> </a></span></h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
				<li class="frist"><a href="#" onclick="window.open('<%=property.SiteProperty.COMPANY_URL%>');">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/manage/logout">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="<%=request.getContextPath()%>/manage/member/index" class="parent"><span>회원관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/" class="parent"><span>예약관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/customer/index" class="parent"><span>고객관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/product/index" class="parent"><span>제품관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/board/notice/index.do" class="parent"><span>고객지원</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/manage/board/notice/index.do"><span>공지사항</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>후기</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>자유게시판</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>자주하는질문</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>FAQ분류관리</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>Q&A</span></a></li>
						
					</ul>
					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/manage/admin/index" class="parent"><span>관리자관리</span></a>
					<div>
					<ul>
						<li><a href="<%=request.getContextPath()%>/manage/admin/index"><span>관리자관리</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/admin/loginHistory"><span>관리자접속기록</span></a></li>
					</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->
>>>>>>> branch 'master' of https://github.com/mingu-seo/java190412.git
