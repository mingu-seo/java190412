<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypet.*" %>
<%@ page import="java.util.*"%>
<%
	MypetVO param = (MypetVO)request.getAttribute("vo");
	MypetVO data = (MypetVO)request.getAttribute("data");
   ArrayList<MypetVO> mlist = (ArrayList<MypetVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의 반려동물 정보</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/sub6-2.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<script type="text/javascript" src='/js/sub6-1.js'></script>
<script>
function goSave() {
	$("#frm").submit();
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/headHtml.jsp"%>
	<div id="container">
		<!-- con1 : 배너 사진 부분-->
		<div class="con1"></div>
		<!-- con2 : 메인 부분 -->
		<div class="con2">
			<!-- 정보수정 반려동물 부분 -->
			<div id="mypet-area">
                <div class="mypet-box">
                    <div class="mypet-head">
                        <p>반려동물 정보 수정</p>
                        <img src="/icon/footer-icon.png">
                    </div>
                    <div class="mypet-page">
                        <div class="mypet-back-arrow">
                            <a href="#"><img src="/icon/backarrow.png"><P>뒤로가기</P></a>
                        </div>
                        <form class="mypet-form" method="POST" action="/my/my-pet-edit.do" enctype="multipart/form-data">
                        	<h1 class="mypet-logo">
                            	<a href="#"><img src="/icon/logo_lightgreen.png"></a>
                        	</h1>
                            <div class="petname_box">
                                <span><label for="pet_name" class="label">My pet 이름</label></span>
                                <input type="text" maxlength="20" id="pet_name" name="name" value="" class="cover-size" placeholder="이름을 입력하세요.">
                            </div>
                            <div class="petage_box">
                                <span><label for="pet_old" class="label">My pet 나이</label></span>
                                <input type="text" maxlength="20" id="pet_old" name="age" class="cover-size" value="" placeholder="나이를 입력하세요.">
                            </div>
                            <div class="petimage_box">
                                <span><label for="pet_image" class="label">My pet 사진</label></span>
                                <input type="file" id="pet_image" name="image_tmp" class="cover-size" value="" >
                            </div>
                            <div class="petgender_box"><span>My Pet 성별</span> 
								<input type="radio" id="radio01" name="gender" value="2" ><label for="radio01" class="label">남아</label>
								<input type="radio" id="radio02" name="gender" value="1" ><label for="radio02" class="label">여아</label>
							</div>
                            <div class="petlist_box">
                                    <span><label for="pet_class"  class="label">My Pet 품종</label></span>
                                    <input type="text" maxlength="5" id="pet_class" name="breed" value="" class="cover-size">
                            </div>
                            <div class="petdoc_box">
                                <span><label for="pet_helth"  class="label">최근 접종 현황</label></span>
                                <input type="text" maxlength="5" id="pet_helth" name="vac" value="" class="cover-size">
                            </div>
                            <div class="mypet-btn clear">
                                <input type="reset" value="취소" id="btn_reset2">
                                <input type="submit" value="수정" id="btn_submit2" href="#" onclick="goSave();">
                            </div>
                        <input type="hidden" id="pet_no" name="no" value=""/>
                        </form>
                        <ul class="mypet-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div>
			<!-- 반려동물 추가부분 -->
			<div id="pet-plus">
            <div class="pet-plus-area">
                <div class="petplus-head">
                    <p>반려동물 추가</p>
                    <img src="/icon/footer-icon.png">
                </div>
                <div class="petplus-page">
                    <div class="petplus-back-arrow">
                        <a href="#"><img src="/icon/backarrow.png">
                        <P>뒤로가기</P></a>
                    </div>
                    <h1 class="petplus-logo">
                        <a href="#"><img src="/icon/logo_lightgreen.png"></a>
                    </h1>
                    <form name="frm" id="frm" method="POST" action="/my/my-pet-add.do" enctype="multipart/form-data">
                    <div class="pet-plus-box clear">
                        <div class="petplus-img">
                            <div>
                                <img src="/img/sub6-2-petimg.jpg">
                            </div>
                            <div><a href="#"><input type="file" id="image_tmp" name="image_tmp"/>파일찾기</a></div>
                        </div>
                        <div class="petplus-text">
                            <div class="petplus-form">
                                <div class="petplus_name_box">
                                    <span><label for="id_input" class="label">이름</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="name" class="cover-size2" placeholder="이름을 입력하세요.">
                                </div>
                                <div class="petplus_age_box">
                                    <span><label for="id_input" class="label">나이</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="age" class="cover-size2" placeholder="나이를 입력하세요.">
                                </div>
                                <div class="petplus_gender_box"><span><label for="id_input" class="label">성별</label></span>
									<input type="radio" id="radio01" name="gender" value="2" ><label for="radio01" class="label">남아</label>
									<input type="radio" id="radio02" name="gender" value="1" ><label for="radio02" class="label">여아</label>
								</div><br>
                                <div class="petplus_list_box">
                                    <span><label for="id_input" class="label">품종</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="breed" class="cover-size2" placeholder="ex ) 도베르만">
                                </div>
                                <div class="petplus_doc_box">
                                    <span><label for="id_input" class="label">최근 접종 현황</label></span>
                                    <input type="text" maxlength="20" id="id_input" name="vac" class="cover-size2">
                                </div>
                            </div>
                               </div>
                    </div>
                    <input type="hidden" id="no" name="member_pk" value="<%=memberInfo.getNo()%>"/>
                            </form>
                     
                    <div class="bot-plus">
                        <div class="petplus-form-btn">
                            <div class="petplus-btn clear">
                                <input type="reset" value="취소" id="btn_reset3">
                                <input type="button" value="반려동물 추가" id="btn_submit3" onclick="goSave();">
                            </div>
                        </div>
                        <ul class="petplus-bot clear">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
			<!-- sub bar 부분 (고정) -->
			<div class="fixed-sub">
				<div class="title-area">
					<h2>마이페이지</h2>
					<p>my page</p>
				</div>
				<ul class="sub-bar">
					<li><a href="/my/my-infor.do">나의 정보</a></li>
					<li class="on"><a href="/my/my-pet.do">반려동물 정보</a></li>
					<li><a href="/my/my-res.do">예약확인</a></li>
					<li><a href="/my/my-ask.do">문의내역</a></li>
				</ul>
			</div>
			<!-- main 부분 (여기다가 하면 됨) -->
			<div class="main">
				<h3>나의 반려동물</h3>
				<p>My Pet</p>
				<!-- 펫 -->
				<div class="sub6-pet clear">
					<div class="sub6-text clear">
						<a class="pet-plus-more" href="#">반려동물추가</a>
					</div>
					<%
						for (int i = 0; i < mlist.size(); i++) {
					%>
					<div class="pet-box-center">
						<div class="pet-box clear">
							<div>
								<img src="/upload/mypet/<%=mlist.get(i).getMypet_image()%>">
							</div>
							<div>
								<p><span>이름</span><%=mlist.get(i).getName()%></p>
								<p><span>나이</span><%=mlist.get(i).getAge()%></p>
								<p><span>품종</span><%=mlist.get(i).getBreed()%></p>
								<p><span>성별</span><%=mlist.get(i).getGender() !=1 ? "남아":"여아"%></p>
								<p><span>최근 접종 현황</span><%=mlist.get(i).getVac()%></p>
							</div>
							<div>
								<div class="sub6-more">
									<a href="javascript:;" onclick="getPetEditAjax(<%=mlist.get(i).getNo()%>);">EDIT</a>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<div class="sub6-botbox">
					<p>
						<span><%=memberInfo.getName()%></span> 님의 다음 진료 / 접종 예정일은 2019 년 06 월 20 일 입니다.
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>

function getPetEdit(no) {
	$.ajax({
		type : "POST",
		url : "/my/my-pet-edit.do?no="+no,
		async : false,
		success : function(data) {
			$("#mypet-area").html(data);
			$('#mypet-area').stop().fadeIn(500);
			$('.mypet-back-arrow, #btn_reset2, .mypet-head img').click(function(e){
			    e.preventDefault();
			    $('#mypet-area').stop().fadeOut(500);
			});
		}
	});
}

function getPetEditAjax(no) {
	$.ajax({
		type : "POST",
		url : "/my/my-pet-editJson.do?no="+no,
		async : false,
		dataType:'JSON',
		success : function(data) {
			//console.log(data.name);
			$("#pet_name").val(data.name);
			$("#pet_old").val(data.age);
			$("#pet_class").val(data.breed);
			$("#pet_helth").val(data.vac);
			$("#pet_no").val(data.no);
			
			// 성별
			if (data.gender == '2') {
				$("input[name='gender']").eq(0).attr("checked","true");
			} else {
				$("input[name='gender']").eq(1).attr("checked","true");
			}
			
			
			$('#mypet-area').stop().fadeIn(500);
		}
	});
}
</script>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>