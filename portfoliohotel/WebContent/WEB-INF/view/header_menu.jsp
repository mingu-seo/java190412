<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%@ page import="pkg.*" %>
<%@ page import="util.*" %>
<%
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
MemberVO data = (MemberVO)request.getAttribute("data");
%>
<%
PkgVO pparam = (PkgVO)request.getAttribute("pvo");
ArrayList<PkgVO> plist = (ArrayList<PkgVO>)request.getAttribute("plist");
int ptotCount = (Integer)request.getAttribute("ptotCount");
int ptotPage = (Integer)request.getAttribute("ptotPage");
%>
<div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="/index"><img src="/img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
	                                        <h2>Package</a></h2>
                                            <ul class="offer">
                                            <%
                                            	if (ptotCount == 0) {
                                            %>
                                            	<ul>
                                            		<li class="first">등록된 글이 없습니다.</li>
                                            	</ul>
                                            <%
                                            	} else {
                                            		PkgVO pdata;
                                            		for (int i=0; i<plist.size(); i++) {
                                            			pdata = plist.get(i);
                                            %>
                                            		<li><a href="/pkg/detail_page/pkg_detail_page?no=<%=pdata.getNo()%>"><%=pdata.getEname()%></li>
                                            <%
                                            		}
                                            	}
                                            %>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="/room/detail_sub1">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="/room/detail_sub2">Namsan Pool Premier Suite</a></li>
                                                <li><a href="/room/detail_sub3">Namsan Presidential Suite</a></li>
                                                <li><a href="/room/detail_sub4">Spa Sanctuary Suite</a></li>
                                                <li><a href="/room/detail_sub5">Banyan Pool Presidential Suite</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Dining</h2>
                                            <ul class="Dining">
                                                <li><a href="#">The Festa</a></li>
                                                <li><a href="#">Granum Dining Lounge</a></li>
                                                <li><a href="#">Moon Bar</a></li>
                                                <li><a href="#">The Oasis Outdoor Kitchen</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Meeting & Wedding</h2>
                                            <ul class="Meeting & Wedding">
                                                <li><a href="#">Meeting</li>
                                                <li><a href="#">Wedding</a></li>
                                                <li><a href="#">Family Party</a></li>
                                            </ul>
                                        </div>
                                    </div>
                            </div>
                    </li>
                    <li class="facilities">
                        <a href="#">Facilities</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box facil-left">
                                                <h2 class="no-line">Facilities</h2>
                                                <ul>
                                                    <li><a href="/facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="/facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                	<li><a href="/facilities.html#f3">Fitness Centre</a></li>
                                                    <li><a href="/facilities.html#f4">Sauna</a></li>
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop facil-right">
                                                
                                                <ul class="Dining">
                                                    <li><a href="#">Troon Golf Academy</a></li>
                                                    <li><a href="#">Foresta Beauty Salon</a></li>
                                                </ul>
                                            </div>
                                        </div>
                            </div>
                        
                    </li>
                    <li>
                        <a href="#">Support</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center center clear">
                                            <div class="pc-sub-box">
                                                <h2 class="no-line">Support</h2>
                                                <a href="/membership/notice" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        호텔 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="/membership/faq">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        호텔에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="/support/qna/qna">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        호텔에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="/img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <!-- <a href="/membership/sign_in">Sign In</a> -->
                <%if(sessionMember == null){ %>
                <a href="/membership/sign_in">Sign in</a>
                <%}else{ %>
                <a href="/membership/mypage">My page</a>
                <%} %>
            </div>
        </div>
    </div>