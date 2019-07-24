<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
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
    <link rel="stylesheet" href="/css/mypage.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <title>마이페이지</title>
</head>
<body>
   
    <div id="container">
        
        <div class="banner">
            <div class="mypage-section">
                    <h2>마이페이지</h2>
                    <h3>MY PAGE</h3>
                </div>
        </div>
        <div class="reservation clear">
            <h3>예약현황<span class="title-sub">RESERVATION STATUS</span></h3>
            <div class="reservation-status-left">
                <table>
                    <tr class="table-head">
                        <th>예약 상품</th>
                        <th>인원</th>
                        <th>추가사항</th>
                    </tr>
                    <tr class="reserved">
                        <td>NAMSAN POOL DELUX ROOM</td>
                        <td class="participants">성인 x 2
                            <br/>
                            어린이 x 1
                        </td>
                        <td class="option">
                            SPA
                            <span class="option-select">- 추가사항 없음</span>
                            침대 추가
                            <span class="option-select">x 1</span>
                            웰컴 와인 & 치즈
                            <span class="option-select">x 1</span>
                        </td>
                    </tr>
                    <tr>
                        <td>TOTAL</td>
                        <td class="price" colspan="2">1,000,000 WON</td>
                    </tr>
                </table>
            </div>
            <div class="reservation-status-right">
                <div class="my-info">
                    <h4>
 <td colspan="3"><%=data.getName()%> </td> 
			<br/>
                        환영합니다 !
                    </h4>
                    <table>
                        <tr>
                            <td>회원등급</td>
                            
                            <td>VIP</td>
                        </tr> 
                     <tr>
							<th scope="row"><label for="">등급</label></th>
							<td colspan="3"><%=CodeUtil.getMgrade(data.getGrade())%></td>
										
						</tr> 
                        <tr>
                            
                            <th scope="row"><label for="">포인트</label></th>
							<td colspan="3"><%=data.getPoint()%></td> 
                        </tr>
                    </table>
                </div>
                <ul class="my-info-list">
                    <li><a href="edit_account.do">개인정보 수정</a></li>
                    <li><a href="delete_account.do">회원탈퇴</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
        
</body>
</html>