<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>대관안내</title>
<meta http-quiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/hall2.css">
    
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript">
        $(function(){
            // 대관 시작
            $( "#con3-day-start").datepicker({
                dayNamesMin:['일','월','화','수','목','금','토'], // 요일 변경 구문
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 변경 구문
                // 달력안에 오늘날짜로 돌리는 내용과 닫는 창을 노출시키는 필수 구문
                showButtonPanel: true, // 밑에 내용들 떄문에 써야하는 필수 구문
                currentText: '오늘 날짜', // 오늘 날짜로 돌아오는 구문 
                closeText: '닫기', // 달력창 닫기

                dateFormat: "yy-mm-dd", // 날짜 클릭시 text box에 담겨지는 순서
                yearRange: "2019:2019", // 2019년에서만 선택할 수 있게하는 구문
                minDate: "0D" //오늘 기준에서 이전거는 선택할 수 없게하는 구문
            });
            //대관 종료
            $("#con3-day-end").datepicker({
                dayNamesMin:['월','화','수','목','금','토','일'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                showButtonPanel: true, 
                currentText: '오늘 날짜', 
                closeText: '닫기',
                dateFormat: "yy-mm-dd",
                yearRange: "2019:2019",
                minDate: "0D"
            });

        });
    </script>
</head>
<body>
    <%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div class="con">
        <!-- 메인배너 시작 -->
        <div class="con1">
            <div class="con1-box">
                <h3>RENTAL</h3>
                <p>대관신청</p>
            </div>
        </div>
        <!-- 메인배너 끝 -->
        <!-- 대관문의 텍스트 시작 -->
        <div class="con2">
            <h2>대관문의</h2>
            <p>대관문의를 남겨주시면 확인 후 연락을 드리도록 하겠습니다.</p>
        </div>
        <!-- 대관문의 텍스트 끝 -->
        <!-- 대관신청 작성하기 시작 -->
        <div class="con3 clear">
            <table class="con3-table">
                    <tr>
                        <th>글쓴이</th>
                        <td>joo*******</td>
                    </tr>
                    <tr>
                        <th>대관일</th>
                        <td>
                            <label for="con3-day-start">대관시작</label>
                            <input type="text" id="con3-day-start" name="con3-day-start">
                            &nbsp;&nbsp;
                            <label for="con3-day-end">대관종료</label>
                            <input type="text" id="con3-day-end" name="con3-day-end">
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td ><input type="text" id="con3-phone" name="con3-phone"></td>
                    </tr>
                    <tr>
                        <th>대관 문의사항</th>
                        <td><textarea id="text-box">내용을 입력하세요.</textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <div class="con3-iconbox">
                                <input type="file">
                            </div>
                        </td>
                    </tr>
            </table>
            <div class="con3-center">
                <input type="submit" id="con3-btn" name="con3-btn" value="전송하기">
            </div>
        </div>
        <!-- 대관신청 작성하기 끝 -->
    <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>