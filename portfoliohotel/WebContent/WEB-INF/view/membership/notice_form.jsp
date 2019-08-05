<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.notice.*"%>
<%@ page import="util.*"%>
<%
NoticeVO param = (NoticeVO)request.getAttribute("vo");
NoticeVO data = (NoticeVO)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/notice-form.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>공지사항-작성자페이지</title>
</head>
<body>
    <%@ include file="../header_menu.jsp" %>

    <div id="container">
        
        <div class="banner">
            <div class="notice-section">
                    <h2>Support</h2>
                    <h3>Notice</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>
        <div class="notice">
            <div class="support-list">
                <ul class="support-list-center">
                    <li class="on"><a href="notice.html">공지사항</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="qna.html">Q&A</a></li>
                </ul>
            </div>
        </div>

        <div class="notice-form">
                <div class="notice-area">
                    <form method="POST" >
                        <label for="notice-title">제목</label>
                        <div><%=data.getTitle() %></div>
                        <ul class="base_info clear">
                            <li>
                                <label for="notice-title">등록일자</label>
                                <div><%=data.getRegdate() %></div>
                                
                            </li>
                            <li>
                                <label for="notice-title">조회수</label>
                                <div><%=data.getReadno() %></div>
                            </li>
                        </ul>
                        <label for="notice-title">첨부파일</label>
                        <input type="text" id="email" name="email">
                        <label for="notice-cont">내용</label>
                        <div><%=data.getContents() %></div>
                        <input type="submit" value="질문하기">
                    </form>
                </div>
        </div>
 
    </div>
