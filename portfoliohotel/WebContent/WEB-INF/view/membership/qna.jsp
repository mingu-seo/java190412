<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.qna.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
ArrayList<QnaVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");

%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
function goIdentification() {
	var url = "popup";
	var name = "popup";
	window.open(url,name,"width=500,height=200,toolbar=no,location=no,scrollbars=yes,menubar=no,resixable=yes,left=500,right=500");
	
	}

</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/qna.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>Tree_로그인페이지</title>
</head>
<body>
    <div id="header">
        <div class="header-center">
            <div class="pc-header">
                <h1 class="logo"><a href="../index.html"><img src="../img/header-logo.png"></a></h1>
                <ul class="pc-gnb">
                    <li>
                        <a href="#">BOOK</a>
                            <div class="pc-sub">
                                    <div class="pc-sub-center">
                                        <div class="pc-sub-box">
                                            <h2><a href="../special_promotion.html">Promotion</a></h2>
                                            <ul class="offer">
                                                <li><a href="../room_offer.html">Room Package</a></li>
                                                <li><a href="../room_offer.html">Dining Package</a></li>
                                                <li><a href="../room_offer.html">Events & Gift</a></li>
                                            </ul>
                                        </div>
                                        <div class="pc-sub-box">
                                            <h2>Rooms</h2>
                                            <ul class="Rooms">
                                                <li><a href="room-detail-subpage.html">Namsan Pool Deluxe Room</a></li>
                                                <li><a href="room-detail-subpage.html">Namsan Pool Premier Suite</a></li>
                                                <li><a href="room-detail-subpage.html">Namsan Presidential Suite</a></li>
                                                <li><a href="room-detail-subpage.html">Spa Sanctuary Suite</a></li>
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
                                                    <li><a href="../facilities.html#f1">The Oasis</a></li>
                                                    <li><a href="../facilities.html#f2">Indoor Swimming Pool</a></li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="pc-sub-box mtop">
                
                                                <ul class="Rooms">
                                                        <li><a href="../facilities.html#f3">Fitness Centre</a></li>
                                                        <li><a href="../facilities.html#f4">Sauna</a></li>
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
                                                <a href="../notice.html" class="notice-a">
                                                <ul>
                                                    <li>Notice</li>
                                                    <li class="support-text">
                                                        반얀트리 공지사항과<br/>
                                                        놓칠 수 없는 이벤트 정보를 알려드립니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/notice-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../faq.html">
                                                <ul>
                                                    <li>FAQ</li>
                                                    <li class="support-text">
                                                        반얀트리에 대한<br/>
                                                        자주 묻는 질문입니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/faq-icon.png"></li>
                                                </ul>
                                                </a>
                                            </div>
                                            <div class="pc-sub-box mtop">
                                                <a href="../qna.html">
                                                <ul>
                                                    <li>Q&A</li>
                                                    <li class="support-text">
                                                        반얀트리에 관한질문 사항이나 궁금한 점을<br/> 
                                                        남겨 주시면 신속하게 답변을 드리겠습니다.
                                                    </li>
                                                    <li class="support-icon"><img src="../img/qna-icon.png"></li>
                                                </ul>
                                                </a>
                                        </div>
                            </div>
                    </li>
                    <!-- <li><a href="#">SIGN IN</a></li> -->
                </ul>
                <a href="sign_in.html">SIGN IN</a>
            </div>
        </div>
    </div>
    
    
    <div id="container">
        
        <div class="banner">
            <div class="qna-section">
                    <h2>Support</h2>
                    <h3>Q&A</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>
        <div class="qna">
            <div class="support-list">
                <ul class="support-list-center">
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li class="on"><a href="qna">Q&A</a></li>
                </ul>
            </div>
            <div class="qna-table">
                <div class="table-box">
                    <!-- qna 제목 table 구역 -->
                    <table>
                        <tr class="table-head">
                            <th>제목</th>
                            <th class="w10">답변여부</th>
                            <th class="w10">작성자</th>
                            <th class="w10">작성일</th>
                            
                        </tr>
                       	 <%
							if (totCount == 0) {
						 %>
							<tr>
								<td class="first" colspan="8">등록된 글이 없습니다.</td>
							</tr>
						<%
							} else {
									String targetUrl = "";
									String topClass = "";
									QnaVO data;
									String bgColor ="";
																
									for (int i=0; i<list.size(); i++) {
												data = list.get(i);
												targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("qna_read", param, data.getNo())+"'\"";
												bgColor = (data.getReply()==0)?"#ffffff":"#e8e8e8";
																	
								%>
                        <tr>
                        	<% 
                        	
							String[] nameArr= data.getName().split(",");		
							%>
                            <td <%=targetUrl%>class="title"><a href="#"><%=data.getTitle() %></a></td>
                            <td <%=targetUrl%> class="table-date"><%=CodeUtil.getReplyExist(data.getReply())%></td>
                            <td <%=targetUrl%> class="name"><a href="#"><%=nameArr[0]%><%=nameArr[1]%></a></td>
                            <td><a href="#"><%=DateUtil.getDateFormat(data.getRegdate())%></a></td>
                            
                            
                            
                        </tr>
                       
                        <%
									}
								 }
						%>
                    </table>
                    	<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
						<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
						<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
						<input type="hidden" name="no" id="no" value="<%=param.getNo() %>"/>
						<input type="hidden" name="email" id="email" value="<%=param.getEmail() %>"/>
						
                    <!-- 검색창 구역 -->
                    <form name="searchForm" id="searchForm" action="qna" method="post">
                    <div class="search">
                            <select name="stype">
                                <option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
								<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>작성자</option>
								<option value="email" <%=Function.getSelected(param.getStype(), "email") %>>이메일</option>
								<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
                            </select>
                            <input type="text" name="sval" value="<%=param.getSval()%>" id="text" placeholder="text">
                            <button class="sbtn" alt="검색" >검색</button>
                            <input onclick="goIdentification()" type="button" value="팝업">
                    </div>
                    </form>
                </div>
                

                <!-- 글쓰기 버튼 구역 -->
                <div class="qna-q-btn">
                    <p><a href="qna_q">글 쓰기</a></p>
                </div>
                <div class="table-page">
                    <ul class="page-number clear">
                        <%=Page.indexList(param.getReqPageNo(), totPage, request)%>
                    </ul>
                </div>
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
                    <li><a href="#"><img src="../img/sns1.png"></a></li>
                    <li><a href="#"><img src="../img/sns2.png"></a></li>
                    <li><a href="#"><img src="../img/sns3.png"></a></li>
                    <li><a href="#"><img src="../img/sns4.png"></a></li>
                </ul>
            </div>
            <div class="footer-bottom">
                <h5>에이블현대호텔앤리조트주식회사  대표이사  JANG PAUL HYUK (장혁),최종윤  사업자 등록번호 104-81-21344  통신판매업신고번호 2012-서울중구-1214<br/>
                    서울시 중구 장충단로60(장충동2가), 04605 / TEL 02.2250.8000
                </h5>
                <h6>Copyright 2018 Banyan Tree Club & Spa. All Rights Reserved</h6>
                <ul class="support-logo clear">
                    <li><img src="../img/footericon1.png"></li>
                    <li><img src="../img/footericon2.png"></li>
                    <li><img src="../img/footericon3.png"></li>
                    <li><img src="../img/footericon4.png"></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>