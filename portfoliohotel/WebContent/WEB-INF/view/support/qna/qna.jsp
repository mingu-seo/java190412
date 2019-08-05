<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.qna.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="board.member.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
ArrayList<QnaVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
MemberVO sessionMember = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
function goPassword(){
	$("#editBtn1").click(function(){
		$("#PwCheckBtn").show()
		$("#editBtn2").show()
		$("#editBtn1").hide()
		$("#password").focus();
	});	
}
function goEdit(){
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요")
		$("#password").focus();
		return false;
	} 
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

<jsp:include page="/header_menu" flush="true"/>
    
    
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
                    <li><a href="/membership/notice">공지사항</a></li>
                    <li><a href="/membership/faq">FAQ</a></li>
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
												targetUrl = "style='cursor:pointer;' onclick=open_win()";
												bgColor = (data.getReply()==0)?"#ffffff":"#e8e8e8";
																	
								%>
                        <tr>
                        	<%-- <% 
                        	
							String[] nameArr= data.getName().split(",");		
							%> --%>
                            <td <%=targetUrl%>class="title"><a href="#"><%=data.getTitle() %></a></td>
                            <td <%=targetUrl%> class="table-date"><%=CodeUtil.getReplyExist(data.getReply())%></td>
                            <td <%=targetUrl%> class="name"><a href="#"><%=data.getFirstName()%><%=data.getLastName()%></a></td>
                            <td><a href="#"><%=DateUtil.getDateFormat(data.getRegdate())%></a></td>
                            
                            
                            
                        </tr>
                       	<tr name="pwCheck" id="PwCheckBtn">
                       		<td>비밀번호 확인</td>
                       		<td>
                       			<input type="password" name="password" id="password"/>
                       		</td>
                       		<td>
                       			<input type="submit" class="editBtn" href="javascript:$('#frm').submit();"></a>
                       		</td>
                       		
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