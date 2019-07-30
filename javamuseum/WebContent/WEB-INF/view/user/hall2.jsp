<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="manage.member.*" %>
<%@ page import="manage.rental.*" %>
<%
MemberVO umembervo2 = (MemberVO)session.getAttribute("memberInfo");
RentalVO param = (RentalVO)request.getAttribute("vo");
String existEmail = umembervo2.getEmail();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>대관안내</title>
<style>
input[type=checkbox]
{
  Double-sized Checkboxes;
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari and Chrome */
  -o-transform: scale(1.5); /* Opera */
  padding: 5px;
}
</style>
<meta http-quiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/hall2.css">

<script type="text/javascript" src="/js/function.js"></script>
<script type="text/javascript" src="/js/function_jquery.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/jquery.mousewheel.min.js"></script>

<script type="text/javascript" >
$(document).ready(function(){  
	$('#resetfile').click(function(){  
		$('#frm input').each(function(){
			if($(this).hasClass('w50')) $(this).val('');  
		});  
	});  
 }); 

function calc() {	// 예상 요금 조회
	var hallnum = $("#hallnumber").val();
	var price = 0;
	if (hallnum == 1) {
		price = 1010000;
	} else if (hallnum == 2) {
		price = 680000;
	} else if (hallnum == 3) {
		price = 710000;
	} else if (hallnum == 4) {
		price = 850000;
	} else if (hallnum == 5) {
		price = 1850000;
	} else if (hallnum == 6) {
		price = 650000;
	} else if (hallnum == 7) {
		price = 910000;
	} else if (hallnum == 8) {
		price = 1360000;
	} else if (hallnum == 9) {
		price = 530000;
	}
	var stad = $("#startdate").val();
    var endd = $("#enddate").val();
    var period = dateDiff(stad, endd);
    var totprice = period * price;
    
    if(stad == 0 || endd == 0 || validEnterDateFormat($("#startdate")) != true || validEnterDateFormat($("#enddate")) != true) {
    	totprice = 0;
    } 
    
    var totpricecom = numberWithCommas(totprice) + "원";
    $("#totprice").text(totpricecom);
    $("#price").val(totprice);
}
$(function(){

	$("#lookupprice").click(function(){
		calc();
	});
        // 대관 시작
        $( "#startdate").datepicker({
            dayNamesMin:['일','월','화','수','목','금','토'], // 요일 변경 구문
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 변경 구문
            // 달력안에 오늘날짜로 돌리는 내용과 닫는 창을 노출시키는 필수 구문
            showButtonPanel: true, // 밑에 내용들 떄문에 써야하는 필수 구문
            currentText: '오늘 날짜', // 오늘 날짜로 돌아오는 구문 
            closeText: '닫기', // 달력창 닫기

            dateFormat: "yy-mm-dd", // 날짜 클릭시 text box에 담겨지는 순서
            yearRange: "2019:2022", // 2019년에서만 선택할 수 있게하는 구문
            minDate: "0D", //오늘 기준에서 이전거는 선택할 수 없게하는 구문
            onSelect:function(dateText, inst) {
            		calc();
            }
        });
        //대관 종료
        $("#enddate").datepicker({
            dayNamesMin:['월','화','수','목','금','토','일'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            showButtonPanel: true, 
            currentText: '오늘 날짜', 
            closeText: '닫기',
            dateFormat: "yy-mm-dd",
            yearRange: "2019:2022",
            minDate: "3D",
            onSelect:function(dateText, inst) {
            		calc();
            }
        });

});


function useEmail() {
	var a = $('#useExistEmail').prop('checked');
	console.log(a);
	var existEmail = $("#existEmail").val()
	console.log(existEmail);
	if (a == true) {
		
		$("#email").val(existEmail);
		$("#email").attr("disabled",true); //비활성화
	} else {
		$("#email").val("");
		$("#email").attr("disabled",false);
	}
}

function useTel() {
	var a = $('#useExistTel').prop('checked');
	console.log(a);
	var existEmail = $("#existTel").val()
	console.log(existEmail);
	if (a == true) {
		
		$("#tel").val(existEmail);
		$("#tel").attr("disabled",true); //비활성화
	} else {
		$("#tel").val("");
		$("#tel").attr("disabled",false);
	}
}

function selectHall() {
	var a = $('#hallnumber').val();
	console.log(a);
	calc();
}

function goSave() {
	if ($("#email").val() == "") {
		alert('이메일을 입력하세요.');
		$("#email").focus();
		return false;
	}
	if ($("#tel").val() == "") {
		alert('연락처를 입력하세요.');
		$("#tel").focus();
		return false;
	}
	if ($("#startdate").val() == "") {
		alert('대관 시작일 입력하세요.');
		$("#startdate").focus();
		return false;
	}
	if ($("#enddate").val() == "") {
		alert('대관 종료일 입력하세요.');
		$("#enddate").focus();
		return false;
	}
	
	if(!validDateFormat($("#startdate"))) return false;
	if(!validDateFormat($("#enddate"))) return false;
	
	$("#email").attr("disabled",false);
	$("#tel").attr("disabled",false);
	calc();	//예상 가격 조회
	$("#frm").submit();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
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
        <form name="frm" id="frm" action="/user/rental/process" method="post" enctype="multipart/form-data">
            <table class="con3-table">
                    <tr>
                        <th>작성자 아이디</th>
                        <td><%=umembervo.getId() %></td>
                    </tr>
                    <tr>
                        <th>회신받을 이메일 주소</th>
                        <td>
                        	<input type="text" id="email" name="email"/>&nbsp;&nbsp;
                        	<input type="checkbox" id="useExistEmail" onclick="useEmail()"/>기존 이메일 사용
                        	
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                        	<input type="text" id="tel" name="tel"/>&nbsp;&nbsp;
                        	<input type="checkbox" id="useExistTel" onclick="useTel()"/>기존 연락처 사용
                        </td>
                    </tr>
                    <tr>
                        <th>대관희망 전시관</th>
                        <td>
                        	<select name="hallnumber" id="hallnumber" onchange="selectHall()"> 
	                        	<option value="1">1전시관</option>
	                        	<option value="2">2전시관</option>
	                        	<option value="3">3전시관</option>
	                        	<option value="4">4전시관</option>
	                        	<option value="5">5전시관</option>
	                        	<option value="6">6전시관</option>
	                        	<option value="7">7전시관</option>
	                        	<option value="8">8전시관</option>
	                        	<option value="9">9전시관</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <th>대관일</th>
                        <td>
                            <label for="con3-day-start">대관시작</label>
                            <input type="text" id="startdate" name="startdate">
                            <label for="con3-day-end">대관종료</label>
                            <input type="text" id="enddate" name="enddate">
                        </td>
                    </tr>
                    <tr>
                        <th>예상요금</th>
                        <td>
                        	<span id="totprice"></span>
                        	<input type="button" value="조회하기" id="lookupprice"/>
                        	 <input type="hidden" name="price" id="price"/>
                        </td>
                    </tr>
                    <tr>
                        <th>대관 문의사항</th>
                        <td><textarea id="text-box" name="contents" placeholder="문의 내용을 입력하세요"></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <div class="con3-iconbox">
                                <input type="file" id="filename_tmp" name="filename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />
                                <input type="button" value="취소" id="resetfile"/>
                            </div>
                        </td>
                    </tr>
            </table>
                    <input type="hidden" name="cmd" value="write"/>
					<input type="hidden" name="member_pk" value="<%=umembervo.getNo()%>" />
					<input type="hidden" id="existEmail" name="existEmail" value="<%= existEmail %>" />
					<input type="hidden" id="existTel" name="existTel" value="<%= umembervo.getTel() %>" />
			</form>
            
            <div class="con3-center">
                <a class="btns" id="con3-btn" href="javascript:;" onclick="goSave();">전송하기</a>
            </div>
        </div>
        <!-- 대관신청 작성하기 끝 -->
    <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>