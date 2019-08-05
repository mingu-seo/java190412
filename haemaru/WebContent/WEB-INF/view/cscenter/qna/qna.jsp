<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.qna.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
ArrayList<QnaVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문의하기</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub5-3.css">
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
                    <li><a href="/cscenter/faq/faq.do">FAQ</a></li>
                    <li class="on"><a href="/cscenter/qna/qna.do">문의하기</a></li>
                </ul>
            </div>
            <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>문의하기</h3>
                <p>Ask for infomation</p>
                <div class="reply-area">
                    <form class="search-btn" method="GET" action="text.php">
                        <select>
                            <option>전체</option>
                            <option>외과</option>
                            <option>내과</option>
                            <option>영상의학과</option>
                            <option>응급의료센터</option>
                            <option>예약</option>
                        </select>
                        <input type="text" id="search_input" name="search" placeholder="검색어를 입력하세요.">
                        <input type="submit" value="검색"  id="btn_submit_search">
                    </form>
                    <div class="reply-table">
                        <table>
                        	<tr>
                                <th>No.</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Data</th>
                                <th>Writer</th>
                            </tr>
                        	<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="6">등록된 질문이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										QnaVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
								%>
                            <tr>
                                <td><%=data.getNo()%></td>
                                <td><%=data.getCategory()%></td>
                                <td><a href="viewqna?no=<%=data.getNo()%>"><%=data.getTitle()%></a></td>
                                <td><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
                                <td><%=data.getMember_pk() %></td>
                            </tr>
                           <%
										}
									 }
                           %>
                        </table>
                        <ul class="reply-btn clear">
                            <li><a href="/cscenter/qna/addqna.do">문의하기</a></li>
                            <li><a href="sub5-5.html">내 질문 보기</a></li>
                        </ul>
                        <div class="reply-number-all clear">
                            <p class="reply-number-arrow"><a href="#"></a></p>
                            <ul class="reply-number clear">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                            </ul>
                            <p class="reply-number-arrow2"><a href="#"></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>