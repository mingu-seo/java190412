<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reserve.*"%>
<%@ page import="member.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	MemberVO loginInfo = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>예약하기</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/sub3-1.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function goSave() {
	console.log(1);
	return true;
}

$(function() {
	getReservationDoctorList();
	//getSchedList();
	
	$("#doctor_department").change(function() {
		getReservationDoctorList();
		//getSchedList();
	});
	
	$("#res_date").change(function() {
		console.log(0);
		getReservationDoctorList();
		//getSchedList();
	});
});


function getReservationDoctorList(){
	$.ajax({
		type :"GET",
		url : "/reservation/reservationDoctorList.do?date="+$("#res_date").val()+"&department="+$("#doctor_department").val(),
		async : false,
		success : function(data) {
			$(".doctor").html(data);
			$('.doc-btn').click(function(e){
		        e.preventDefault();
		        
		        // 사용자가 선택한 값 넣어주기
		        $("#confirm_res_date").text($("#res_date").val()); // 예약일
		        var idx = $('.doc-btn').index(this); // 내가 클릭한 버튼의(배열) 인덱스
		        var res_hour = $("select[name='res_hour']").eq(idx).val(); // 예약시간
		        $("#form_res_hour").val(res_hour); // 히든에 value값에 넣어주기
		        $("#confirm_res_time").text($("select[name='res_hour'] option:checked").eq(idx).text()); // 예약확인창에 시간텍스트 보여주기
		        var doctorpk = $(this).data("doctorpk"); // 의료진pk
		        $("#form_doctor_pk").val(doctorpk); // form에 넣어주고
		        $('.reservation-ck-page').stop().fadeIn(500);
		    });
		}
	});
}

function getSchedList(){
	$.ajax({
		type :"GET",
		url : "/manage/reserve/schedList?date="+$("#res_date").val()+"&doctor_pk="+$("#doctor_pk").val(),
		async : false,
		success : function(data) {
			$(".schedListArea").html(data);
		}
	});
}
$(function() {
    $( "#res_date" ).datepicker({
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         nextText: '다음 달',
         prevText: '이전 달' ,
         dateFormat: 'yy-mm-dd' 
  });
});



$(function() {
	$("#reserveInsertBtn").click(function(){
		var res_contents = $("#re-page-ck-input").val();
		$("#form_res_contents").val(res_contents);
			var data = $("#frm").serialize();
				$.ajax({
					type :"POST",
					url : "/reservation/process",
					data : data,
					async : false,
					success : function(data) {
						//alert("정상적으로 예약되었습니다.");
						getReservationDoctorList();
						getSchedList();
						$('.reservation-page').stop().fadeIn(500);
						
					}
			});
	});
});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/headHtml.jsp"%>
	<div id="container">
		<!-- con1 : 배너 사진 부분-->
		<div class="con1"></div>
		<!-- con2 : 메인 부분 -->
		<div class="con2">
		
			<!-- 예약확인창 부분 -->
			<div class="reservation-ck-page">
				<div class="headline">
					<p>예약확인</p>
					<img src="/img/icon/footer-icon.png">
				</div>
				<div class="re-page-ck-text">
					<img src="/img/con2-4.png">
					<h2>Reservation</h2>
					<p>
						<span id="confirm_res_date"></span> <span id="confirm_res_time"></span><br/>
						<span><%=loginInfo.getName()%> </span>님 예약 하시겠습니까?
					</p>
				</div>
				<div class="re-page-ck-form">
					<form method="GET" action="text.php">
						<input type="text" id="re-page-ck-input" name="res_contents"
							placeholder="예약 관련 참고사항을 작성해주세요." maxlength="30">
					</form>
				</div>
				<div class="checkbox-ck-page">
					<a class="re-check-ck-in btns" href="javascript:;" id="reserveInsertBtn">예</a>
					<a class="re-check-ck-out" href="#">아니요</a>
				</div>
			</div>
			<!-- 예약 확인 마지막창 부분 -->
			<div class="reservation-page">
				<div class="headline">
					<p>예약확인</p>
					<img src="/img/icon/footer-icon.png">
				</div>
				<div class="re-page-text">
					<img src="/img/con2-4.png">
					<h2>Reservation</h2>
					<p>
						<span id="result_res_date"></span> <span id="result_res_time"></span><br/>
						<span><%=loginInfo.getName()%> </span>님의 예약이 확정 되었습니다.
					</p>
				</div>
				<div class="checkbox-page">
					<a class="re-check-in" href="#">확인</a>
				</div>
			</div>
			
			<!-- sub bar 부분 (고정) -->
			<div class="fixed-sub">
				<div class="title-area">
					<h2>예약</h2>
					<p>Reservation</p>
				</div>
				<ul class="sub-bar">
					<li class="on"><a href="#">진료예약</a></li>
					<!-- <li><a href="sub6-3.html">예약확인</a></li> -->
				</ul>
			</div>
			
			<!-- main 부분 (여기다가 하면 됨) -->
			<div class="main">
				<h3>예약</h3>
				<p>Reservation</p>
				<form class="reservation-check clear" method="post" name="frm" id="frm" action="/reservation/process";">
					<div class="re-day-box">
						<th><span><label for="id_day" class="re-day">예약 날짜</label></span></th>
						<tr>
							<td>
								<input type="text" class="inputTitle" id="res_date"  name="res_date" value="<%=DateUtil.getToday()%>"/>&nbsp;
							</td>
						</tr>
					</div>
					<div class="major-box">
						<span><label for="id_major" class="major">진료 과목</label></span> 
						<select class="major-select"  name="doctor_department" id="doctor_department">
							<%=CodeUtil.getDoctorDepartmentOption(0)%>
						</select>
					</div>
				<input type="hidden" name="res_hour" id="form_res_hour" value=""/>			
				<input type="hidden" name="doctor_pk" id="form_doctor_pk" value=""/>
				<input type="hidden" name="tel" id="form_tel" value1="<%=loginInfo.getTel1()%> value2="<%=loginInfo.getTel2()%> value3="<%=loginInfo.getTel3()%>"/>
				<input type="hidden" name="name" id="form_name" value="<%=loginInfo.getName()%>"/>				
				<input type="hidden" name="res_contents" id="form_res_contents" value=""/>			
				<input type="hidden" name="member_pk" value="<%=loginInfo.getNo()%>"/>			
				</form>
					<div class="doctor">
					</div>
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>