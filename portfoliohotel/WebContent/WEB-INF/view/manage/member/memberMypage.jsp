<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
%>

<!DOCTYPE html>
<html lang="ko">
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
            <%String[] nameArr = vo.getName().split(","); %>
            <div class="reservation-status-right">
                <div class="my-info">
                    <h4>
 <td colspan="3"><%= nameArr[0]%> <%=nameArr[1]%> 님</td> 
			<br/>
                        환영합니다 !
                    </h4>
                     
                    <table>
                         
                     <tr>
							<th scope="row"><label for="">회원등급</label></th>
							<td colspan="3"><%=CodeUtil.getMgrade(vo.getGrade())%></td>
										
						</tr> 
                        <tr>
                            
                            <th scope="row"><label for="">포인트</label></th>
							<td colspan="3"><%=vo.getPoint()%></td> 
                        </tr>
                    </table>
                 
        </div>
        
        <div class="btnRight">
        	<a class="btns" href="/manage/member/logout" ><strong>로그아웃</strong> </a>
									
		</div>
		<div>
        <a class="btns" href="/manage/member/memberEdit" ><strong>개인정보 수정</strong> </a>
        </div>
        <div>
        <a class="btns" href="/manage/member/memberDelete" ><strong>회원탈퇴</strong> </a>
        </div>
</body>
</html>