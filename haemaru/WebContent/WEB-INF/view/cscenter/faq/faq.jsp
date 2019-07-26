<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="manage.faq.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
FaqVO param = (FaqVO)request.getAttribute("vo");
ArrayList<FaqVO> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FAQ</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-2.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
  <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>고객센터</h2>
                    <p>Customer Center</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/cscenter/notice/notice.do">공지사항</a></li>
                    <li class="on"><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>F A Q</h3>
                <p>해마루 이차진료 동물병원에서 여러분이 자주 궁금해 하시는 사항들을 안내 드립니다.</p>
                <div class="faq-area">
                    <form class="faq-search-btn" method="GET" action="text.php">
                        <input type="text" id="faq_search_input" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_faq">
                    </form>
                    <div class="faq-box-group">
                        <ul class="faq-box">
                        	<%
                        	String targetUrl = "";
							String topClass = "";
							FaqVO data;
							for (int i=0; i<list.size(); i++) {
								data = list.get(i);
								targetUrl = "style='cursor:pointer;' onclick=\"location.href='#'\"";
							%>
                            <li>
                                <a href="#"><p><span>Q</span><%=data.getQuestion()%></p></a>
                                <div class="faq-sub">
                                    <p><%=data.getAnswer()%></p>
                                </div>
                            </li>	
                            <%
							}
                            %>
                        </ul>
                        <ul class="faq-number clear">
                            <li><a href="#"></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>